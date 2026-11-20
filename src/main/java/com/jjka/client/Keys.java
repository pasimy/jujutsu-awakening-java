package com.jjka.client;

import java.util.ArrayList;
import java.util.List;

import org.lwjgl.glfw.GLFW;

import com.jjka.bedrock.Items;
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
 * The technique bar and its keys. Technique mode (R) swaps your hotbar for your techniques: 1-9 or the scroll wheel pick
 * one (or Z / X), right click uses it (with sneak / jump / looking up or down for the variants, like on Bedrock).
 */
public final class Keys {
	private Keys() {}

	static final String CATEGORY = "key.categories.jjka";
	public static final KeyMapping MODE = new KeyMapping("key.jjka.mode", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_R, CATEGORY);
	public static final KeyMapping PREV = new KeyMapping("key.jjka.prev", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_Z, CATEGORY);
	public static final KeyMapping NEXT = new KeyMapping("key.jjka.next", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_X, CATEGORY);
	public static final KeyMapping USE = new KeyMapping("key.jjka.use", KeyConflictContext.IN_GAME, InputConstants.Type.KEYSYM, GLFW.GLFW_KEY_UNKNOWN, CATEGORY);

	/** The bar as the server last sent it */
	static final Items.Bar bar = new Items.Bar();
	private static double changedAt = -10;
	private static boolean jumpWas;

	public static void register(RegisterKeyMappingsEvent e) {
		e.register(MODE);
		e.register(PREV);
		e.register(NEXT);
		e.register(USE);
	}

	static void bar(List<String> items, int selected, boolean on) {
		boolean changed = bar.selected != selected || bar.on != on || !bar.items.equals(items);
		bar.items.clear();
		bar.items.addAll(items);
		bar.selected = selected;
		bar.on = on;
		if (changed) changedAt = Screen.now();
	}

	private static void choose(int slot, boolean on) {
		if (!bar.items.isEmpty()) slot = Math.floorMod(slot, bar.items.size());
		bar.selected = slot;
		bar.on = on;
		changedAt = Screen.now();
		Net.CHANNEL.sendToServer(new Net.Bar(new ArrayList<>(), slot, on));
	}

	/** Start of each client tick: before vanilla reads the hotbar keys */
	public static void tick() {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || mc.screen != null) return;
		while (MODE.consumeClick()) choose(bar.selected, !bar.on);
		if (bar.on && !bar.items.isEmpty()) {
			for (int i = 0; i < 9; i++) while (mc.options.keyHotbarSlots[i].consumeClick()) if (i < bar.items.size()) choose(i, true);
			while (PREV.consumeClick()) choose(bar.selected - 1, true);
			while (NEXT.consumeClick()) choose(bar.selected + 1, true);
		} else {
			while (PREV.consumeClick()) { }
			while (NEXT.consumeClick()) { }
		}
		boolean use = false;
		while (USE.consumeClick()) use = bar.on;
		boolean jump = mc.options.keyJump.isDown();
		if (jump != jumpWas || use) {
			jumpWas = jump;
			Net.CHANNEL.sendToServer(new Net.Input(jump, use, false, false));
		}
	}

	/** Right click in technique mode uses the selected technique instead of your held item */
	public static void interact(InputEvent.InteractionKeyMappingTriggered e) {
		boolean jump = Minecraft.getInstance().options.keyJump.isDown();
		if (e.isAttack()) { Net.CHANNEL.sendToServer(new Net.Input(jump, false, true, false)); return; }
		if (e.isUseItem() && (!bar.on || bar.items.isEmpty())) { Net.CHANNEL.sendToServer(new Net.Input(jump, false, false, true)); return; }
		if (!e.isUseItem()) return;
		e.setCanceled(true);
		e.setSwingHand(false);
		Net.CHANNEL.sendToServer(new Net.Input(jump, true, false, true));
	}

	public static void scroll(InputEvent.MouseScrollingEvent e) {
		Minecraft mc = Minecraft.getInstance();
		if (!bar.on || bar.items.isEmpty() || mc.screen != null) return;
		e.setCanceled(true);
		choose(bar.selected + (e.getScrollDelta() > 0 ? -1 : 1), true);
	}

	private static final ResourceLocation WIDGETS = new ResourceLocation("textures/gui/widgets.png");

	static void drawBar(GuiGraphics g, int w, int h) {
		Minecraft mc = Minecraft.getInstance();
		if (mc.player == null || bar.items.isEmpty() || !bar.on || mc.options.hideGui) return;
		int n = Math.min(9, bar.items.size());
		int x = w / 2 - 91, y = h - 22;
		g.blit(WIDGETS, x, y, 0, 0, 182, 22);
		int sel = Math.min(bar.selected, n - 1);
		g.blit(WIDGETS, x - 1 + sel * 20, y - 1, 0, 22, 24, 22);
		for (int i = 0; i < n; i++) {
			ItemStack s = Screen.stack(bar.items.get(i));
			if (!s.isEmpty()) g.renderItem(s, x + 3 + i * 20, y + 3);
		}
		g.drawString(mc.font, Component.literal("§bTechnique"), x - 56, y + 7, 0xFFFFFF, true);
		double since = Screen.now() - changedAt;
		if (since < 2.5 && sel >= 0) {
			ItemStack s = Screen.stack(bar.items.get(sel));
			if (!s.isEmpty()) {
				Component name = s.getHoverName();
				int a = since < 2 ? 255 : (int) (255 * (2.5 - since) / 0.5);
				if (a > 8) g.drawString(mc.font, name, w / 2 - mc.font.width(name) / 2, y - 14, 0xFFFFFF | a << 24, true);
			}
		}
	}
}
