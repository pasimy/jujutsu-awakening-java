package com.jjka.client;

import java.util.List;

import com.jjka.bedrock.Actor;
import com.jjka.bedrock.BedrockEntity;
import com.jjka.bedrock.Net;

import net.minecraft.client.Minecraft;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.phys.Vec3;

/** What the server's packets do on this client */
final class ClientImpl implements Net.ClientSide {
	private static Entity entity(int id) {
		var level = Minecraft.getInstance().level;
		return level == null ? null : level.getEntity(id);
	}

	@Override public void particle(String id, double x, double y, double z) { Particles.spawn(id, new Vec3(x, y, z), null, null); }
	@Override public void bar(List<String> items, int selected, boolean on, String style) { Keys.bar(items, selected, on, style); }
	@Override public void title(String mode, String text) { Screen.title(mode, text); }
	@Override public void titleTimes(int in, int stay, int out) { Screen.times(in, stay, out); }
	@Override public void shake(boolean stop, float intensity, float seconds, boolean rotational) { Screen.shake(stop, intensity, seconds, rotational); }
	@Override public void cameraFade(float in, float hold, float out, float r, float g, float b) { Screen.fade(in, hold, out, r, g, b); }
	@Override public void cameraSet(String preset, float ease, String easeType, Vec3 pos, float yRot, float xRot, boolean hasPos, boolean hasRot) { Screen.cameraSet(preset, ease, easeType, pos, yRot, xRot, hasPos, hasRot); }
	@Override public void cameraClear() { Screen.clearCam(); }
	@Override public void fog(String op, String id, String user) { }
	@Override public void hud(String op, String element) { Screen.hud(op, element); }
	@Override public void input(String kind, boolean enabled) { Screen.input(kind, enabled); }

	@Override
	public void animation(int id, String anim, String next, float blendOut, String stop, String controller) {
		Entity e = entity(id);
		if (e == null) return;
		Animator a;
		if (e instanceof Player) a = PlayerAnims.animator(e);
		else if (e instanceof BedrockEntity) a = Animator.of(e, Rp.entity(Actor.typeId(e)));
		else a = PlayerAnims.animator(e);
		a.play(anim, next, blendOut, stop, controller);
	}

	@Override
	public void actor(int id, List<String> groups, List<String[]> props, int variant, int mark, int skin) {
		Entity e = entity(id);
		if (e != null) Actor.of(e).sync(groups, props, variant, mark, skin);
	}

	@Override public void menu(String page) { MenuScreen.page(page); }

	@Override
	public void push(float x, float y, float z) {
		var p = Minecraft.getInstance().player;
		if (p != null) p.setDeltaMovement(x, y, z);
	}
}
