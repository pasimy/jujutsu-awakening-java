package com.jjka.client;

import java.util.Map;

import com.google.gson.JsonObject;
import com.mojang.blaze3d.vertex.PoseStack;
import com.mojang.blaze3d.vertex.VertexConsumer;

import net.minecraft.client.model.PlayerModel;
import net.minecraft.client.model.geom.ModelPart;
import net.minecraft.client.player.AbstractClientPlayer;
import net.minecraft.world.entity.Entity;

/**
 * The add-on's /playanimation on players (Infinite Pressure's pose, Lapse Blue's hand sign ...), laid over Java's own
 * player animation. Bedrock bone names map to Java's parts; root / waist / body carry their children like Bedrock's tree.
 */
public final class PlayerAnims {
	private PlayerAnims() {}

	private static JsonObject DESC;

	/** the add-on's player.entity.json, playing only its own transformation controllers (Heian Sukuna, Mahito's
	 * weapons ...); Java's player animation stands in for the vanilla ones */
	public static synchronized JsonObject desc() {
		if (DESC == null) {
			JsonObject d = Rp.entity("minecraft:player");
			DESC = d == null ? new JsonObject() : d.deepCopy();
			if (DESC.has("scripts") && DESC.getAsJsonObject("scripts").has("animate")) {
				com.google.gson.JsonArray keep = new com.google.gson.JsonArray();
				JsonObject anims = DESC.has("animations") ? DESC.getAsJsonObject("animations") : new JsonObject();
				for (var e : DESC.getAsJsonObject("scripts").getAsJsonArray("animate")) {
					String k = e.isJsonPrimitive() ? e.getAsString() : e.getAsJsonObject().keySet().iterator().next();
					String id = anims.has(k) ? anims.get(k).getAsString() : "";
					if (id.startsWith("controller.animation.") && !id.startsWith("controller.animation.player.") && !id.startsWith("controller.animation.humanoid.")) keep.add(e);
				}
				DESC.getAsJsonObject("scripts").add("animate", keep);
			}
		}
		return DESC;
	}

	public static Animator animator(Entity p) { return Animator.of(p, desc()); }

	public static final class Model extends PlayerModel<AbstractClientPlayer> {
		private float[] root, waist, bodyPose;

		public Model(ModelPart part, boolean slim) { super(part, slim); }

		private AbstractClientPlayer player;

		@Override
		public void setupAnim(AbstractClientPlayer p, float limbSwing, float limbAmount, float age, float headYaw, float headPitch) {
			// Java's setupAnim doesn't put everything back (scale, some offsets): start each frame from the rest pose,
			// otherwise an animation's scale multiplies up frame after frame (stretched arms)
			for (ModelPart part : new ModelPart[] { head, hat, this.body, jacket, rightArm, leftArm, rightSleeve, leftSleeve, rightLeg, leftLeg, rightPants, leftPants }) {
				part.resetPose();
				part.xScale = part.yScale = part.zScale = 1f;
			}
			super.setupAnim(p, limbSwing, limbAmount, age, headYaw, headPitch);
			player = p;
			root = waist = bodyPose = null;
			Animator a = animator(p);
			// walking or punching ends a long held pose (Unlimited Void's sign would otherwise stay up after the cutscene)
			if (limbAmount > 0.2f || attackTime > 0) a.endLongPoses(3);
			float partial = net.minecraft.client.Minecraft.getInstance().getFrameTime();
			Map<String, float[]> pose;
			try { pose = a.frame(partial); } catch (Throwable ex) { com.jjka.bedrock.Bedrock.warnOnce("anim", "Player animation failed: " + ex); return; }
			if (pose.isEmpty()) return;
			apply(head, pose.get("head"));
			apply(rightArm, pose.get("rightarm"));
			apply(leftArm, pose.get("leftarm"));
			apply(rightLeg, pose.get("rightleg"));
			apply(leftLeg, pose.get("leftleg"));
			root = pose.get("root");
			waist = pose.get("waist");
			bodyPose = pose.get("body");
			hat.copyFrom(head);
			rightSleeve.copyFrom(rightArm);
			leftSleeve.copyFrom(leftArm);
			rightPants.copyFrom(rightLeg);
			leftPants.copyFrom(leftLeg);
			jacket.copyFrom(this.body);
		}

		private static void apply(ModelPart part, float[] p) {
			if (p == null) return;
			part.xRot += (float) Math.toRadians(p[0]);
			part.yRot += (float) Math.toRadians(p[1]);
			part.zRot += (float) Math.toRadians(p[2]);
			part.x += p[3];
			part.y -= p[4];
			part.z += p[5];
			part.xScale *= p[6];
			part.yScale *= p[7];
			part.zScale *= p[8];
		}

		/** rotation/translation of a Bedrock bone about its pivot (Java model space, pixels) */
		private static void transform(PoseStack ps, float[] p, float px, float py, float pz) {
			if (p == null) return;
			ps.translate(px / 16f, py / 16f, pz / 16f);
			ps.translate(p[3] / 16f, -p[4] / 16f, p[5] / 16f);
			ps.mulPose(new org.joml.Quaternionf().rotationZYX((float) Math.toRadians(p[2]), (float) Math.toRadians(p[1]), (float) Math.toRadians(p[0])));
			ps.scale(p[6], p[7], p[8]);
			ps.translate(-px / 16f, -py / 16f, -pz / 16f);
		}

		@Override
		public void renderToBuffer(PoseStack ps, VertexConsumer vc, int light, int overlay, float r, float g, float b, float a) {
			// Heian Sukuna and the other body transformations hide the player (player.third_person's part_visibility)
			if (player != null && PlayerLayer.transformed(player)) return;
			if (root == null && waist == null && bodyPose == null) { super.renderToBuffer(ps, vc, light, overlay, r, g, b, a); return; }
			ps.pushPose();
			transform(ps, root, 0, 24, 0);
			for (ModelPart part : new ModelPart[] { rightLeg, leftLeg, rightPants, leftPants }) part.render(ps, vc, light, overlay, r, g, b, a);
			transform(ps, waist, 0, 12, 0);
			transform(ps, bodyPose, 0, 0, 0);
			for (ModelPart part : new ModelPart[] { this.body, jacket, head, hat, rightArm, leftArm, rightSleeve, leftSleeve }) part.render(ps, vc, light, overlay, r, g, b, a);
			ps.popPose();
		}
	}
}
