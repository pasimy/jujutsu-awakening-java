package com.jjka.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jjka.bedrock.Net;

import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.client.gui.components.Button;
import net.minecraft.client.gui.screens.PauseScreen;
import net.minecraft.network.chat.Component;

/**
 * The add-on's start menu, clickable. Its buttons are pictures it draws with titles (Play, Help, Credits, Back, Human,
 * Curse); the HUD notes where each one lands, so hovering one highlights it (like scrolling with sneak) and clicking it
 * picks it (like jump). Jump / sneak still work, and the roll screens get Roll / Continue buttons.
 */
public final class MenuScreen extends net.minecraft.client.gui.screens.Screen {
	/** which menu option each button picture stands for (the add-on's menuscroll) */
	private static final Map<Character, Integer> OPTIONS = Map.ofEntries(
			Map.entry('', 1), Map.entry('', 1), Map.entry('', 2), Map.entry('', 2), Map.entry('', 3), Map.entry('', 3),
			Map.entry('', 1), Map.entry('', 1), Map.entry('', 2), Map.entry('', 3), Map.entry('', 3));

	private record Spot(char ch, int x, int y, int size) {
		boolean has(double mx, double my) {
			// the pictures have a lot of empty border; use the middle of them
			double m = size * 0.15;
			return mx >= x + m && mx <= x + size - m && my >= y + m && my <= y + size - m;
		}
	}

	private static String page = "";
	private static List<Spot> spots = new ArrayList<>(), drawing = new ArrayList<>();
	private int hovered;

	public MenuScreen() { super(Component.literal("Jujutsu Awakening")); }

	static void page(String p) { page = p == null ? "" : p; }

	/** the HUD starts a new frame */
	static void frame() {
		spots = drawing;
		drawing = new ArrayList<>();
	}

	static void hotspot(char ch, int x, int y, int size) {
		if (OPTIONS.containsKey(ch)) drawing.add(new Spot(ch, x, y, size));
	}

	/** every client tick: open while the add-on's menu is up, close when it's done */
	static void update() {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null) return;
		boolean on = !page.isEmpty() && !page.equals("menuintro");
		if (on && mc.screen == null) mc.setScreen(new MenuScreen());
		else if (!on && mc.screen instanceof MenuScreen) mc.setScreen(null);
	}

	private boolean rolls() { return page.equals("menuclans") || page.equals("menutraits") || page.equals("menutechnique"); }

	@Override
	protected void init() {
		if (rolls()) {
			int y = height - 40;
			addRenderableWidget(Button.builder(Component.literal("Roll"), b -> send(0, "next")).bounds(width / 2 - 104, y, 100, 20).build());
			addRenderableWidget(Button.builder(Component.literal("Continue"), b -> send(0, "select")).bounds(width / 2 + 4, y, 100, 20).build());
		}
	}

	private static void send(int scroll, String press) { Net.CHANNEL.sendToServer(new Net.Menu("", scroll, press)); }

	private Spot at(double x, double y) {
		for (Spot s : spots) if (s.has(x, y)) return s;
		return null;
	}

	@Override
	public void render(GuiGraphics g, int mx, int my, float partial) {
		if (rolls() && children().isEmpty()) init();
		if (!rolls() && !children().isEmpty()) clearWidgets();
		Spot s = at(mx, my);
		if (s != null) {
			int k = OPTIONS.get(s.ch);
			if (k != hovered) { hovered = k; send(k, ""); }
		} else hovered = 0;
		if (page.equals("startscreen")) {
			Component t = Component.literal("§7Click to start");
			g.drawString(font, t, width / 2 - font.width(t) / 2, height - 30, 0xFFFFFF, true);
		}
		super.render(g, mx, my, partial);
	}

	@Override
	public boolean mouseClicked(double mx, double my, int button) {
		if (super.mouseClicked(mx, my, button)) return true;
		if (button == 1) { send(0, "next"); return true; }
		Spot s = at(mx, my);
		if (s != null) { send(OPTIONS.get(s.ch), "select"); return true; }
		if (page.equals("startscreen")) { send(0, "select"); return true; }
		return false;
	}

	@Override
	public boolean keyPressed(int key, int scan, int mods) {
		Minecraft mc = Minecraft.getInstance();
		if (key == org.lwjgl.glfw.GLFW.GLFW_KEY_ESCAPE) { mc.setScreen(new PauseScreen(true)); return true; }
		if (mc.options.keyJump.matches(key, scan)) { send(0, "select"); return true; }
		if (mc.options.keyShift.matches(key, scan)) { send(0, "next"); return true; }
		return super.keyPressed(key, scan, mods);
	}

	@Override
	public boolean isPauseScreen() { return false; }

	@Override
	public void renderBackground(GuiGraphics g) { }

	@Override
	public boolean shouldCloseOnEsc() { return false; }
}
