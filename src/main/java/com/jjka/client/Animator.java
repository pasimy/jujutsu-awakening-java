package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Actor;
import com.jjka.bedrock.Molang;
import com.jjka.bedrock.Queries;

import net.minecraft.client.Minecraft;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.phys.Vec3;

/**
 * One entity's animation state: the client entity's scripts.animate list (animations and controllers with their
 * weights), animations started by /playanimation, the Molang variables, and timeline effects (particles, sounds).
 */
public final class Animator implements Molang.Scope {
	final Entity entity;
	final JsonObject desc;
	final Map<String, String> names = new HashMap<>();
	final Map<String, Object> variables = new HashMap<>(), temps = new HashMap<>(), context = new HashMap<>();
	private final Map<String, Inst> insts = new HashMap<>();
	private final Map<String, Ctrl> ctrls = new HashMap<>();
	private final List<Runtime> runtime = new ArrayList<>();
	private double animTime, deltaTime, now;
	private boolean initialized;
	private Map<String, Inst> stateScope;
	/** where the locators were last frame (world space) */
	public final Map<String, Vec3> locators = new HashMap<>();

	static final class Inst {
		final Anim anim;
		double time, delay;
		boolean done, completed, started;

		Inst(Anim a) { anim = a; }
	}

	static final class Ctrl {
		String state;
		final Map<String, Inst> insts = new HashMap<>();
	}

	static final class Runtime {
		final Inst inst;
		final Molang.Expr stop;
		final String controller;
		final double blendOut;
		double fading = -1;

		Runtime(Inst i, Molang.Expr stop, String controller, double blendOut) { inst = i; this.stop = stop; this.controller = controller; this.blendOut = blendOut; }
	}

	public Animator(Entity e, JsonObject desc) {
		entity = e;
		this.desc = desc;
		if (desc != null && desc.has("animations")) for (var a : desc.getAsJsonObject("animations").entrySet()) names.put(a.getKey(), a.getValue().getAsString());
	}

	// ------------------------------------------------------------------ Molang
	@Override
	public Object query(String name, Object[] args) {
		switch (name) {
			case "anim_time": return animTime;
			case "delta_time": return deltaTime;
			case "life_time": return now;
			case "all_animations_finished": { if (stateScope == null) return 1.0; for (Inst i : stateScope.values()) if (!i.done) return 0.0; return 1.0; }
			case "any_animation_finished": { if (stateScope == null) return 0.0; for (Inst i : stateScope.values()) if (i.done) return 1.0; return 0.0; }
			case "is_first_person": return entity == Minecraft.getInstance().getCameraEntity() && Minecraft.getInstance().options.getCameraType().isFirstPerson() ? 1.0 : 0.0;
			case "distance_from_camera": return Minecraft.getInstance().gameRenderer.getMainCamera().getPosition().distanceTo(entity.position());
			case "modified_move_speed": return entity instanceof LivingEntity l ? (double) l.walkAnimation.speed() : 0.0;
			case "modified_distance_moved": return entity instanceof LivingEntity l ? (double) l.walkAnimation.position() : 0.0;
			case "target_x_rotation": return (double) entity.getXRot();
			case "target_y_rotation": case "head_y_rotation": return entity instanceof LivingEntity l ? (double) net.minecraft.util.Mth.wrapDegrees(l.getYHeadRot() - l.yBodyRot) : 0.0;
			case "camera_rotation": { var c = Minecraft.getInstance().gameRenderer.getMainCamera(); return args.length > 0 && Molang.num(args[0]) == 1 ? (double) c.getYRot() : (double) c.getXRot(); }
			case "is_in_ui": return 0.0;
			case "time_of_day": return entity.level().getTimeOfDay(1f) * 1.0;
			default: return Queries.query(entity, Actor.of(entity), name, args);
		}
	}

	@Override public Map<String, Object> vars(char kind) { return kind == 'v' ? variables : kind == 't' ? temps : context; }

	@Override
	public Object other(String name) {
		// Geometry.x / Texture.x / Material.x / Array.x are answered by the renderer through RenderScope
		return null;
	}

	// ------------------------------------------------------------------ running scripts
	void scripts(String key) {
		if (desc == null || !desc.has("scripts")) return;
		JsonObject s = desc.getAsJsonObject("scripts");
		JsonElement e = s.get(key);
		if (e == null) return;
		if (e.isJsonArray()) for (JsonElement x : e.getAsJsonArray()) Molang.compile(x.getAsString()).eval(this);
		else if (e.isJsonPrimitive()) Molang.compile(e.getAsString()).eval(this);
	}

	double scale() {
		if (desc == null || !desc.has("scripts")) return 1;
		JsonElement s = desc.getAsJsonObject("scripts").get("scale");
		return s == null ? 1 : Molang.eval(s, this);
	}

	/** stops long poses (a domain's hand sign holds for its whole 38 seconds) once they've run this long */
	void endLongPoses(double seconds) { runtime.removeIf(r -> r.inst.time > seconds && r.inst.anim.length > seconds + 2); }

	// ------------------------------------------------------------------ playanimation
	public void play(String anim, String next, float blendOut, String stop, String controller) {
		Anim a = Anim.get(names.getOrDefault(anim, anim));
		if (a == null) { com.jjka.bedrock.Bedrock.warnOnce("anim", "No animation " + anim); return; }
		String ctl = controller == null || controller.isEmpty() ? "__runtime_controller" : controller;
		runtime.removeIf(r -> r.controller.equals(ctl));
		Molang.Expr stopExpr = stop == null || stop.isEmpty() ? null : Molang.compile(stop);
		runtime.add(new Runtime(new Inst(a), stopExpr, ctl, blendOut));
	}

	// ------------------------------------------------------------------ the frame
	/** Works out this frame's pose: bone -> {rx,ry,rz, px,py,pz, sx,sy,sz} (Bedrock units) */
	public Map<String, float[]> frame(float partial) {
		double t = (entity.tickCount + partial) / 20.0;
		deltaTime = initialized ? Math.max(0, Math.min(0.25, t - now)) : 0;
		now = t;
		if (!initialized) { initialized = true; scripts("initialize"); }
		scripts("pre_animation");
		Map<String, float[]> pose = new LinkedHashMap<>();
		if (desc != null && desc.has("scripts") && desc.getAsJsonObject("scripts").has("animate")) {
			for (JsonElement e : desc.getAsJsonObject("scripts").getAsJsonArray("animate")) {
				String key;
				double w = 1;
				if (e.isJsonPrimitive()) key = e.getAsString();
				else {
					var en = e.getAsJsonObject().entrySet().iterator().next();
					key = en.getKey();
					w = Molang.eval(en.getValue(), this);
				}
				if (w <= 0) continue;
				run(key, (float) w, pose);
			}
		}
		for (Iterator<Runtime> it = runtime.iterator(); it.hasNext();) {
			Runtime r = it.next();
			advance(r.inst);
			// Bedrock's default stop expression is query.any_animation_finished: one play through, even for looping ones
			stateScope = new HashMap<>();
			if (r.inst.completed) r.inst.done = true;
			stateScope.put("runtime", r.inst);
			boolean stopNow = r.stop != null ? Molang.truth(r.stop.eval(this)) : r.inst.completed;
			stateScope = null;
			if (stopNow) { it.remove(); continue; }
			animTime = r.inst.time;
			r.inst.anim.apply(this, r.inst.time, 1f, pose);
		}
		last = pose;
		return pose;
	}

	private Map<String, float[]> last = new LinkedHashMap<>();

	/** the pose the last frame() worked out */
	public Map<String, float[]> lastPose() { return last; }

	private void run(String key, float w, Map<String, float[]> pose) {
		String id = names.getOrDefault(key, key);
		if (id.startsWith("controller.")) { controller(id, w, pose); return; }
		Anim a = Anim.get(id);
		if (a == null) return;
		Inst i = insts.computeIfAbsent(key, k -> new Inst(a));
		advance(i);
		if (i.done && a.loop.equals("false")) return;
		animTime = i.time;
		float bw = a.blendWeight == null ? 1 : (float) Molang.num(a.blendWeight.eval(this));
		a.apply(this, i.time, w * bw, pose);
	}

	private void controller(String id, float w, Map<String, float[]> pose) {
		JsonObject c = Rp.controller(id);
		if (c == null || !c.has("states")) return;
		JsonObject states = c.getAsJsonObject("states");
		Ctrl ctl = ctrls.computeIfAbsent(id, k -> new Ctrl());
		if (ctl.state == null || !states.has(ctl.state)) {
			ctl.state = c.has("initial_state") ? c.get("initial_state").getAsString() : "default";
			enter(states.getAsJsonObject(ctl.state));
		}
		JsonObject st = states.getAsJsonObject(ctl.state);
		if (st == null) return;
		stateScope = ctl.insts;
		if (st.has("transitions")) for (JsonElement tr : st.getAsJsonArray("transitions")) {
			if (!tr.isJsonObject()) continue;
			var en = tr.getAsJsonObject().entrySet().iterator().next();
			if (!states.has(en.getKey()) || !Molang.truth(Molang.of(en.getValue()).eval(this))) continue;
			run(st, "on_exit");
			ctl.state = en.getKey();
			ctl.insts.clear();
			st = states.getAsJsonObject(ctl.state);
			enter(st);
			break;
		}
		stateScope = ctl.insts;
		if (st.has("animations")) for (JsonElement e : st.getAsJsonArray("animations")) {
			String key;
			double aw = 1;
			if (e.isJsonPrimitive()) key = e.getAsString();
			else {
				var en = e.getAsJsonObject().entrySet().iterator().next();
				key = en.getKey();
				aw = Molang.eval(en.getValue(), this);
			}
			if (aw <= 0) continue;
			String aid = names.getOrDefault(key, key);
			if (aid.startsWith("controller.")) { controller(aid, (float) (w * aw), pose); stateScope = ctl.insts; continue; }
			Anim a = Anim.get(aid);
			if (a == null) continue;
			Inst i = ctl.insts.computeIfAbsent(key, k -> new Inst(a));
			advance(i);
			if (i.done && a.loop.equals("false")) continue;
			animTime = i.time;
			a.apply(this, i.time, (float) (w * aw), pose);
		}
		stateScope = null;
	}

	private void enter(JsonObject st) {
		if (st == null) return;
		run(st, "on_entry");
		if (st.has("particle_effects")) for (JsonElement p : st.getAsJsonArray("particle_effects")) if (p.isJsonObject()) particle(p.getAsJsonObject());
		if (st.has("sound_effects")) for (JsonElement p : st.getAsJsonArray("sound_effects")) if (p.isJsonObject()) sound(p.getAsJsonObject());
	}

	private void run(JsonObject st, String key) {
		if (st == null || !st.has(key)) return;
		for (JsonElement x : st.getAsJsonArray(key)) {
			String s = x.getAsString();
			if (!s.startsWith("/") && !s.startsWith("@")) Molang.compile(s).eval(this);
		}
	}

	/** Moves an animation on by this frame and fires the timeline events it passed */
	private void advance(Inst i) {
		Anim a = i.anim;
		double prev = i.time;
		// the first frame includes time 0: effects keyed at "0.0" (most of the add-on's orbs and auras) go off too
		if (!i.started) { i.started = true; prev = -1e-9; }
		if (a.timeUpdate != null) { animTime = i.time; i.time = Molang.num(a.timeUpdate.eval(this)); }
		else i.time += deltaTime;
		if (a.length > 0 && i.time >= a.length) {
			i.completed = true;
			if (a.loop.equals("true")) {
				fire(a, prev, a.length);
				i.time = i.time % a.length;
				prev = -1e-9;
			} else {
				if (!i.done) fire(a, prev, a.length + 1e-6);
				i.time = a.length;
				i.done = true;
				return;
			}
		} else if (a.length <= 0 && !a.loop.equals("true") && a.bones.isEmpty()) i.done = i.completed = true;
		else if (a.length <= 0 && i.time > 0) i.completed = true;
		fire(a, prev, i.time);
	}

	private void fire(Anim a, double from, double to) {
		if (to <= from && !(from < 0)) return;
		for (var e : a.particles.subMap(from, false, to, true).entrySet()) for (JsonObject p : e.getValue()) particle(p);
		if (from < 0) for (var e : a.particles.subMap(0.0, true, 0.0, true).entrySet()) for (JsonObject p : e.getValue()) particle(p);
		for (var e : a.sounds.subMap(from, false, to, true).entrySet()) for (JsonObject p : e.getValue()) sound(p);
		for (var e : a.timeline.subMap(from, false, to, true).entrySet()) for (String s : e.getValue()) if (!s.startsWith("/") && !s.startsWith("@")) Molang.compile(s).eval(this);
	}

	private void particle(JsonObject p) {
		if (desc == null || !p.has("effect")) return;
		JsonObject effects = desc.has("particle_effects") ? desc.getAsJsonObject("particle_effects") : null;
		String id = effects != null && effects.has(p.get("effect").getAsString()) ? effects.get(p.get("effect").getAsString()).getAsString() : p.get("effect").getAsString();
		String loc = p.has("locator") ? p.get("locator").getAsString() : null;
		Vec3 at = loc != null && locators.containsKey(loc) ? locators.get(loc) : entity.position();
		Particles.spawn(id, at, loc != null && p.has("bind_to_actor") && !p.get("bind_to_actor").getAsBoolean() ? null : entity, loc);
	}

	private void sound(JsonObject s) {
		if (desc == null || !s.has("effect") || !desc.has("sound_effects")) return;
		JsonElement def = desc.getAsJsonObject("sound_effects").get(s.get("effect").getAsString());
		if (def == null) return;
		String name = def.isJsonObject() ? def.getAsJsonObject().get("sound").getAsString() : def.getAsString();
		var rl = com.jjka.bedrock.Sounds.java(name);
		if (rl == null) return;
		var ev = net.minecraft.sounds.SoundEvent.createVariableRangeEvent(rl);
		entity.level().playLocalSound(entity.getX(), entity.getY(), entity.getZ(), ev, net.minecraft.sounds.SoundSource.NEUTRAL, 1, 1, false);
	}

	// ------------------------------------------------------------------ one per entity
	private static final Map<Entity, Animator> ALL = new java.util.WeakHashMap<>();

	public static Animator of(Entity e, JsonObject desc) {
		Animator a = ALL.get(e);
		if (a == null || a.desc != desc) { a = new Animator(e, desc); ALL.put(e, a); }
		return a;
	}

	public static Animator peek(Entity e) { return ALL.get(e); }
}
