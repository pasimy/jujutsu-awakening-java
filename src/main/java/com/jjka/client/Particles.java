package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.joml.Matrix4f;
import org.joml.Vector3f;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Bedrock;
import com.jjka.bedrock.Molang;
import com.mojang.blaze3d.platform.GlStateManager;
import com.mojang.blaze3d.systems.RenderSystem;
import com.mojang.blaze3d.vertex.BufferBuilder;
import com.mojang.blaze3d.vertex.DefaultVertexFormat;
import com.mojang.blaze3d.vertex.PoseStack;
import com.mojang.blaze3d.vertex.Tesselator;
import com.mojang.blaze3d.vertex.VertexFormat;

import net.minecraft.client.Camera;
import net.minecraft.client.Minecraft;
import net.minecraft.client.renderer.GameRenderer;
import net.minecraft.core.BlockPos;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.phys.Vec3;

/**
 * Bedrock particle effects, run from the resource pack's particle files: emitters (rate, shape, lifetime), particles (speed,
 * spin, drag, acceleration, collision), billboards (every facing mode, flipbooks), tinting gradients, curves and events.
 */
public final class Particles {
	private Particles() {}

	static final int MAX = 30000;
	private static final List<Emitter> EMITTERS = new ArrayList<>(), PENDING = new ArrayList<>();
	private static int count;
	private static final java.util.Random RNG = new java.util.Random();

	// ------------------------------------------------------------------ definitions
	static final class Def {
		final String id;
		final ResourceLocation texture;
		final String material;
		final JsonObject c;
		final JsonObject events;
		final Map<String, JsonObject> curves = new HashMap<>();

		Def(String id, JsonObject pe) {
			this.id = id;
			JsonObject d = pe.getAsJsonObject("description");
			JsonObject brp = d.has("basic_render_parameters") ? d.getAsJsonObject("basic_render_parameters") : new JsonObject();
			String tex = brp.has("texture") ? brp.get("texture").getAsString() : "textures/particle/particles";
			texture = BedrockRenderer.texture(tex);
			material = brp.has("material") ? brp.get("material").getAsString() : "particles_alpha";
			c = pe.has("components") ? pe.getAsJsonObject("components") : new JsonObject();
			events = pe.has("events") ? pe.getAsJsonObject("events") : new JsonObject();
			if (pe.has("curves")) for (var cv : pe.getAsJsonObject("curves").entrySet()) curves.put(cv.getKey().toLowerCase(java.util.Locale.ROOT).replaceFirst("^(variable|v)\\.", ""), cv.getValue().getAsJsonObject());
		}

		JsonObject comp(String name) { JsonElement e = c.get(name); return e != null && e.isJsonObject() ? e.getAsJsonObject() : null; }
	}

	private static final Map<String, Def> DEFS = new HashMap<>();

	static Def def(String id) {
		String k = Bedrock.id(id);
		if (DEFS.containsKey(k)) return DEFS.get(k);
		JsonObject j = Rp.particle(k);
		Def d = null;
		if (j != null) try { d = new Def(k, j); } catch (RuntimeException e) { Bedrock.warnOnce("particle", "Bad particle " + k + ": " + e); }
		DEFS.put(k, d);
		return d;
	}

	// ------------------------------------------------------------------ spawning
	/** A particle command or an animation effect */
	public static void spawn(String id, Vec3 at, Entity bound, String locator) {
		if (id.startsWith("minecraft:") && def(id) == null) { vanilla(id, at); return; }
		Def d = def(id);
		if (d == null) { Bedrock.warnOnce("particle", "No particle " + id); return; }
		if (EMITTERS.size() + PENDING.size() > 2000) return;
		// (an effect can start another one while emitters are updating; those join after the loop)
		PENDING.add(new Emitter(d, at, bound, locator));
	}

	private static void vanilla(String id, Vec3 at) {
		var level = Minecraft.getInstance().level;
		if (level == null) return;
		net.minecraft.core.particles.ParticleOptions o = switch (id) {
			case "minecraft:huge_explosion_emitter", "minecraft:huge_explosion_lab_misc_emitter" -> net.minecraft.core.particles.ParticleTypes.EXPLOSION_EMITTER;
			case "minecraft:large_explosion", "minecraft:explosion_particle" -> net.minecraft.core.particles.ParticleTypes.EXPLOSION;
			case "minecraft:critical_hit_emitter" -> net.minecraft.core.particles.ParticleTypes.CRIT;
			case "minecraft:totem_particle" -> net.minecraft.core.particles.ParticleTypes.TOTEM_OF_UNDYING;
			case "minecraft:lava_particle" -> net.minecraft.core.particles.ParticleTypes.LAVA;
			case "minecraft:basic_flame_particle" -> net.minecraft.core.particles.ParticleTypes.FLAME;
			case "minecraft:soul_particle" -> net.minecraft.core.particles.ParticleTypes.SOUL;
			case "minecraft:sonic_explosion" -> net.minecraft.core.particles.ParticleTypes.SONIC_BOOM;
			case "minecraft:dragon_breath_trail", "minecraft:dragon_breath_fire" -> net.minecraft.core.particles.ParticleTypes.DRAGON_BREATH;
			case "minecraft:endrod" -> net.minecraft.core.particles.ParticleTypes.END_ROD;
			case "minecraft:large_smoke", "minecraft:basic_smoke_particle" -> net.minecraft.core.particles.ParticleTypes.LARGE_SMOKE;
			case "minecraft:knockback_roar_particle" -> net.minecraft.core.particles.ParticleTypes.CLOUD;
			case "minecraft:shulker_bullet" -> net.minecraft.core.particles.ParticleTypes.END_ROD;
			default -> net.minecraft.core.particles.ParticleTypes.POOF;
		};
		level.addParticle(o, at.x, at.y, at.z, 0, 0, 0);
	}

	public static void clear() { EMITTERS.clear(); PENDING.clear(); count = 0; }

	// ------------------------------------------------------------------ Molang scope for one emitter / particle
	static class Scope implements Molang.Scope {
		final Map<String, Object> vars = new HashMap<>(), temps = new HashMap<>();
		final Entity entity;

		Scope(Entity entity) { this.entity = entity; }

		@Override public Object query(String name, Object[] args) { return entity == null ? null : com.jjka.bedrock.Queries.query(entity, com.jjka.bedrock.Actor.of(entity), name, args); }
		@Override public Map<String, Object> vars(char kind) { return kind == 't' ? temps : vars; }
	}

	/** A particle reads its own variables first, then its emitter's */
	static final class PScope extends Scope {
		final Emitter em;
		PScope(Emitter em) { super(em.bound); this.em = em; }
		@Override public Map<String, Object> vars(char kind) {
			if (kind == 't') return temps;
			return new MergedMap(vars, em.scope.vars);
		}
	}

	@SuppressWarnings("serial")
	static final class MergedMap extends HashMap<String, Object> {
		final Map<String, Object> own, parent;
		MergedMap(Map<String, Object> own, Map<String, Object> parent) { this.own = own; this.parent = parent; }
		@Override public Object get(Object k) { Object v = own.get(k); return v != null ? v : parent.get(k); }
		@Override public Object put(String k, Object v) { return own.put(k, v); }
	}

	static double eval(JsonElement e, Molang.Scope s, double fallback) { return e == null ? fallback : Molang.eval(e, s); }

	static float[] vec(JsonElement e, Molang.Scope s, float fallback) {
		if (e == null) return new float[] { fallback, fallback, fallback };
		if (e.isJsonArray()) {
			JsonArray a = e.getAsJsonArray();
			float[] v = new float[Math.max(3, a.size())];
			for (int i = 0; i < a.size(); i++) v[i] = (float) Molang.eval(a.get(i), s);
			return v;
		}
		float x = (float) Molang.eval(e, s);
		return new float[] { x, x, x };
	}

	/** curves: "variable.name" from {type, input, horizontal_range, nodes} */
	static void curves(Def d, Molang.Scope s) {
		for (var c : d.curves.entrySet()) {
			JsonObject cv = c.getValue();
			double in = eval(cv.get("input"), s, 0), range = eval(cv.get("horizontal_range"), s, 1);
			double t = range == 0 ? 0 : in / range;
			String type = cv.has("type") ? cv.get("type").getAsString() : "linear";
			JsonElement nodes = cv.get("nodes");
			double v = 0;
			if (nodes != null && nodes.isJsonArray()) {
				JsonArray n = nodes.getAsJsonArray();
				int k = n.size();
				if (k > 0) {
					double[] y = new double[k];
					for (int i = 0; i < k; i++) y[i] = Molang.eval(n.get(i), s);
					t = Math.max(0, Math.min(1, t));
					if (type.equals("bezier") && k == 4) {
						double u = 1 - t;
						v = u * u * u * y[0] + 3 * u * u * t * y[1] + 3 * u * t * t * y[2] + t * t * t * y[3];
					} else if (type.equals("catmull_rom") && k >= 4) {
						double seg = t * (k - 3);
						int i = Math.min(k - 4, (int) Math.floor(seg));
						double f = seg - i;
						v = catmull(y[i], y[i + 1], y[i + 2], y[i + 3], f);
					} else {
						double seg = t * (k - 1);
						int i = Math.min(k - 2, (int) Math.floor(seg));
						if (k == 1) v = y[0];
						else v = y[i] + (y[i + 1] - y[i]) * (seg - i);
					}
				}
			} else if (nodes != null && nodes.isJsonObject()) {
				// bezier_chain: {"0.0": {value | left_value/right_value, slope ...}}
				TreeMap<Double, Double> pts = new TreeMap<>();
				for (var e : nodes.getAsJsonObject().entrySet()) {
					JsonObject o = e.getValue().getAsJsonObject();
					pts.put(Double.parseDouble(e.getKey()), o.has("value") ? o.get("value").getAsDouble() : o.has("left_value") ? o.get("left_value").getAsDouble() : 0);
				}
				var lo = pts.floorEntry(t);
				var hi = pts.ceilingEntry(t);
				if (lo == null) v = hi == null ? 0 : hi.getValue();
				else if (hi == null || hi.getKey().equals(lo.getKey())) v = lo.getValue();
				else v = lo.getValue() + (hi.getValue() - lo.getValue()) * (t - lo.getKey()) / (hi.getKey() - lo.getKey());
			}
			s.vars('v').put(c.getKey(), v);
		}
	}

	static double catmull(double p0, double p1, double p2, double p3, double t) {
		double t2 = t * t, t3 = t2 * t;
		return 0.5 * (2 * p1 + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2 + (-p0 + 3 * p1 - 3 * p2 + p3) * t3);
	}

	// ------------------------------------------------------------------ emitter
	static final class Emitter {
		final Def d;
		Vec3 origin;
		final Entity bound;
		final String locator;
		final Scope scope;
		final List<P> particles = new ArrayList<>();
		double age, lifetime = 1, sleep, spawnAcc;
		boolean active = true, expired, instantDone;
		final double activeTime;
		final double looping;
		int timelineFired = -1;
		/** minecraft:emitter_local_space: particles ride along with the emitter / turn with the entity it's on */
		final boolean localPos, localRot;
		double yaw, pitch;

		Emitter(Def d, Vec3 at, Entity bound, String locator) {
			this.d = d;
			origin = at;
			this.bound = bound;
			this.locator = locator;
			scope = new Scope(bound);
			JsonObject ls = d.comp("minecraft:emitter_local_space");
			localPos = ls != null && ls.has("position") && ls.get("position").getAsBoolean();
			localRot = ls != null && ls.has("rotation") && ls.get("rotation").getAsBoolean();
			facing();
			for (int i = 1; i <= 4; i++) scope.vars.put("emitter_random_" + i, RNG.nextDouble());
			scope.vars.put("emitter_age", 0.0);
			JsonObject init = d.comp("minecraft:emitter_initialization");
			if (init != null && init.has("creation_expression")) Molang.compile(init.get("creation_expression").getAsString()).eval(scope);
			JsonObject once = d.comp("minecraft:emitter_lifetime_once"), loop = d.comp("minecraft:emitter_lifetime_looping");
			if (once != null) { activeTime = eval(once.get("active_time"), scope, 10); looping = -1; }
			else if (loop != null) { activeTime = eval(loop.get("active_time"), scope, 10); looping = eval(loop.get("sleep_time"), scope, 0); }
			else { activeTime = Double.MAX_VALUE; looping = -1; }
			scope.vars.put("emitter_lifetime", activeTime);
			event("creation_event", d.comp("minecraft:emitter_lifetime_events"), origin);
		}

		void event(String key, JsonObject lifeEvents, Vec3 at) {
			if (lifeEvents == null || !lifeEvents.has(key)) return;
			JsonElement e = lifeEvents.get(key);
			if (e.isJsonArray()) for (JsonElement x : e.getAsJsonArray()) runEvent(x.getAsString(), at);
			else runEvent(e.getAsString(), at);
		}

		void runEvent(String name, Vec3 at) {
			JsonElement ev = d.events.get(name);
			if (ev != null && ev.isJsonObject()) runEvent(ev.getAsJsonObject(), at, 0);
		}

		void runEvent(JsonObject ev, Vec3 at, int depth) {
			if (depth > 8) return;
			if (ev.has("particle_effect")) {
				JsonObject pe = ev.getAsJsonObject("particle_effect");
				if (pe.has("effect")) {
					if (pe.has("pre_effect_script")) Molang.compile(pe.get("pre_effect_script").getAsString()).eval(scope);
					Particles.spawn(pe.get("effect").getAsString(), at, null, null);
				}
			}
			if (ev.has("expression")) Molang.compile(ev.get("expression").getAsString()).eval(scope);
			if (ev.has("sound_effect")) {
				JsonObject se = ev.getAsJsonObject("sound_effect");
				if (se.has("event_name")) {
					var rl = com.jjka.bedrock.Sounds.java(se.get("event_name").getAsString());
					if (rl != null && Minecraft.getInstance().level != null)
						Minecraft.getInstance().level.playLocalSound(at.x, at.y, at.z, net.minecraft.sounds.SoundEvent.createVariableRangeEvent(rl), net.minecraft.sounds.SoundSource.AMBIENT, 1, 1, false);
				}
			}
			if (ev.has("sequence")) for (JsonElement x : ev.getAsJsonArray("sequence")) if (x.isJsonObject()) runEvent(x.getAsJsonObject(), at, depth + 1);
			if (ev.has("randomize")) {
				JsonArray opts = ev.getAsJsonArray("randomize");
				double total = 0;
				for (JsonElement o : opts) total += o.getAsJsonObject().has("weight") ? o.getAsJsonObject().get("weight").getAsDouble() : 1;
				double r = RNG.nextDouble() * total;
				for (JsonElement o : opts) {
					r -= o.getAsJsonObject().has("weight") ? o.getAsJsonObject().get("weight").getAsDouble() : 1;
					if (r <= 0) { runEvent(o.getAsJsonObject(), at, depth + 1); break; }
				}
			}
		}

		/** the emitter's frame: the entity it's on, facing its way (+z forward, like Bedrock) */
		void facing() {
			if (bound == null || bound.isRemoved()) return;
			if (bound instanceof net.minecraft.world.entity.LivingEntity l) { yaw = l.yBodyRot; pitch = 0; }
			else { yaw = bound.getYRot(); pitch = bound.getXRot(); }
		}

		/** a direction in the emitter's frame -> the world */
		Vec3 turn(Vec3 v) {
			if (!localRot || bound == null) return v;
			return v.xRot((float) Math.toRadians(-pitch)).yRot((float) Math.toRadians(-yaw));
		}

		Vec3 where() {
			if (bound != null && !bound.isRemoved()) {
				Animator a = Animator.peek(bound);
				if (locator != null && a != null && a.locators.containsKey(locator)) return a.locators.get(locator);
				return bound.position();
			}
			return origin;
		}

		/** false when it's finished and has no particles left */
		boolean update(double dt) {
			if (bound != null && !bound.isRemoved()) { origin = where(); facing(); }
			age += dt;
			scope.vars.put("emitter_age", age);
			curves(d, scope);
			JsonObject init = d.comp("minecraft:emitter_initialization");
			if (init != null && init.has("per_update_expression")) Molang.compile(init.get("per_update_expression").getAsString()).eval(scope);
			JsonObject expr = d.comp("minecraft:emitter_lifetime_expression");
			if (expr != null) {
				active = Molang.truth(Molang.of(expr.get("activation_expression")).eval(scope));
				if (expr.has("expiration_expression") && Molang.truth(Molang.of(expr.get("expiration_expression")).eval(scope))) expired = true;
			} else if (looping >= 0) {
				double cycle = activeTime + looping;
				double t = cycle <= 0 ? 0 : age % cycle;
				boolean was = active;
				active = t < activeTime;
				if (active && !was) { instantDone = false; scope.vars.put("emitter_age", 0.0); }
			} else {
				active = age < activeTime;
				if (!active) expired = true;
			}
			if (bound != null && bound.isRemoved()) expired = true;
			if (active && !expired) emit(dt);
			for (Iterator<P> it = particles.iterator(); it.hasNext();) {
				P p = it.next();
				if (!p.update(dt)) { it.remove(); count--; }
			}
			if (expired && particles.isEmpty()) { event("expiration_event", d.comp("minecraft:emitter_lifetime_events"), origin); return false; }
			return true;
		}

		void emit(double dt) {
			JsonObject inst = d.comp("minecraft:emitter_rate_instant"), steady = d.comp("minecraft:emitter_rate_steady");
			int n = 0;
			if (inst != null) {
				if (!instantDone) { n = (int) Math.round(eval(inst.get("num_particles"), scope, 10)); instantDone = true; }
			} else if (steady != null) {
				double rate = eval(steady.get("spawn_rate"), scope, 1), max = eval(steady.get("max_particles"), scope, 50);
				spawnAcc += rate * dt;
				n = (int) spawnAcc;
				spawnAcc -= n;
				n = (int) Math.max(0, Math.min(n, max - particles.size()));
			}
			n = Math.min(n, 1000);
			for (int i = 0; i < n && count < MAX; i++) { particles.add(new P(this)); count++; }
		}
	}

	// ------------------------------------------------------------------ particle
	static final class P {
		final Emitter em;
		final PScope s;
		Vec3 pos, vel;
		/** with local position: where it is relative to the emitter, in the emitter's frame */
		Vec3 rel;
		double age, life, rot, rotRate;
		Vec3 dir;

		P(Emitter em) {
			this.em = em;
			s = new PScope(em);
			Def d = em.d;
			for (int i = 1; i <= 4; i++) s.vars.put("particle_random_" + i, RNG.nextDouble());
			s.vars.put("particle_age", 0.0);
			JsonObject lt = d.comp("minecraft:particle_lifetime_expression");
			life = lt == null ? 1 : eval(lt.get("max_lifetime"), s, 1);
			s.vars.put("particle_lifetime", life);
			Vec3[] pd = shape(d, s);
			dir = pd[1];
			JsonObject sp = d.comp("minecraft:particle_initial_speed");
			JsonElement speed = d.c.get("minecraft:particle_initial_speed");
			if (speed != null && speed.isJsonArray()) { float[] v = vec(speed, s, 0); vel = new Vec3(v[0], v[1], v[2]); }
			else { double spd = speed == null ? 0 : speed.isJsonObject() ? 0 : Molang.eval(speed, s); vel = dir.normalize().scale(spd); }
			if (sp != null && sp.has("speed")) vel = dir.normalize().scale(eval(sp.get("speed"), s, 0));
			if (em.localPos) { rel = pd[0]; pos = em.origin.add(em.turn(rel)); }
			else { pos = em.origin.add(em.turn(pd[0])); vel = em.turn(vel); dir = em.turn(dir); }
			JsonObject spin = d.comp("minecraft:particle_initial_spin");
			if (spin != null) { rot = eval(spin.get("rotation"), s, 0); rotRate = eval(spin.get("rotation_rate"), s, 0); }
			JsonObject init = d.comp("minecraft:particle_initialization");
			if (init != null && init.has("per_render_expression")) Molang.compile(init.get("per_render_expression").getAsString()).eval(s);
			em.event("creation_event", d.comp("minecraft:particle_lifetime_events"), pos);
		}

		boolean update(double dt) {
			Def d = em.d;
			age += dt;
			s.vars.put("particle_age", age);
			curves(d, s);
			JsonObject lt = d.comp("minecraft:particle_lifetime_expression");
			if (lt != null && lt.has("expiration_expression") && Molang.truth(Molang.of(lt.get("expiration_expression")).eval(s))) { die(); return false; }
			if (age >= life) { die(); return false; }
			JsonObject dyn = d.comp("minecraft:particle_motion_dynamic");
			if (dyn != null) {
				float[] acc = vec(dyn.get("linear_acceleration"), s, 0);
				double drag = eval(dyn.get("linear_drag_coefficient"), s, 0);
				vel = vel.add((acc[0] - drag * vel.x) * dt, (acc[1] - drag * vel.y) * dt, (acc[2] - drag * vel.z) * dt);
				double racc = eval(dyn.get("rotation_acceleration"), s, 0), rdrag = eval(dyn.get("rotation_drag_coefficient"), s, 0);
				rotRate += (racc - rdrag * rotRate) * dt;
			}
			JsonObject par = d.comp("minecraft:particle_motion_parametric");
			if (par != null && par.has("relative_position")) {
				float[] rp = vec(par.get("relative_position"), s, 0);
				pos = em.origin.add(em.turn(new Vec3(rp[0], rp[1], rp[2])));
			} else if (rel != null) {
				rel = rel.add(vel.scale(dt));
				pos = em.origin.add(em.turn(rel));
			} else {
				Vec3 next = pos.add(vel.scale(dt));
				JsonObject col = d.comp("minecraft:particle_motion_collision");
				if (col != null && Molang.truth(Molang.of(col.get("enabled")).eval(s)) || col != null && !col.has("enabled")) {
					var level = Minecraft.getInstance().level;
					if (level != null && !level.getBlockState(BlockPos.containing(next)).getCollisionShape(level, BlockPos.containing(next)).isEmpty()) {
						if (col.has("expire_on_contact") && col.get("expire_on_contact").getAsBoolean()) { die(); return false; }
						double rest = col.has("coefficient_of_restitution") ? col.get("coefficient_of_restitution").getAsDouble() : 0;
						vel = new Vec3(vel.x * (1 - eval(col.get("collision_drag"), s, 0) * dt), -vel.y * rest, vel.z * (1 - eval(col.get("collision_drag"), s, 0) * dt));
						next = pos.add(vel.x * dt, 0, vel.z * dt);
					}
				}
				pos = next;
			}
			rot += rotRate * dt;
			JsonObject events = d.comp("minecraft:particle_lifetime_events");
			if (events != null && events.has("timeline")) {
				for (var e : events.getAsJsonObject("timeline").entrySet()) {
					double t = Double.parseDouble(e.getKey());
					if (t > age - dt && t <= age) {
						if (e.getValue().isJsonArray()) for (JsonElement x : e.getValue().getAsJsonArray()) em.runEvent(x.getAsString(), pos);
						else em.runEvent(e.getValue().getAsString(), pos);
					}
				}
			}
			return true;
		}

		void die() { em.event("expiration_event", em.d.comp("minecraft:particle_lifetime_events"), pos); }
	}

	/** Where a new particle starts (offset from the emitter) and which way it's heading */
	static Vec3[] shape(Def d, Molang.Scope s) {
		JsonObject sph = d.comp("minecraft:emitter_shape_sphere"), disc = d.comp("minecraft:emitter_shape_disc"), box = d.comp("minecraft:emitter_shape_box"),
				pt = d.comp("minecraft:emitter_shape_point"), aabb = d.comp("minecraft:emitter_shape_entity_aabb");
		Vec3 off = Vec3.ZERO, dir;
		JsonObject shape = sph != null ? sph : disc != null ? disc : box != null ? box : pt != null ? pt : aabb;
		if (shape != null && shape.has("offset")) { float[] o = vec(shape.get("offset"), s, 0); off = new Vec3(o[0], o[1], o[2]); }
		Vec3 local = Vec3.ZERO;
		if (sph != null) {
			double r = eval(sph.get("radius"), s, 1);
			Vec3 u = randomUnit();
			boolean surface = sph.has("surface_only") && sph.get("surface_only").getAsBoolean();
			local = u.scale(surface ? r : r * Math.cbrt(RNG.nextDouble()));
		} else if (disc != null) {
			double r = eval(disc.get("radius"), s, 1);
			boolean surface = disc.has("surface_only") && disc.get("surface_only").getAsBoolean();
			Vec3 n = new Vec3(0, 1, 0);
			JsonElement pn = disc.get("plane_normal");
			if (pn != null) {
				if (pn.isJsonPrimitive()) n = switch (pn.getAsString()) { case "x" -> new Vec3(1, 0, 0); case "z" -> new Vec3(0, 0, 1); default -> new Vec3(0, 1, 0); };
				else { float[] v = vec(pn, s, 0); n = new Vec3(v[0], v[1], v[2]).normalize(); }
			}
			Vec3 a = Math.abs(n.y) < 0.9 ? new Vec3(0, 1, 0).cross(n).normalize() : new Vec3(1, 0, 0).cross(n).normalize();
			Vec3 b = n.cross(a);
			double ang = RNG.nextDouble() * Math.PI * 2, rad = surface ? r : r * Math.sqrt(RNG.nextDouble());
			local = a.scale(Math.cos(ang) * rad).add(b.scale(Math.sin(ang) * rad));
		} else if (box != null) {
			float[] h = vec(box.get("half_dimensions"), s, 0);
			boolean surface = box.has("surface_only") && box.get("surface_only").getAsBoolean();
			double x = (RNG.nextDouble() * 2 - 1) * h[0], y = (RNG.nextDouble() * 2 - 1) * h[1], z = (RNG.nextDouble() * 2 - 1) * h[2];
			if (surface) { int axis = RNG.nextInt(3); double sign = RNG.nextBoolean() ? 1 : -1; if (axis == 0) x = sign * h[0]; else if (axis == 1) y = sign * h[1]; else z = sign * h[2]; }
			local = new Vec3(x, y, z);
		}
		JsonElement de = shape == null ? null : shape.get("direction");
		if (de == null || de.isJsonPrimitive() && de.getAsString().equals("outwards")) dir = local.lengthSqr() < 1e-9 ? randomUnit() : local.normalize();
		else if (de.isJsonPrimitive() && de.getAsString().equals("inwards")) dir = local.lengthSqr() < 1e-9 ? randomUnit() : local.normalize().scale(-1);
		else { float[] v = vec(de, s, 0); dir = new Vec3(v[0], v[1], v[2]); if (dir.lengthSqr() < 1e-9) dir = Vec3.ZERO; }
		if (pt != null && (de == null)) dir = Vec3.ZERO;
		return new Vec3[] { off.add(local), dir };
	}

	private static Vec3 randomUnit() {
		double z = RNG.nextDouble() * 2 - 1, a = RNG.nextDouble() * Math.PI * 2, r = Math.sqrt(1 - z * z);
		return new Vec3(r * Math.cos(a), z, r * Math.sin(a));
	}

	// ------------------------------------------------------------------ ticking and drawing
	private static long last = System.nanoTime();

	/** Simulate and draw; called once a frame after the world's particles */
	/** debugging: only draw the effects this accepts */
	public static java.util.function.Predicate<String> SHOW;

	public static void render(PoseStack ps, Camera cam) {
		long nowN = System.nanoTime();
		double dt = Math.min(0.1, (nowN - last) / 1e9);
		last = nowN;
		if (Minecraft.getInstance().isPaused()) dt = 0;
		if (Minecraft.getInstance().level == null) { clear(); return; }
		EMITTERS.addAll(PENDING);
		PENDING.clear();
		for (Iterator<Emitter> it = EMITTERS.iterator(); it.hasNext();) {
			Emitter e = it.next();
			try {
				if (!e.update(dt)) it.remove();
			} catch (Throwable ex) {
				Bedrock.warnOnce("particle", "Particle " + e.d.id + " failed: " + ex);
				count -= e.particles.size();
				it.remove();
			}
		}
		if (EMITTERS.isEmpty()) return;
		Vec3 cp = cam.getPosition();
		Map<String, List<Emitter>> batches = new HashMap<>();
		for (Emitter e : EMITTERS) if (!e.particles.isEmpty() && (SHOW == null || SHOW.test(e.d.id))) batches.computeIfAbsent(e.d.texture + "|" + e.d.material, k -> new ArrayList<>()).add(e);
		RenderSystem.enableBlend();
		RenderSystem.enableDepthTest();
		RenderSystem.depthMask(false);
		RenderSystem.disableCull();
		RenderSystem.setShader(GameRenderer::getPositionTexColorShader);
		Matrix4f m = ps.last().pose();
		for (List<Emitter> group : batches.values()) {
			Def d = group.get(0).d;
			if (!BedrockRenderer.exists(d.texture)) continue;
			blend(d.material);
			RenderSystem.setShaderTexture(0, d.texture);
			BufferBuilder b = Tesselator.getInstance().getBuilder();
			b.begin(VertexFormat.Mode.QUADS, DefaultVertexFormat.POSITION_TEX_COLOR);
			for (Emitter e : group) for (P p : e.particles) {
				try { quad(b, m, p, cam, cp); } catch (Throwable ex) { Bedrock.warnOnce("particle", "Particle " + e.d.id + " can't draw: " + ex); }
			}
			Tesselator.getInstance().end();
		}
		RenderSystem.defaultBlendFunc();
		RenderSystem.depthMask(true);
		RenderSystem.enableCull();
		RenderSystem.disableBlend();
	}

	private static void blend(String material) {
		switch (material) {
			case "particles_add", "particles_blend_additive_blend" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.SRC_ALPHA, GlStateManager.DestFactor.ONE);
			case "particles_blend_additive" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.ONE, GlStateManager.DestFactor.ONE);
			case "particles_blend_multiply" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.DST_COLOR, GlStateManager.DestFactor.ZERO);
			case "particles_blend_double_multiply" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.DST_COLOR, GlStateManager.DestFactor.SRC_COLOR);
			case "particles_blend_exclusion" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.ONE_MINUS_DST_COLOR, GlStateManager.DestFactor.ONE_MINUS_SRC_COLOR);
			case "particles_blend_premultiplied_alpha" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.ONE, GlStateManager.DestFactor.ONE_MINUS_SRC_ALPHA);
			case "particles_blend_opaque" -> RenderSystem.blendFunc(GlStateManager.SourceFactor.ONE, GlStateManager.DestFactor.ZERO);
			default -> RenderSystem.defaultBlendFunc();
		}
	}

	private static void quad(BufferBuilder b, Matrix4f m, P p, Camera cam, Vec3 cp) {
		Def d = p.em.d;
		JsonObject bb = d.comp("minecraft:particle_appearance_billboard");
		if (bb == null) return;
		float[] size = vec(bb.get("size"), p.s, 0.1f);
		float w = size[0], h = size.length > 1 ? size[1] : size[0];
		// a size that has shrunk past zero draws nothing (several effects shrink to negative sizes before they expire)
		if (w <= 0 || h <= 0) return;
		String mode = bb.has("facing_camera_mode") ? bb.get("facing_camera_mode").getAsString() : "rotate_xyz";
		Vec3 pos = p.pos;
		Vector3f right, up;
		Vector3f toCam = new Vector3f((float) (cp.x - pos.x), (float) (cp.y - pos.y), (float) (cp.z - pos.z));
		Vector3f camLeft = cam.getLeftVector(), camUp = cam.getUpVector();
		Vec3 dirv = p.rel != null ? p.em.turn(p.vel) : p.vel;
		if (bb.has("direction")) {
			JsonObject dm = bb.getAsJsonObject("direction");
			if (dm.has("mode") && dm.get("mode").getAsString().equals("custom") && dm.has("custom_direction")) { float[] v = vec(dm.get("custom_direction"), p.s, 0); dirv = p.em.turn(new Vec3(v[0], v[1], v[2])); }
		}
		// a particle that isn't moving has no direction to line up with: Bedrock then shows it facing the camera (most of
		// the add-on's glowing orbs are still "direction_z" particles from a point emitter)
		boolean still = dirv.lengthSqr() < 1e-8;
		if (still && (mode.startsWith("direction") || mode.equals("lookat_direction"))) mode = "rotate_xyz";
		Vector3f dir = still ? new Vector3f(0, 1, 0) : new Vector3f((float) dirv.x, (float) dirv.y, (float) dirv.z).normalize();
		switch (mode) {
			case "rotate_y", "lookat_y" -> {
				Vector3f flat = new Vector3f(toCam.x, 0, toCam.z);
				if (flat.lengthSquared() < 1e-6) flat.set(0, 0, 1);
				flat.normalize();
				right = new Vector3f(0, 1, 0).cross(flat).normalize();
				up = new Vector3f(0, 1, 0);
			}
			case "lookat_xyz" -> {
				Vector3f f = new Vector3f(toCam).normalize();
				Vector3f wy = Math.abs(f.y) > 0.99f ? new Vector3f(0, 0, 1) : new Vector3f(0, 1, 0);
				right = new Vector3f(wy).cross(f).normalize();
				up = new Vector3f(f).cross(right).normalize();
			}
			case "direction_x" -> {
				right = new Vector3f(dir);
				Vector3f ref = Math.abs(dir.y) > 0.99f ? new Vector3f(1, 0, 0) : new Vector3f(0, 1, 0);
				up = new Vector3f(ref).cross(dir).cross(dir).negate().normalize();
			}
			case "direction_y" -> {
				up = new Vector3f(dir);
				Vector3f ref = Math.abs(dir.y) > 0.99f ? new Vector3f(1, 0, 0) : new Vector3f(0, 1, 0);
				right = new Vector3f(ref).cross(dir).normalize();
			}
			case "direction_z" -> {
				Vector3f ref = Math.abs(dir.y) > 0.99f ? new Vector3f(1, 0, 0) : new Vector3f(0, 1, 0);
				right = new Vector3f(ref).cross(dir).normalize();
				up = new Vector3f(dir).cross(right).normalize();
			}
			case "lookat_direction" -> {
				Vector3f f = new Vector3f(toCam).normalize();
				right = new Vector3f(dir);
				up = new Vector3f(f).cross(right);
				if (up.lengthSquared() < 1e-6) up.set(0, 1, 0);
				up.normalize();
			}
			case "emitter_transform_xy" -> { right = v3(p.em.turn(new Vec3(1, 0, 0))); up = v3(p.em.turn(new Vec3(0, 1, 0))); }
			case "emitter_transform_xz" -> { right = v3(p.em.turn(new Vec3(1, 0, 0))); up = v3(p.em.turn(new Vec3(0, 0, 1))); }
			case "emitter_transform_yz" -> { right = v3(p.em.turn(new Vec3(0, 0, 1))); up = v3(p.em.turn(new Vec3(0, 1, 0))); }
			default -> { right = new Vector3f(camLeft).negate(); up = new Vector3f(camUp); }
		}
		if (p.rot != 0 && !mode.startsWith("direction") && !mode.equals("lookat_direction")) {
			float a = (float) Math.toRadians(p.rot), c = (float) Math.cos(a), sn = (float) Math.sin(a);
			Vector3f r2 = new Vector3f(right).mul(c).add(new Vector3f(up).mul(sn));
			Vector3f u2 = new Vector3f(up).mul(c).sub(new Vector3f(right).mul(sn));
			right = r2; up = u2;
		}
		right.mul(w);
		up.mul(h);
		float[] uv = uv(bb, p);
		float[] col = tint(d, p);
		float x = (float) (pos.x - cp.x), y = (float) (pos.y - cp.y), z = (float) (pos.z - cp.z);
		vert(b, m, x - right.x - up.x, y - right.y - up.y, z - right.z - up.z, uv[0], uv[3], col);
		vert(b, m, x + right.x - up.x, y + right.y - up.y, z + right.z - up.z, uv[2], uv[3], col);
		vert(b, m, x + right.x + up.x, y + right.y + up.y, z + right.z + up.z, uv[2], uv[1], col);
		vert(b, m, x - right.x + up.x, y - right.y + up.y, z - right.z + up.z, uv[0], uv[1], col);
	}

	private static Vector3f v3(Vec3 v) { return new Vector3f((float) v.x, (float) v.y, (float) v.z); }

	private static void vert(BufferBuilder b, Matrix4f m, float x, float y, float z, float u, float v, float[] c) {
		b.vertex(m, x, y, z).uv(u, v).color(c[0], c[1], c[2], c[3]).endVertex();
	}

	/** {u0, v0, u1, v1} */
	private static float[] uv(JsonObject bb, P p) {
		if (!bb.has("uv")) return new float[] { 0, 0, 1, 1 };
		JsonObject uv = bb.getAsJsonObject("uv");
		double tw = eval(uv.get("texture_width"), p.s, 1), th = eval(uv.get("texture_height"), p.s, 1);
		if (uv.has("flipbook")) {
			JsonObject fb = uv.getAsJsonObject("flipbook");
			float[] base = vec(fb.get("base_UV"), p.s, 0), size = vec(fb.get("size_UV"), p.s, 0), step = vec(fb.get("step_UV"), p.s, 0);
			double max = eval(fb.get("max_frame"), p.s, 1);
			int frame;
			if (fb.has("stretch_to_lifetime") && fb.get("stretch_to_lifetime").getAsBoolean()) frame = (int) Math.min(max - 1, Math.floor(p.age / Math.max(1e-6, p.life) * max));
			else {
				double fps = eval(fb.get("frames_per_second"), p.s, 8);
				frame = (int) Math.floor(p.age * fps);
				if (fb.has("loop") && fb.get("loop").getAsBoolean()) frame = (int) (frame % Math.max(1, max));
				else frame = (int) Math.min(max - 1, frame);
			}
			float u = base[0] + step[0] * frame, v = base[1] + step[1] * frame;
			return new float[] { (float) (u / tw), (float) (v / th), (float) ((u + size[0]) / tw), (float) ((v + size[1]) / th) };
		}
		float[] u = vec(uv.get("uv"), p.s, 0), s = vec(uv.get("uv_size"), p.s, 0);
		if (!uv.has("uv")) return new float[] { 0, 0, 1, 1 };
		return new float[] { (float) (u[0] / tw), (float) (u[1] / th), (float) ((u[0] + s[0]) / tw), (float) ((u[1] + s[1]) / th) };
	}

	private static float[] tint(Def d, P p) {
		JsonObject t = d.comp("minecraft:particle_appearance_tinting");
		if (t == null || !t.has("color")) return new float[] { 1, 1, 1, 1 };
		JsonElement c = t.get("color");
		if (c.isJsonArray()) { float[] v = vec(c, p.s, 1); return new float[] { v[0], v[1], v[2], v.length > 3 ? v[3] : 1 }; }
		if (c.isJsonPrimitive()) return hex(c.getAsString());
		JsonObject g = c.getAsJsonObject();
		double in = eval(g.get("interpolant"), p.s, 0);
		JsonElement grad = g.get("gradient");
		TreeMap<Double, float[]> stops = new TreeMap<>();
		if (grad.isJsonObject()) for (var e : grad.getAsJsonObject().entrySet()) stops.put(Double.parseDouble(e.getKey()), color(e.getValue(), p.s));
		else if (grad.isJsonArray()) {
			JsonArray a = grad.getAsJsonArray();
			for (int i = 0; i < a.size(); i++) stops.put(a.size() == 1 ? 0 : (double) i / (a.size() - 1), color(a.get(i), p.s));
		}
		if (stops.isEmpty()) return new float[] { 1, 1, 1, 1 };
		var lo = stops.floorEntry(in);
		var hi = stops.ceilingEntry(in);
		if (lo == null) return hi.getValue();
		if (hi == null || hi.getKey().equals(lo.getKey())) return lo.getValue();
		float f = (float) ((in - lo.getKey()) / (hi.getKey() - lo.getKey()));
		float[] a = lo.getValue(), b2 = hi.getValue();
		return new float[] { a[0] + (b2[0] - a[0]) * f, a[1] + (b2[1] - a[1]) * f, a[2] + (b2[2] - a[2]) * f, a[3] + (b2[3] - a[3]) * f };
	}

	private static float[] color(JsonElement e, Molang.Scope s) {
		if (e.isJsonPrimitive()) return hex(e.getAsString());
		float[] v = vec(e, s, 1);
		return new float[] { v[0], v[1], v[2], v.length > 3 ? v[3] : 1 };
	}

	static float[] hex(String h) {
		String s = h.startsWith("#") ? h.substring(1) : h;
		try {
			long v = Long.parseLong(s, 16);
			if (s.length() == 8) return new float[] { ((v >> 16) & 255) / 255f, ((v >> 8) & 255) / 255f, (v & 255) / 255f, ((v >> 24) & 255) / 255f };
			return new float[] { ((v >> 16) & 255) / 255f, ((v >> 8) & 255) / 255f, (v & 255) / 255f, 1 };
		} catch (NumberFormatException e) { return new float[] { 1, 1, 1, 1 }; }
	}
}
