package com.jjka.client;

import java.util.ArrayList;
import java.util.List;

import org.lwjgl.glfw.GLFW;

import com.jjka.bedrock.Items;
import com.jjka.bedrock.Moves;
import com.jjka.bedrock.Net;
import com.mojang.blaze3d.platform.InputConstants;

import net.minecraft.client.KeyMapping;
import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.ItemStack;
import net.minecraftforge.client.event.InputEvent;
import net.minecraftforge.client.event.RegisterKeyMappingsEvent;
import net.minecraftforge.client.settings.KeyConflictContext;

/**
 * Controls. Left click: your fighting style's punches, always. Right click (with sneak / jump): its special moves.
 * Technique mode (R): scroll or Z / X picks a technique, 1-9 use that technique's moves (no combos). C: dash.
 */
public final class Keys {
	private Keys() {}

	static final String CATEGORY = "key.categories.jjka";
	public static final KeyMapping MODE = new KeyMapping("key.jjka.mode", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_R, CATEGORY);
	public static final KeyMapping PREV = new KeyMapping("key.jjka.prev", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_Z, CATEGORY);
	public static final KeyMapping NEXT = new KeyMapping("key.jjka.next", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_X, CATEGORY);
	public static final KeyMapping DASH = new KeyMapping("key.jjka.dash", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_C, CATEGORY);

	/** The bar as the server last sent it (all the add-on's locked items, fighting style and dash included) */
	static final Items.Bar bar = new Items.Bar();
	private static double changedAt = -10;
	private static boolean jumpWas;

	public static void register(RegisterKeyMappingsEvent e) {
		e.register(MODE);
		e.register(PREV);
		e.register(NEXT);
		e.register(DASH);
	}

	/** the bar's techniques (not the fighting style or the dash), as indexes into bar.items */
	static List<Integer> techniques() {
		List<Integer> out = new ArrayList<>();
		for (int i = 0; i < bar.items.size(); i++) {
			String id = bar.items.get(i);
			if (!Items.style(id) && !id.equals("ds:dash") && !Moves.of(id).isEmpty()) out.add(i);
		}
		return out;
	}

	static boolean active() { return bar.on && !techniques().isEmpty(); }

	static void bar(List<String> items, int selected, boolean on) {
		boolean changed = bar.selected != selected || bar.on != on || !bar.items.equals(items);
		bar.items.clear();
		bar.items.addAll(items);
		bar.selected = selected;
		bar.on = on;
		if (changed) changedAt = Screen.now();
		// keep the selection on a technique
		List<Integer> t = techniques();
		if (!t.isEmpty() && !t.contains(bar.selected)) choose(t.get(0), bar.on);
	}

	private static void choose(int index, boolean on) {
		bar.selected = index;
		bar.on = on;
		changedAt = Screen.now();
		Net.CHANNEL.sendToServer(new Net.Bar(new ArrayList<>(), index, on));
	}

	private static void step(int d) {
		List<Integer> t = techniques();
		if (t.isEmpty()) return;
		int at = Math.max(0, t.indexOf(bar.selected));
		choose(t.get(Math.floorMod(at + d, t.size())), true);
	}

	/** Start of each client tick: before vanilla reads the hotbar keys */
	public static void tick() {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.screen != null) return;
		while (MODE.consumeClick()) {
			List<Integer> t = techniques();
			choose(t.contains(bar.selected) || t.isEmpty() ? bar.selected : t.get(0), !bar.on);
		}
		while (DASH.consumeClick()) Net.CHANNEL.sendToServer(new Net.Press("dash", 0));
		if (active()) {
			int n = Moves.of(bar.items.get(bar.selected)).size();
			for (int i = 0; i < 9; i++) while (mc.options.keyHotbarSlots[i].consumeClick()) if (i < n) Net.CHANNEL.sendToServer(new Net.Press("move", i));
			while (PREV.consumeClick()) step(-1);
			while (NEXT.consumeClick()) step(1);
		} else {
			while (PREV.consumeClick()) { }
			while (NEXT.consumeClick()) { }
		}
		boolean jump = mc.options.keyJump.isDown();
		if (jump != jumpWas) {
			jumpWas = jump;
			Net.CHANNEL.sendToServer(new Net.Input(jump, false, false, false));
		}
	}

	/**
	 * Right click with your hands free (or in technique mode) uses your fighting style's special move; left click always
	 * punches with it. Real items in your hand still work normally outside technique mode.
	 */
	public static void interact(InputEvent.InteractionKeyMappingTriggered e) {
		Minecraft mc = Minecraft.getInstance();
		boolean jump = mc.options.keyJump.isDown();
		if (e.isAttack()) { Net.CHANNEL.sendToServer(new Net.Input(jump, false, true, false)); return; }
		if (!e.isUseItem()) return;
		boolean free = mc.player != null && mc.player.getMainHandItem().isEmpty();
		if (active() || free) {
			if (active()) { e.setCanceled(true); e.setSwingHand(false); }
			Net.CHANNEL.sendToServer(new Net.Input(jump, true, false, true));
		} else Net.CHANNEL.sendToServer(new Net.Input(jump, false, false, true));
	}

	public static void scroll(InputEvent.MouseScrollingEvent e) {
		Minecraft mc = Minecraft.getInstance();
		if (!active() || mc.screen != null) return;
		e.setCanceled(true);
		step(e.getScrollDelta() > 0 ? -1 : 1);
	}

	private static final ResourceLocation WIDGETS = new ResourceLocation("textures/gui/widgets.png");

	static void drawBar(GuiGraphics g, int w, int h) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || !active() || mc.options.hideGui) return;
		List<Integer> t = techniques();
		int n = Math.min(9, t.size());
		int x = w / 2 - 91, y = h - 22;
		g.blit(WIDGETS, x, y, 0, 0, 182, 22);
		int sel = Math.max(0, t.indexOf(bar.selected));
		if (sel < n) g.blit(WIDGETS, x - 1 + sel * 20, y - 1, 0, 22, 24, 22);
		for (int i = 0; i < n; i++) {
			ItemStack s = Screen.stack(bar.items.get(t.get(i)));
			if (!s.isEmpty()) g.renderItem(s, x + 3 + i * 20, y + 3);
		}
		// the selected technique's moves, one key each
		String tech = bar.items.get(bar.selected);
		List<Moves.Move> moves = Moves.of(tech);
		int lineY = y - 12 - moves.size() * 10;
		ItemStack s = Screen.stack(tech);
		Component title = s.isEmpty() ? Component.literal(tech) : s.getHoverName();
		g.drawString(mc.font, title, x + 184 + 4, y + 7, 0xFFFFFF, true);
		for (int i = 0; i < moves.size() && i < 9; i++) {
			Moves.Move m = moves.get(i);
			String line = "§e" + (i + 1) + " §f" + m.name();
			g.drawString(mc.font, Component.literal(line), x, lineY + i * 10, 0xFFFFFF, true);
		}
		double since = Screen.now() - changedAt;
		if (since < 1.5) {
			int a = since < 1 ? 255 : (int) (255 * (1.5 - since) / 0.5);
			if (a > 8) g.drawString(mc.font, title, w / 2 - mc.font.width(title) / 2, y - 24 - moves.size() * 10, 0xFFFFFF | a << 24, true);
		}
	}
}
