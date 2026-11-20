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

	private static final JsonObject DESC = new JsonObject();

	public static Animator animator(Entity p) { return Animator.of(p, DESC); }

	public static final class Model extends PlayerModel<AbstractClientPlayer> {
		private float[] root, waist, bodyPose;

		public Model(ModelPart part, boolean slim) { super(part, slim); }

		@Override
		public void setupAnim(AbstractClientPlayer p, float limbSwing, float limbAmount, float age, float headYaw, float headPitch) {
			super.setupAnim(p, limbSwing, limbAmount, age, headYaw, headPitch);
			root = waist = bodyPose = null;
			Animator a = Animator.peek(p);
			if (a == null) return;
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
