package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Actor;
import com.jjka.bedrock.Bedrock;
import com.jjka.bedrock.Molang;
import com.mojang.blaze3d.vertex.PoseStack;

import net.minecraft.client.model.PlayerModel;
import net.minecraft.client.model.geom.ModelPart;
import net.minecraft.client.player.AbstractClientPlayer;
import net.minecraft.client.renderer.MultiBufferSource;
import net.minecraft.client.renderer.entity.LivingEntityRenderer;
import net.minecraft.client.renderer.entity.RenderLayerParent;
import net.minecraft.client.renderer.entity.layers.RenderLayer;

/**
 * The add-on's extra player render controllers (Sukuna's markings, Heian Sukuna's body, six eyes, weapons ...),
 * drawn over the Java player model.
 */
public final class PlayerLayer extends RenderLayer<AbstractClientPlayer, PlayerModel<AbstractClientPlayer>> {
	public PlayerLayer(RenderLayerParent<AbstractClientPlayer, PlayerModel<AbstractClientPlayer>> parent) { super(parent); }

	/** body_transformation (Heian Sukuna, Instant Spirit Body ...) replaces the whole player model */
	public static boolean transformed(AbstractClientPlayer p) {
		Actor a = Actor.peek(p);
		if (a == null) return false;
		Object v = a.property("property:body_transformation");
		return v instanceof Number n && n.doubleValue() != 0;
	}

	@Override
	public void render(PoseStack ps, MultiBufferSource buffers, int light, AbstractClientPlayer p, float limbSwing, float limbAmount, float partial, float age, float headYaw, float headPitch) {
		JsonObject desc = PlayerAnims.desc();
		if (desc == null || p.isInvisible()) return;
		Animator an = PlayerAnims.animator(p);
		List<JsonObject> rcs = new ArrayList<>();
		JsonElement rce = desc.get("render_controllers");
		if (rce == null || !rce.isJsonArray()) return;
		try {
			for (JsonElement x : rce.getAsJsonArray()) {
				String name; JsonElement cond = null;
				if (x.isJsonPrimitive()) name = x.getAsString();
				else { var en = x.getAsJsonObject().entrySet().iterator().next(); name = en.getKey(); cond = en.getValue(); }
				if (name.startsWith("controller.render.player.")) continue;
				if (cond != null && !Molang.truth(Molang.of(cond).eval(an))) continue;
				JsonObject rc = Rp.renderController(name);
				if (rc != null) rcs.add(rc);
			}
			if (rcs.isEmpty()) return;
			Map<String, float[]> pose = new HashMap<>(an.lastPose());
			PlayerModel<AbstractClientPlayer> m = getParentModel();
			boolean tr = transformed(p);
			if (!tr) {
				// the markings follow the Java model's parts exactly
				part(pose, "head", m.head);
				part(pose, "rightarm", m.rightArm);
				part(pose, "leftarm", m.leftArm);
				part(pose, "rightleg", m.rightLeg);
				part(pose, "leftleg", m.leftLeg);
			} else {
				// the transformed body plays its own animations; the head still looks around
				float[] h = pose.computeIfAbsent("head", k -> new float[] { 0, 0, 0, 0, 0, 0, 1, 1, 1 }).clone();
				h[0] += (float) Math.toDegrees(m.head.xRot);
				h[1] += (float) Math.toDegrees(m.head.yRot);
				pose.put("head", h);
			}
			int overlay = LivingEntityRenderer.getOverlayCoords(p, 0);
			BedrockRenderer.controllers(an, desc, rcs, pose, ps, buffers, light, overlay);
		} catch (RuntimeException ex) {
			Bedrock.warnOnce("playerlayer", "Player render controllers failed: " + ex);
		}
	}

	private static void part(Map<String, float[]> pose, String bone, ModelPart part) {
		var init = part.getInitialPose();
		pose.put(bone, new float[] {
				(float) Math.toDegrees(part.xRot), (float) Math.toDegrees(part.yRot), (float) Math.toDegrees(part.zRot),
				part.x - init.x, -(part.y - init.y), part.z - init.z,
				part.xScale, part.yScale, part.zScale });
	}
}
