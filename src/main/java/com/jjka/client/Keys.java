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
 * Technique mode (R): scroll or Z / X picks a technique, the move keys (1-9) use its moves. C: dash. J: what you have and
 * how to use it. H: your fighting style's moves in the corner.
 * The keys are read straight from the keyboard, so they work even when another mod uses the same key.
 */
public final class Keys {
	private Keys() {}

	static final String CATEGORY = "key.categories.jjka";

	private static KeyMapping key(String name, int k) { return new KeyMapping("key.jjka." + name, KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, k, CATEGORY); }

	public static final KeyMapping MODE = key("mode", GLFW.GLFW_KEY_R), PREV = key("prev", GLFW.GLFW_KEY_Z), NEXT = key("next", GLFW.GLFW_KEY_X),
			DASH = key("dash", GLFW.GLFW_KEY_C), INFO = key("info", GLFW.GLFW_KEY_J), STYLE_HUD = key("style_hud", GLFW.GLFW_KEY_H);
	public static final KeyMapping[] MOVES = new KeyMapping[9];
	static {
		for (int i = 0; i < 9; i++) MOVES[i] = key("move" + (i + 1), GLFW.GLFW_KEY_1 + i);
	}

	/** The bar as the server last sent it (all the add-on's locked items, fighting styles and dash included) */
	static final Items.Bar bar = new Items.Bar();
	private static double changedAt = -10;
	private static boolean jumpWas;
	static boolean styleHud = true;

	public static void register(RegisterKeyMappingsEvent e) {
		for (KeyMapping k : new KeyMapping[] { MODE, PREV, NEXT, DASH, INFO, STYLE_HUD }) e.register(k);
		for (KeyMapping k : MOVES) e.register(k);
	}

	/** the bar's techniques (not fighting styles or the dash), as indexes into bar.items */
	static List<Integer> techniques() {
		List<Integer> out = new ArrayList<>();
		for (int i = 0; i < bar.items.size(); i++) {
			String id = bar.items.get(i);
			if (!Items.style(id) && !id.equals("ds:dash") && !Moves.of(id).isEmpty()) out.add(i);
		}
		return out;
	}

	static List<String> styles() {
		List<String> out = new ArrayList<>();
		for (String id : bar.items) if (Items.style(id) && !out.contains(id)) out.add(id);
		return out;
	}

	static boolean active() { return bar.on && !techniques().isEmpty(); }

	static void bar(List<String> items, int selected, boolean on, String style) {
		boolean changed = bar.selected != selected || bar.on != on || !bar.items.equals(items);
		bar.items.clear();
		bar.items.addAll(items);
		bar.selected = selected;
		bar.on = on;
		bar.style = style == null || style.isEmpty() ? null : style;
		if (changed) changedAt = Screen.now();
		List<Integer> t = techniques();
		if (!t.isEmpty() && !t.contains(bar.selected)) choose(t.get(0), bar.on);
	}

	static void choose(int index, boolean on) {
		bar.selected = index;
		bar.on = on;
		changedAt = Screen.now();
		send();
	}

	static void chooseStyle(String id) {
		bar.style = id;
		send();
	}

	private static void send() { Net.CHANNEL.sendToServer(new Net.Bar(new ArrayList<>(), bar.selected, bar.on, bar.style == null ? "" : bar.style)); }

	private static void step(int d) {
		List<Integer> t = techniques();
		if (t.isEmpty()) return;
		int at = Math.max(0, t.indexOf(bar.selected));
		choose(t.get(Math.floorMod(at + d, t.size())), true);
	}

	private static boolean is(KeyMapping k, int key, int scan) { return !k.isUnbound() && k.getKey().getType() == InputConstants.Type.KEYSYM && k.matches(key, scan); }

	private static boolean isMouse(KeyMapping k, int button) { return !k.isUnbound() && k.getKey().getType() == InputConstants.Type.MOUSE && k.getKey().getValue() == button; }

	/** Every key press, before (and regardless of) Minecraft's own key bindings */
	public static void key(InputEvent.Key e) {
		if (e.getAction() != GLFW.GLFW_PRESS) return;
		pressed(k -> is(k, e.getKey(), e.getScanCode()));
	}

	public static void mouse(InputEvent.MouseButton.Pre e) {
		if (e.getAction() != GLFW.GLFW_PRESS) return;
		pressed(k -> isMouse(k, e.getButton()));
	}

	private static void pressed(java.util.function.Predicate<KeyMapping> hit) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.screen != null) return;
		if (hit.test(INFO)) { mc.setScreen(new MovesScreen()); return; }
		if (hit.test(STYLE_HUD)) styleHud = !styleHud;
		if (hit.test(MODE)) {
			List<Integer> t = techniques();
			choose(t.contains(bar.selected) || t.isEmpty() ? bar.selected : t.get(0), !bar.on);
		}
		if (hit.test(DASH)) Net.CHANNEL.sendToServer(new Net.Press("dash", 0));
		if (!active()) return;
		if (hit.test(PREV)) step(-1);
		if (hit.test(NEXT)) step(1);
		int n = Moves.of(bar.items.get(bar.selected)).size();
		for (int i = 0; i < 9; i++) if (hit.test(MOVES[i]) && i < n) Net.CHANNEL.sendToServer(new Net.Press("move", i));
	}

	/** Start of each client tick: in technique mode the hotbar keys don't change your hotbar */
	public static void tick() {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null) return;
		for (KeyMapping k : new KeyMapping[] { MODE, PREV, NEXT, DASH, INFO, STYLE_HUD }) while (k.consumeClick()) { }
		for (KeyMapping k : MOVES) while (k.consumeClick()) { }
		if (active() && mc.screen == null) for (KeyMapping k : mc.options.keyHotbarSlots) while (k.consumeClick()) { }
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
		if (e.isAttack()) {
			// during the add-on's cutscene camera the crosshair can land on yourself (or on an item / arrow): attacking that
			// gets you kicked ("attempting to attack an invalid entity"), so only the add-on's punch goes through
			if (mc.hitResult instanceof net.minecraft.world.phys.EntityHitResult h && (Screen.camOn() || h.getEntity() == mc.player
					|| h.getEntity() instanceof net.minecraft.world.entity.item.ItemEntity || h.getEntity() instanceof net.minecraft.world.entity.ExperienceOrb
					|| h.getEntity() instanceof net.minecraft.world.entity.projectile.AbstractArrow)) {
				e.setCanceled(true);
				e.setSwingHand(true);
			}
			Net.CHANNEL.sendToServer(new Net.Input(jump, false, true, false));
			return;
		}
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

	static String keyName(KeyMapping k) { return k.isUnbound() ? "(unbound)" : k.getTranslatedKeyMessage().getString(); }

	private static final ResourceLocation WIDGETS = new ResourceLocation("textures/gui/widgets.png");

	static void drawBar(GuiGraphics g, int w, int h) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.options.hideGui) return;
		drawStyle(g, w, h);
		if (!active()) return;
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
		String tech = bar.items.get(bar.selected);
		List<Moves.Move> moves = Moves.of(tech);
		int lineY = y - 12 - moves.size() * 10;
		ItemStack s = Screen.stack(tech);
		Component title = s.isEmpty() ? Component.literal(tech) : s.getHoverName();
		for (int i = 0; i < moves.size() && i < 9; i++) {
			String line = "§e[" + keyName(MOVES[i]) + "] §f" + moves.get(i).name();
			g.drawString(mc.font, Component.literal(line), x + 184 + 4, lineY + 12 + i * 10 - 10 * 0, 0xFFFFFF, true);
		}
		double since = Screen.now() - changedAt;
		if (since < 1.5) {
			int a = since < 1 ? 255 : (int) (255 * (1.5 - since) / 0.5);
			if (a > 8) g.drawString(mc.font, title, w / 2 - mc.font.width(title) / 2, y - 14, 0xFFFFFF | a << 24, true);
		}
	}

	/** Bottom left: the fighting style in use and how to do its moves (toggle with H) */
	static void drawStyle(GuiGraphics g, int w, int h) {
		if (!styleHud) return;
		String style = bar.activeStyle();
		if (style == null) return;
		Minecraft mc = Minecraft.getInstance();
		List<Moves.Move> moves = Moves.of(style);
		ItemStack s = Screen.stack(style);
		int y = h - 6 - (moves.size() + 2) * 10;
		g.drawString(mc.font, s.isEmpty() ? Component.literal(style) : s.getHoverName(), 4, y, 0xFFFFFF, true);
		g.drawString(mc.font, Component.literal("§7Left click §f- punches"), 4, y + 10, 0xFFFFFF, true);
		for (int i = 0; i < moves.size(); i++) {
			Moves.Move m = moves.get(i);
			g.drawString(mc.font, Component.literal("§7" + Moves.how(m, "Right click") + " §f- " + m.name()), 4, y + 20 + i * 10, 0xFFFFFF, true);
		}
	}
}
