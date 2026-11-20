package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonObject;
import com.jjka.bedrock.Bedrock;
import com.jjka.bedrock.Items;
import com.mojang.blaze3d.platform.GlStateManager;
import com.mojang.blaze3d.systems.RenderSystem;

import net.minecraft.client.CameraType;
import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.Font;
import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.util.Mth;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.Marker;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.phys.Vec3;
import net.minecraftforge.client.event.MovementInputUpdateEvent;
import net.minecraftforge.client.event.RenderGuiOverlayEvent;
import net.minecraftforge.client.event.ViewportEvent;
import net.minecraftforge.client.gui.overlay.VanillaGuiOverlay;

/** Everything the add-on does to the screen: camera shake / fade / cutscene camera, titles with picture glyphs, the HUD */
public final class Screen {
	private Screen() {}

	static double now() { return net.minecraft.Util.getMillis() / 1000.0; }

	// ------------------------------------------------------------------ camera shake
	private record Shake(double start, double secs, float intensity, boolean rotational) {}

	private static final List<Shake> SHAKES = new ArrayList<>();

	static void shake(boolean stop, float intensity, float seconds, boolean rotational) {
		if (stop) { SHAKES.clear(); return; }
		SHAKES.add(new Shake(now(), seconds, intensity, rotational));
	}

	public static void angles(ViewportEvent.ComputeCameraAngles e) {
		double t = now();
		float yaw = 0, pitch = 0, roll = 0;
		SHAKES.removeIf(s -> t - s.start > s.secs);
		for (Shake s : SHAKES) {
			float amp = s.intensity * (s.rotational ? 2.5f : 1.2f);
			double k = t * 40 + s.start * 13;
			yaw += amp * (float) Math.sin(k * 1.3);
			pitch += amp * (float) Math.sin(k * 1.7 + 1);
			if (s.rotational) roll += amp * (float) Math.sin(k * 1.1 + 2);
		}
		if (cam != null) {
			float[] r = camRot(t);
			e.setYaw(r[0]);
			e.setPitch(r[1]);
		}
		e.setYaw(e.getYaw() + yaw);
		e.setPitch(e.getPitch() + pitch);
		e.setRoll(e.getRoll() + roll);
	}

	// ------------------------------------------------------------------ camera fade
	private static double fadeStart = -1;
	private static float fadeIn, fadeHold, fadeOut, fr, fg, fb;

	static void fade(float in, float hold, float out, float r, float g, float b) {
		fadeStart = now(); fadeIn = in; fadeHold = hold; fadeOut = out; fr = r / 255f; fg = g / 255f; fb = b / 255f;
		if (r <= 1 && g <= 1 && b <= 1 && (r > 0 || g > 0 || b > 0)) { fr = r; fg = g; fb = b; }
	}

	private static float fadeAlpha() {
		if (fadeStart < 0) return 0;
		double t = now() - fadeStart;
		if (t < fadeIn) return (float) (t / Math.max(1e-3, fadeIn));
		t -= fadeIn;
		if (t < fadeHold) return 1;
		t -= fadeHold;
		if (t < fadeOut) return (float) (1 - t / Math.max(1e-3, fadeOut));
		fadeStart = -1;
		return 0;
	}

	// ------------------------------------------------------------------ cutscene camera (camera set minecraft:free)
	private static Marker cam;

	static boolean camOn() { Minecraft mc = Minecraft.getInstance(); return cam != null && mc.getCameraEntity() == cam; }
	private static Vec3 camFrom, camTo;
	private static float yFrom, pFrom, yTo, pTo;
	private static double camStart, camEase;
	private static String camEaseType = "linear";
	private static CameraType savedType;

	static void cameraSet(String preset, float ease, String easeType, Vec3 pos, float yaw, float pitch, boolean hasPos, boolean hasRot) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.level == null) return;
		switch (preset) {
			case "minecraft:first_person" -> { clearCam(); mc.options.setCameraType(CameraType.FIRST_PERSON); return; }
			case "minecraft:third_person" -> { clearCam(); mc.options.setCameraType(CameraType.THIRD_PERSON_BACK); return; }
			case "minecraft:third_person_front" -> { clearCam(); mc.options.setCameraType(CameraType.THIRD_PERSON_FRONT); return; }
			default -> { }
		}
		double t = now();
		if (cam == null) {
			cam = new Marker(EntityType.MARKER, mc.level);
			Vec3 eye = mc.player.getEyePosition();
			camFrom = camTo = eye;
			yFrom = yTo = mc.player.getYRot();
			pFrom = pTo = mc.player.getXRot();
			savedType = mc.options.getCameraType();
		} else {
			camFrom = camPos(t);
			float[] r = camRot(t);
			yFrom = r[0]; pFrom = r[1];
		}
		if (hasPos) camTo = pos;
		if (hasRot) { yTo = yaw; pTo = pitch; }
		camStart = t;
		camEase = ease;
		camEaseType = easeType;
		if (ease <= 0) { camFrom = camTo; yFrom = yTo; pFrom = pTo; }
		mc.options.setCameraType(CameraType.FIRST_PERSON);
		mc.setCameraEntity(cam);
	}

	static void clearCam() {
		Minecraft mc = Minecraft.getInstance();
		if (cam != null && mc.player != null) {
			mc.setCameraEntity(mc.player);
			if (savedType != null) mc.options.setCameraType(savedType);
		}
		cam = null;
	}

	private static double eased(double t) {
		double k = camEase <= 0 ? 1 : Mth.clamp((t - camStart) / camEase, 0, 1);
		return switch (camEaseType) {
			case "in_sine" -> 1 - Math.cos(k * Math.PI / 2);
			case "out_sine" -> Math.sin(k * Math.PI / 2);
			case "in_out_sine" -> -(Math.cos(Math.PI * k) - 1) / 2;
			case "in_quad" -> k * k;
			case "out_quad" -> 1 - (1 - k) * (1 - k);
			case "in_out_quad" -> k < 0.5 ? 2 * k * k : 1 - Math.pow(-2 * k + 2, 2) / 2;
			case "in_cubic" -> k * k * k;
			case "out_cubic" -> 1 - Math.pow(1 - k, 3);
			case "in_out_cubic" -> k < 0.5 ? 4 * k * k * k : 1 - Math.pow(-2 * k + 2, 3) / 2;
			case "in_circ" -> 1 - Math.sqrt(1 - k * k);
			case "out_circ" -> Math.sqrt(1 - Math.pow(k - 1, 2));
			case "in_out_circ" -> k < 0.5 ? (1 - Math.sqrt(1 - Math.pow(2 * k, 2))) / 2 : (Math.sqrt(1 - Math.pow(-2 * k + 2, 2)) + 1) / 2;
			case "in_expo" -> k == 0 ? 0 : Math.pow(2, 10 * k - 10);
			case "out_expo" -> k == 1 ? 1 : 1 - Math.pow(2, -10 * k);
			case "in_out_expo" -> k == 0 ? 0 : k == 1 ? 1 : k < 0.5 ? Math.pow(2, 20 * k - 10) / 2 : (2 - Math.pow(2, -20 * k + 10)) / 2;
			case "out_back" -> 1 + 2.70158 * Math.pow(k - 1, 3) + 1.70158 * Math.pow(k - 1, 2);
			case "in_back" -> 2.70158 * k * k * k - 1.70158 * k * k;
			case "out_bounce" -> bounce(k);
			case "spring" -> 1 - Math.cos(k * Math.PI * 4.5) * Math.exp(-k * 6);
			default -> k;
		};
	}

	private static double bounce(double x) {
		double n = 7.5625, d = 2.75;
		if (x < 1 / d) return n * x * x;
		if (x < 2 / d) return n * (x -= 1.5 / d) * x + 0.75;
		if (x < 2.5 / d) return n * (x -= 2.25 / d) * x + 0.9375;
		return n * (x -= 2.625 / d) * x + 0.984375;
	}

	private static Vec3 camPos(double t) { return camFrom.lerp(camTo, eased(t)); }

	private static float[] camRot(double t) {
		double k = eased(t);
		return new float[] { (float) (yFrom + Mth.wrapDegrees(yTo - yFrom) * k), (float) (pFrom + (pTo - pFrom) * k) };
	}

	/** Keeps the cutscene camera entity where it should be (called every frame before rendering) */
	public static void frame() {
		if (cam == null) return;
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.level == null || cam.level() != mc.level) { cam = null; return; }
		double t = now();
		Vec3 p = camPos(t);
		float[] r = camRot(t);
		cam.setPos(p.x, p.y - cam.getEyeHeight(), p.z);
		cam.xo = cam.xOld = cam.getX(); cam.yo = cam.yOld = cam.getY(); cam.zo = cam.zOld = cam.getZ();
		cam.setYRot(r[0]); cam.setXRot(r[1]);
		cam.yRotO = r[0]; cam.xRotO = r[1];
		if (mc.getCameraEntity() != cam) mc.setCameraEntity(cam);
	}

	// ------------------------------------------------------------------ input permission
	static boolean noMove, noLook;
	private static float lockYaw, lockPitch;

	static void input(String kind, boolean enabled) {
		var p = Minecraft.getInstance().player;
		if (kind.equals("movement")) noMove = !enabled;
		if (kind.equals("camera")) { noLook = !enabled; if (p != null) { lockYaw = p.getYRot(); lockPitch = p.getXRot(); } }
	}

	public static void movement(MovementInputUpdateEvent e) {
		if (!noMove) return;
		var in = e.getInput();
		in.forwardImpulse = 0; in.leftImpulse = 0; in.up = in.down = in.left = in.right = false; in.jumping = false; in.shiftKeyDown = false;
	}

	public static void tick() {
		var p = Minecraft.getInstance().player;
		if (noLook && p != null) { p.setYRot(lockYaw); p.setXRot(lockPitch); }
	}

	// ------------------------------------------------------------------ hud hide
	static final Set<String> HIDDEN = new HashSet<>();

	static void hud(String op, String element) {
		if (op.equals("reset")) { if (element.equals("all")) HIDDEN.clear(); else HIDDEN.remove(element); }
		else if (op.equals("hide")) HIDDEN.add(element);
	}

	public static void overlay(RenderGuiOverlayEvent.Pre e) {
		var id = e.getOverlay().id();
		String el = null;
		if (id.equals(VanillaGuiOverlay.HOTBAR.id())) el = "hotbar";
		else if (id.equals(VanillaGuiOverlay.PLAYER_HEALTH.id())) el = "health";
		else if (id.equals(VanillaGuiOverlay.FOOD_LEVEL.id())) el = "hunger";
		else if (id.equals(VanillaGuiOverlay.ARMOR_LEVEL.id())) el = "armor";
		else if (id.equals(VanillaGuiOverlay.AIR_LEVEL.id())) el = "air_bubbles";
		else if (id.equals(VanillaGuiOverlay.EXPERIENCE_BAR.id())) el = "progress_bar";
		else if (id.equals(VanillaGuiOverlay.POTION_ICONS.id())) el = "status_effects";
		else if (id.equals(VanillaGuiOverlay.CROSSHAIR.id())) el = "crosshair";
		else if (id.equals(VanillaGuiOverlay.ITEM_NAME.id())) el = "item_text";
		else if (id.equals(VanillaGuiOverlay.MOUNT_HEALTH.id())) el = "horse_health";
		if (el != null && (HIDDEN.contains(el) || HIDDEN.contains("all"))) e.setCanceled(true);
		// the technique bar takes the hotbar's place in technique mode
		if (id.equals(VanillaGuiOverlay.HOTBAR.id()) && Keys.bar.on && !Keys.bar.items.isEmpty()) e.setCanceled(true);
	}

	// ------------------------------------------------------------------ titles
	private static String title = "", subtitle = "", actionbar = "";
	private static double titleAt = -1, actionAt = -1;
	private static int tIn = 10, tStay = 70, tOut = 20;
	private static Map<String, Double> glyphCells;

	static void title(String mode, String text) {
		switch (mode) {
			case "title" -> { title = text; titleAt = now(); }
			case "subtitle" -> subtitle = text;
			case "actionbar" -> { actionbar = text; actionAt = now(); }
			case "clear" -> { title = ""; subtitle = ""; titleAt = -1; }
			case "reset" -> { title = ""; subtitle = ""; titleAt = -1; tIn = 10; tStay = 70; tOut = 20; }
			default -> { }
		}
	}

	static void times(int in, int stay, int out) { tIn = in; tStay = stay; tOut = out; }

	private static double cell(String page) {
		if (glyphCells == null) {
			glyphCells = new HashMap<>();
			try (var in = Screen.class.getResourceAsStream("/assets/jjka/textures/glyph/sizes.json")) {
				if (in != null) {
					JsonObject j = com.google.gson.JsonParser.parseReader(Bedrock.reader(in)).getAsJsonObject();
					for (var e : j.entrySet()) glyphCells.put(e.getKey(), e.getValue().getAsDouble());
				}
			} catch (Exception ignored) { }
		}
		return glyphCells.getOrDefault(page, 16.0);
	}

	/** Bedrock draws a glyph at half its cell's pixels in UI units, on a UI about 270 units tall */
	private static double glyphSize(char ch) {
		double cell = cell(String.format("%02x", ch >> 8));
		int h = Minecraft.getInstance().getWindow().getGuiScaledHeight();
		return cell / 2.0 * h / 270.0;
	}

	private static float titleAlpha(double t0, int in, int stay, int out) {
		if (t0 < 0) return 0;
		double t = (now() - t0) * 20;
		if (t < in) return (float) (t / Math.max(1, in));
		if (t < in + stay) return 1;
		if (t < in + stay + out) return (float) (1 - (t - in - stay) / Math.max(1, out));
		return 0;
	}

	/** Draws a line where private-use characters are pictures (the add-on's glyph sheets); returns its width */
	private static void line(GuiGraphics g, Font font, String s, int cx, int y, float scale, float alpha) {
		// split into runs of text and glyphs
		List<Object> parts = new ArrayList<>();
		StringBuilder run = new StringBuilder();
		String fmt = "";
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0xE000 && c <= 0xF8FF) {
				// the big sheets are whole-screen pictures (menu backgrounds, letterbox bars, impact frames): they fill the screen
				if (cell(String.format("%02x", c >> 8)) >= 400) { cover(g, c, alpha); continue; }
				if (run.length() > 0) { parts.add(run.toString()); run = new StringBuilder(fmt); }
				parts.add(c);
			} else {
				run.append(c);
				if (c == '§' && i + 1 < s.length()) fmt = fmt + c + s.charAt(i + 1);
			}
		}
		if (run.length() > 0) parts.add(run.toString());
		float w = 0, h = 9 * scale;
		for (Object p : parts) {
			if (p instanceof String str) w += font.width(str) * scale;
			else { double gs = glyphSize((Character) p); w += gs; h = Math.max(h, (float) gs); }
		}
		float x = cx - w / 2;
		int a = Mth.clamp((int) (alpha * 255), 0, 255);
		if (a < 4) return;
		for (Object p : parts) {
			if (p instanceof String str) {
				g.pose().pushPose();
				g.pose().translate(x, y + (h - 9 * scale) / 2, 0);
				g.pose().scale(scale, scale, 1);
				g.drawString(font, Component.literal(str), 0, 0, 0xFFFFFF | a << 24, true);
				g.pose().popPose();
				x += font.width(str) * scale;
			} else {
				char ch = (Character) p;
				String name = String.format("%04x", (int) ch);
				ResourceLocation tex = new ResourceLocation(Bedrock.MODID, "textures/glyph/" + name + ".png");
				double gs = glyphSize(ch);
				if (BedrockRenderer.exists(tex)) {
					RenderSystem.enableBlend();
					g.setColor(1, 1, 1, alpha);
					g.blit(tex, (int) x, (int) (y + (h - gs) / 2), 0, 0, (int) gs, (int) gs, (int) gs, (int) gs);
					MenuScreen.hotspot(ch, (int) x, (int) (y + (h - gs) / 2), (int) gs);
					g.setColor(1, 1, 1, 1);
				}
				x += gs;
			}
		}
	}

	private static void cover(GuiGraphics g, char ch, float alpha) {
		ResourceLocation tex = new ResourceLocation(Bedrock.MODID, "textures/glyph/" + String.format("%04x", (int) ch) + ".png");
		if (!BedrockRenderer.exists(tex)) return;
		Minecraft mc = Minecraft.getInstance();
		int w = mc.getWindow().getGuiScaledWidth(), h = mc.getWindow().getGuiScaledHeight();
		int side = Math.max(w, h);
		RenderSystem.enableBlend();
		g.setColor(1, 1, 1, alpha);
		g.blit(tex, (w - side) / 2, (h - side) / 2, 0, 0, side, side, side, side);
		g.setColor(1, 1, 1, 1);
	}

	public static void hud(RenderGuiOverlayEvent.Post e) {
		if (!e.getOverlay().id().equals(VanillaGuiOverlay.TITLE_TEXT.id())) return;
		Minecraft mc = Minecraft.getInstance();
		GuiGraphics g = e.getGuiGraphics();
		int w = mc.getWindow().getGuiScaledWidth(), h = mc.getWindow().getGuiScaledHeight();
		Font font = mc.font;
		MenuScreen.frame();
		// impact frames (gg:impact_frame entities): the screen turns to negative for a moment
		impact(g, w, h);
		float fa = fadeAlpha();
		if (fa > 0) g.fill(0, 0, w, h, (Mth.clamp((int) (fa * 255), 0, 255) << 24) | (int) (fr * 255) << 16 | (int) (fg * 255) << 8 | (int) (fb * 255));
		float ta = titleAlpha(titleAt, tIn, tStay, tOut);
		if (ta > 0 && !(title.isEmpty() && subtitle.isEmpty())) {
			String[] lines = title.split("\n", -1);
			int y = h / 2 - 10 - lines.length * 9;
			for (String l : lines) { line(g, font, l, w / 2, y, 1.6f, ta); y += 15; }
			if (!subtitle.isEmpty()) for (String l : subtitle.split("\n")) { line(g, font, l, w / 2, y + 4, 1f, ta); y += 10; }
		}
		float aa = titleAlpha(actionAt, 0, 50, 10);
		if (aa > 0 && !actionbar.isEmpty()) {
			String[] lines = actionbar.split("\n", -1);
			int y = h - 68 - (lines.length - 1) * 10;
			for (String l : lines) { line(g, font, l, w / 2, y, 1f, aa); y += 10; }
		}
		Keys.drawBar(g, w, h);
	}

	private static void impact(GuiGraphics g, int w, int h) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.level == null || mc.player == null) return;
		boolean white = false, black = false;
		for (var en : mc.level.entitiesForRendering()) {
			if (!(en instanceof com.jjka.bedrock.BedrockEntity b) || en.distanceToSqr(mc.player) > 80 * 80) continue;
			String id = b.def().id;
			if (id.equals("gg:impact_frame")) white = true;
			else if (id.equals("gg:impact_frame_black")) black = true;
		}
		if (!white && !black) return;
		g.flush();
		RenderSystem.enableBlend();
		RenderSystem.blendFunc(GlStateManager.SourceFactor.ONE_MINUS_DST_COLOR, GlStateManager.DestFactor.ZERO);
		RenderSystem.setShader(net.minecraft.client.renderer.GameRenderer::getPositionColorShader);
		var m = g.pose().last().pose();
		var b = com.mojang.blaze3d.vertex.Tesselator.getInstance().getBuilder();
		b.begin(com.mojang.blaze3d.vertex.VertexFormat.Mode.QUADS, com.mojang.blaze3d.vertex.DefaultVertexFormat.POSITION_COLOR);
		b.vertex(m, 0, h, 0).color(1f, 1f, 1f, 1f).endVertex();
		b.vertex(m, w, h, 0).color(1f, 1f, 1f, 1f).endVertex();
		b.vertex(m, w, 0, 0).color(1f, 1f, 1f, 1f).endVertex();
		b.vertex(m, 0, 0, 0).color(1f, 1f, 1f, 1f).endVertex();
		com.mojang.blaze3d.vertex.Tesselator.getInstance().end();
		RenderSystem.defaultBlendFunc();
		if (black) g.fill(0, 0, w, h, 0x99000000);
	}

	static ItemStack stack(String id) {
		Item i = Items.item(id);
		return i == null ? ItemStack.EMPTY : new ItemStack(i);
	}
}
