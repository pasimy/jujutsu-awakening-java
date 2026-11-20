package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.joml.Matrix3f;
import org.joml.Matrix4f;
import org.joml.Vector3f;
import org.joml.Vector4f;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Actor;
import com.jjka.bedrock.Bedrock;
import com.jjka.bedrock.BedrockEntity;
import com.jjka.bedrock.Molang;
import com.mojang.blaze3d.vertex.PoseStack;
import com.mojang.blaze3d.vertex.VertexConsumer;
import com.mojang.math.Axis;

import net.minecraft.client.Minecraft;
import net.minecraft.client.renderer.LightTexture;
import net.minecraft.client.renderer.MultiBufferSource;
import net.minecraft.client.renderer.RenderType;
import net.minecraft.client.renderer.entity.EntityRenderer;
import net.minecraft.client.renderer.entity.EntityRendererProvider;
import net.minecraft.client.renderer.entity.LivingEntityRenderer;
import net.minecraft.client.renderer.texture.OverlayTexture;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.phys.Vec3;

/** Draws any add-on entity from its client entity definition: render controllers, geometry, textures, animations */
public class BedrockRenderer extends EntityRenderer<BedrockEntity> {
	public BedrockRenderer(EntityRendererProvider.Context ctx) {
		super(ctx);
		shadowRadius = 0;
	}

	@Override
	public ResourceLocation getTextureLocation(BedrockEntity e) { return new ResourceLocation(Bedrock.MODID, "textures/entity/air.png"); }

	@Override
	public boolean shouldRender(BedrockEntity e, net.minecraft.client.renderer.culling.Frustum f, double x, double y, double z) {
		return e.distanceToSqr(x, y, z) < 256 * 256;
	}

	@Override
	public void render(BedrockEntity e, float yaw, float partial, PoseStack ps, MultiBufferSource buffers, int light) {
		JsonObject desc = Rp.entity(Actor.typeId(e));
		if (desc != null) draw(e, desc, partial, ps, buffers, light);
		if (e.hasCustomName() && shouldShowName(e) && Minecraft.getInstance().options.renderDebug) super.render(e, yaw, partial, ps, buffers, light);
	}

	// ------------------------------------------------------------------ shared drawing (also used for players' extra layers)
	/** Molang that can also answer Geometry.x, Texture.x, Material.x and Array.x */
	static final class RenderScope implements Molang.Scope {
		final Animator a;
		final JsonObject desc, rc;

		RenderScope(Animator a, JsonObject desc, JsonObject rc) { this.a = a; this.desc = desc; this.rc = rc; }

		@Override public Object query(String name, Object[] args) { return a.query(name, args); }
		@Override public Map<String, Object> vars(char kind) { return a.vars(kind); }

		@Override
		public Object other(String name) {
			int dot = name.indexOf('.');
			if (dot < 0) return null;
			String ns = name.substring(0, dot), key = name.substring(dot + 1);
			switch (ns) {
				case "geometry": return lookup(desc, "geometry", key);
				case "texture": return lookup(desc, "textures", key);
				case "material": return lookup(desc, "materials", key);
				case "array": {
					if (rc == null || !rc.has("arrays")) return null;
					for (var group : rc.getAsJsonObject("arrays").entrySet()) {
						for (var arr : group.getValue().getAsJsonObject().entrySet()) {
							if (!arr.getKey().equalsIgnoreCase("array." + key)) continue;
							List<Object> out = new ArrayList<>();
							for (JsonElement x : arr.getValue().getAsJsonArray()) out.add(Molang.compile(x.getAsString()).eval(this));
							return out;
						}
					}
					return null;
				}
				default: return null;
			}
		}

		private static Object lookup(JsonObject desc, String group, String key) {
			if (desc == null || !desc.has(group)) return null;
			for (var e : desc.getAsJsonObject(group).entrySet()) if (e.getKey().equalsIgnoreCase(key)) return e.getValue().getAsString();
			return null;
		}
	}

	private static final Map<String, Boolean> TEXTURES = new HashMap<>();

	static boolean exists(ResourceLocation rl) {
		return TEXTURES.computeIfAbsent(rl.toString(), k -> Minecraft.getInstance().getResourceManager().getResource(rl).isPresent());
	}

	/** The render type for a Bedrock material name */
	static RenderType material(String name, ResourceLocation tex, boolean[] emissive) {
		String m = name == null ? "entity_alphatest" : name.toLowerCase(Locale.ROOT);
		emissive[0] = m.contains("emissive") || m.contains("glow") || m.contains("beam");
		if (m.contains("blend") || m.contains("translucent") || m.contains("beam") || m.contains("transparent")) return emissive[0] ? RenderType.entityTranslucentEmissive(tex) : RenderType.entityTranslucent(tex);
		return RenderType.entityCutoutNoCull(tex);
	}

	/** Draws the entity's render controllers. The PoseStack is at the entity's position. */
	public static void draw(Entity e, JsonObject desc, float partial, PoseStack ps, MultiBufferSource buffers, int light) {
		Animator an = Animator.of(e, desc);
		Map<String, float[]> pose;
		try {
			pose = an.frame(partial);
		} catch (RuntimeException ex) {
			Bedrock.warnOnce("anim", "Animation failed for " + Actor.typeId(e) + ": " + ex);
			pose = new HashMap<>();
		}
		List<JsonObject> rcs = new ArrayList<>();
		JsonElement rce = desc.get("render_controllers");
		if (rce != null && rce.isJsonArray()) for (JsonElement x : rce.getAsJsonArray()) {
			if (x.isJsonPrimitive()) { JsonObject rc = Rp.renderController(x.getAsString()); if (rc != null) rcs.add(rc); else if (x.getAsString().equals("controller.render.default")) rcs.add(defaultController()); }
			else {
				var en = x.getAsJsonObject().entrySet().iterator().next();
				if (!Molang.truth(Molang.of(en.getValue()).eval(an))) continue;
				JsonObject rc = Rp.renderController(en.getKey());
				if (rc != null) rcs.add(rc); else if (en.getKey().equals("controller.render.default")) rcs.add(defaultController());
			}
		}
		if (rcs.isEmpty()) rcs.add(defaultController());
		ps.pushPose();
		float bodyYaw = e instanceof LivingEntity l ? net.minecraft.util.Mth.rotLerp(partial, l.yBodyRotO, l.yBodyRot) : net.minecraft.util.Mth.rotLerp(partial, e.yRotO, e.getYRot());
		ps.mulPose(Axis.YP.rotationDegrees(180f - bodyYaw));
		float scale = (e instanceof BedrockEntity b ? b.scale() : 1f) * (float) an.scale();
		ps.scale(scale, scale, scale);
		ps.scale(-1, -1, 1);
		ps.translate(0, -1.501f, 0);
		int overlay = e instanceof LivingEntity l ? LivingEntityRenderer.getOverlayCoords(l, 0) : OverlayTexture.NO_OVERLAY;
		Vec3 cam = Minecraft.getInstance().gameRenderer.getMainCamera().getPosition();
		for (JsonObject rc : rcs) {
			RenderScope s = new RenderScope(an, desc, rc);
			Object geoName = Molang.compile(rc.has("geometry") ? rc.get("geometry").getAsString() : "Geometry.default").eval(s);
			Geo geo = Geo.get(geoName instanceof String str ? str : null);
			if (geo == null) continue;
			String texName = null;
			if (rc.has("textures") && rc.getAsJsonArray("textures").size() > 0) {
				Object t = Molang.compile(rc.getAsJsonArray("textures").get(0).getAsString()).eval(s);
				if (t instanceof String str) texName = str;
			} else texName = (String) s.other("texture.default");
			if (texName == null) continue;
			ResourceLocation tex = Bedrock.texture(texName);
			if (!exists(tex)) continue;
			// materials per bone (later entries win), visibility per bone
			List<String[]> mats = new ArrayList<>();
			if (rc.has("materials")) for (JsonElement m : rc.getAsJsonArray("materials")) for (var en : m.getAsJsonObject().entrySet()) {
				Object v = Molang.compile(en.getValue().getAsString()).eval(s);
				mats.add(new String[] { en.getKey(), v instanceof String str ? str : null });
			}
			if (mats.isEmpty()) mats.add(new String[] { "*", (String) s.other("material.default") });
			List<Object[]> vis = new ArrayList<>();
			if (rc.has("part_visibility")) for (JsonElement m : rc.getAsJsonArray("part_visibility")) for (var en : m.getAsJsonObject().entrySet())
				vis.add(new Object[] { en.getKey(), Molang.truth(Molang.of(en.getValue()).eval(s)) });
			float[] color = { 1, 1, 1, 1 };
			if (rc.has("color")) { JsonObject c = rc.getAsJsonObject("color"); color = new float[] { ch(c, "r", s), ch(c, "g", s), ch(c, "b", s), ch(c, "a", s) }; }
			Map<String, RenderType> types = new HashMap<>();
			Map<String, Boolean> glow = new HashMap<>();
			for (Geo.Bone b : geo.bones) if (b.parent == null) bone(b, geo, pose, ps, buffers, light, overlay, tex, mats, vis, types, glow, color, true, an, cam);
		}
		ps.popPose();
	}

	private static float ch(JsonObject c, String k, Molang.Scope s) { return c.has(k) ? (float) Molang.eval(c.get(k), s) : 1f; }

	private static boolean match(String pattern, String name) {
		if (pattern.equals("*")) return true;
		String p = pattern.toLowerCase(Locale.ROOT);
		if (p.endsWith("*")) return name.startsWith(p.substring(0, p.length() - 1));
		if (p.startsWith("*")) return name.endsWith(p.substring(1));
		return name.equals(p);
	}

	private static void bone(Geo.Bone b, Geo geo, Map<String, float[]> pose, PoseStack ps, MultiBufferSource buffers, int light, int overlay,
			ResourceLocation tex, List<String[]> mats, List<Object[]> vis, Map<String, RenderType> types, Map<String, Boolean> glow, float[] color,
			boolean parentVisible, Animator an, Vec3 cam) {
		String name = b.name.toLowerCase(Locale.ROOT);
		boolean visible = parentVisible;
		for (Object[] v : vis) if (match((String) v[0], name)) visible = (Boolean) v[1];
		ps.pushPose();
		float[] p = pose.get(name);
		ps.translate(b.pivot.x / 16f, b.pivot.y / 16f, b.pivot.z / 16f);
		if (p != null) ps.translate(p[3] / 16f, -p[4] / 16f, p[5] / 16f);
		float rx = b.rot.x + (p == null ? 0 : (float) Math.toRadians(p[0])), ry = b.rot.y + (p == null ? 0 : (float) Math.toRadians(p[1])), rz = b.rot.z + (p == null ? 0 : (float) Math.toRadians(p[2]));
		if (rx != 0 || ry != 0 || rz != 0) ps.mulPose(new org.joml.Quaternionf().rotationZYX(rz, ry, rx));
		if (p != null && (p[6] != 1 || p[7] != 1 || p[8] != 1)) ps.scale(p[6], p[7], p[8]);
		ps.translate(-b.pivot.x / 16f, -b.pivot.y / 16f, -b.pivot.z / 16f);
		Matrix4f m = ps.last().pose();
		for (var l : b.locators.entrySet()) {
			Vector4f w = m.transform(new Vector4f(l.getValue().x / 16f, l.getValue().y / 16f, l.getValue().z / 16f, 1));
			an.locators.put(l.getKey(), new Vec3(w.x() + cam.x, w.y() + cam.y, w.z() + cam.z));
		}
		if (visible && !b.quads.isEmpty() && color[3] > 0) {
			String mat = null;
			for (String[] mm : mats) if (match(mm[0], name)) mat = mm[1];
			String key = String.valueOf(mat);
			RenderType rt = types.get(key);
			if (rt == null) {
				boolean[] em = new boolean[1];
				rt = material(mat, tex, em);
				types.put(key, rt);
				glow.put(key, em[0]);
			}
			int li = glow.get(key) ? LightTexture.FULL_BRIGHT : light;
			VertexConsumer vc = buffers.getBuffer(rt);
			Matrix3f nm = ps.last().normal();
			for (float[] q : b.quads) {
				Vector3f n = nm.transform(new Vector3f(q[20], q[21], q[22]));
				for (int i = 0; i < 4; i++) {
					Vector4f v = m.transform(new Vector4f(q[i * 5] / 16f, q[i * 5 + 1] / 16f, q[i * 5 + 2] / 16f, 1));
					vc.vertex(v.x(), v.y(), v.z(), color[0], color[1], color[2], color[3], q[i * 5 + 3], q[i * 5 + 4], overlay, li, n.x, n.y, n.z);
				}
			}
		}
		for (Geo.Bone c : b.children) bone(c, geo, pose, ps, buffers, light, overlay, tex, mats, vis, types, glow, color, visible, an, cam);
		ps.popPose();
	}

	private static JsonObject defaultController() {
		JsonObject rc = new JsonObject();
		rc.addProperty("geometry", "Geometry.default");
		JsonArray t = new JsonArray();
		t.add("Texture.default");
		rc.add("textures", t);
		JsonArray m = new JsonArray();
		JsonObject all = new JsonObject();
		all.addProperty("*", "Material.default");
		m.add(all);
		rc.add("materials", m);
		return rc;
	}
}
