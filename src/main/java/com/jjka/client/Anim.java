package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Molang;

/** A resource-pack animation: keyframed bone channels (Molang everywhere), timing, and timeline effects */
public final class Anim {
	public final String id;
	public final String loop; // "true", "false", "hold_on_last_frame"
	public final double length;
	public final Molang.Expr timeUpdate, blendWeight, startDelay, loopDelay;
	public final boolean override;
	public final Map<String, Bone> bones = new HashMap<>();
	public final TreeMap<Double, List<JsonObject>> particles = new TreeMap<>(), sounds = new TreeMap<>();
	public final TreeMap<Double, List<String>> timeline = new TreeMap<>();

	/** A channel value: three expressions */
	public record V(Molang.Expr x, Molang.Expr y, Molang.Expr z) {
		float[] eval(Molang.Scope s) { return new float[] { (float) Molang.num(x.eval(s)), (float) Molang.num(y.eval(s)), (float) Molang.num(z.eval(s)) }; }
	}

	public record Key(double time, V pre, V post, boolean smooth) {}

	public static final class Channel {
		final V constant;
		final List<Key> keys;

		Channel(V constant, List<Key> keys) { this.constant = constant; this.keys = keys; }

		float[] eval(Molang.Scope s, double t) {
			if (constant != null) return constant.eval(s);
			if (keys.isEmpty()) return null;
			if (t <= keys.get(0).time) return keys.get(0).pre.eval(s);
			Key last = keys.get(keys.size() - 1);
			if (t >= last.time) return last.post.eval(s);
			int i = 0;
			while (i < keys.size() - 1 && keys.get(i + 1).time <= t) i++;
			Key a = keys.get(i), b = keys.get(i + 1);
			float f = (float) ((t - a.time) / Math.max(1e-6, b.time - a.time));
			float[] va = a.post.eval(s), vb = b.pre.eval(s);
			if (a.smooth || b.smooth) {
				float[] v0 = i > 0 ? keys.get(i - 1).post.eval(s) : va, v3 = i + 2 < keys.size() ? keys.get(i + 2).pre.eval(s) : vb;
				return new float[] { cat(v0[0], va[0], vb[0], v3[0], f), cat(v0[1], va[1], vb[1], v3[1], f), cat(v0[2], va[2], vb[2], v3[2], f) };
			}
			return new float[] { va[0] + (vb[0] - va[0]) * f, va[1] + (vb[1] - va[1]) * f, va[2] + (vb[2] - va[2]) * f };
		}

		private static float cat(float p0, float p1, float p2, float p3, float t) {
			float t2 = t * t, t3 = t2 * t;
			return 0.5f * (2 * p1 + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2 + (-p0 + 3 * p1 - 3 * p2 + p3) * t3);
		}
	}

	public record Bone(Channel rot, Channel pos, Channel scale, boolean relativeToEntity) {}

	private Anim(String id, JsonObject j) {
		this.id = id;
		JsonElement l = j.get("loop");
		loop = l == null ? "false" : l.getAsString();
		timeUpdate = j.has("anim_time_update") ? Molang.of(j.get("anim_time_update")) : null;
		blendWeight = j.has("blend_weight") ? Molang.of(j.get("blend_weight")) : null;
		startDelay = j.has("start_delay") ? Molang.of(j.get("start_delay")) : null;
		loopDelay = j.has("loop_delay") ? Molang.of(j.get("loop_delay")) : null;
		override = j.has("override_previous_animation") && j.get("override_previous_animation").getAsBoolean();
		double max = 0;
		if (j.has("bones")) for (var b : j.getAsJsonObject("bones").entrySet()) {
			if (!b.getValue().isJsonObject()) continue;
			JsonObject bo = b.getValue().getAsJsonObject();
			Channel r = channel(bo.get("rotation"), false), p = channel(bo.get("position"), false), s = channel(bo.get("scale"), true);
			for (Channel c : new Channel[] { r, p, s }) if (c != null && c.keys != null && !c.keys.isEmpty()) max = Math.max(max, c.keys.get(c.keys.size() - 1).time);
			bones.put(b.getKey().toLowerCase(Locale.ROOT), new Bone(r, p, s, bo.has("relative_to")));
		}
		events(j.get("particle_effects"), particles);
		events(j.get("sound_effects"), sounds);
		if (j.has("timeline")) for (var t : j.getAsJsonObject("timeline").entrySet()) {
			List<String> cmds = new ArrayList<>();
			if (t.getValue().isJsonArray()) for (JsonElement c : t.getValue().getAsJsonArray()) cmds.add(c.getAsString());
			else cmds.add(t.getValue().getAsString());
			timeline.put(Double.parseDouble(t.getKey()), cmds);
		}
		for (var m : new TreeMap[] { particles, sounds, timeline }) if (!m.isEmpty()) max = Math.max(max, (Double) m.lastKey());
		length = j.has("animation_length") ? j.get("animation_length").getAsDouble() : max;
	}

	private static void events(JsonElement e, TreeMap<Double, List<JsonObject>> into) {
		if (e == null || !e.isJsonObject()) return;
		for (var t : e.getAsJsonObject().entrySet()) {
			List<JsonObject> list = new ArrayList<>();
			if (t.getValue().isJsonArray()) for (JsonElement x : t.getValue().getAsJsonArray()) list.add(x.getAsJsonObject());
			else if (t.getValue().isJsonObject()) list.add(t.getValue().getAsJsonObject());
			try { into.put(Double.parseDouble(t.getKey()), list); } catch (NumberFormatException ignored) { }
		}
	}

	private static V vec(JsonElement e, boolean scale) {
		if (e == null || e.isJsonNull()) return null;
		if (e.isJsonArray()) {
			JsonArray a = e.getAsJsonArray();
			if (a.size() == 1) { Molang.Expr x = Molang.of(a.get(0)); return new V(x, x, x); }
			return new V(Molang.of(a.get(0)), Molang.of(a.get(Math.min(1, a.size() - 1))), Molang.of(a.get(Math.min(2, a.size() - 1))));
		}
		if (e.isJsonPrimitive()) { Molang.Expr x = Molang.of(e); return new V(x, x, x); }
		if (e.isJsonObject() && e.getAsJsonObject().has("vector")) return vec(e.getAsJsonObject().get("vector"), scale);
		return null;
	}

	private static Channel channel(JsonElement e, boolean scale) {
		if (e == null) return null;
		if (e.isJsonObject() && !e.getAsJsonObject().has("vector") && !e.getAsJsonObject().has("pre") && !e.getAsJsonObject().has("post")) {
			List<Key> keys = new ArrayList<>();
			for (var k : e.getAsJsonObject().entrySet()) {
				double t;
				try { t = Double.parseDouble(k.getKey()); } catch (NumberFormatException ex) { continue; }
				JsonElement v = k.getValue();
				V pre, post;
				boolean smooth = false;
				if (v.isJsonObject() && (v.getAsJsonObject().has("pre") || v.getAsJsonObject().has("post"))) {
					JsonObject o = v.getAsJsonObject();
					pre = vec(o.has("pre") ? o.get("pre") : o.get("post"), scale);
					post = vec(o.has("post") ? o.get("post") : o.get("pre"), scale);
					smooth = o.has("lerp_mode") && o.get("lerp_mode").getAsString().equals("catmullrom");
				} else {
					pre = post = vec(v, scale);
					if (v.isJsonObject() && v.getAsJsonObject().has("lerp_mode")) smooth = v.getAsJsonObject().get("lerp_mode").getAsString().equals("catmullrom");
				}
				if (pre != null) keys.add(new Key(t, pre, post, smooth));
			}
			keys.sort((a, b) -> Double.compare(a.time, b.time));
			return new Channel(null, keys);
		}
		V c = vec(e, scale);
		return c == null ? null : new Channel(c, null);
	}

	private static final Map<String, Anim> CACHE = new HashMap<>();

	public static synchronized Anim get(String id) {
		if (CACHE.containsKey(id)) return CACHE.get(id);
		JsonObject j = Rp.animation(id);
		Anim a = null;
		if (j != null) try { a = new Anim(id, j); } catch (RuntimeException e) { com.jjka.bedrock.Bedrock.warnOnce("anim", "Bad animation " + id + ": " + e); }
		else if (id.startsWith("animation.common.look_at_target") || id.startsWith("animation.humanoid.look_at_target")) a = lookAt(id);
		CACHE.put(id, a);
		return a;
	}

	/** Vanilla's look_at_target, which the pack refers to but doesn't include */
	private static Anim lookAt(String id) {
		JsonObject j = new JsonObject();
		j.addProperty("loop", true);
		JsonObject bones = new JsonObject(), head = new JsonObject();
		JsonArray rot = new JsonArray();
		rot.add("query.target_x_rotation");
		rot.add("query.target_y_rotation");
		rot.add(0);
		head.add("rotation", rot);
		bones.add("head", head);
		j.add("bones", bones);
		return new Anim(id, j);
	}

	/** Adds this animation's pose at time t, with weight w */
	public void apply(Molang.Scope s, double t, float w, Map<String, float[]> pose) {
		for (var b : bones.entrySet()) {
			float[] acc = pose.computeIfAbsent(b.getKey(), k -> new float[] { 0, 0, 0, 0, 0, 0, 1, 1, 1 });
			Bone bone = b.getValue();
			if (override) { acc[0] = acc[1] = acc[2] = acc[3] = acc[4] = acc[5] = 0; acc[6] = acc[7] = acc[8] = 1; }
			if (bone.rot != null) { float[] r = bone.rot.eval(s, t); if (r != null) { acc[0] += r[0] * w; acc[1] += r[1] * w; acc[2] += r[2] * w; } }
			if (bone.pos != null) { float[] p = bone.pos.eval(s, t); if (p != null) { acc[3] += p[0] * w; acc[4] += p[1] * w; acc[5] += p[2] * w; } }
			if (bone.scale != null) { float[] c = bone.scale.eval(s, t); if (c != null) { acc[6] *= 1 + (c[0] - 1) * w; acc[7] *= 1 + (c[1] - 1) * w; acc[8] *= 1 + (c[2] - 1) * w; } }
		}
	}
}
