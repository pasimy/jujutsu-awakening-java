package com.jjka.client;

import java.util.ArrayList;
import java.util.List;

import com.jjka.bedrock.Moves;

import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.ItemStack;

/**
 * J: everything you can use and how. Your fighting styles (click one to use it), every technique with its moves and the
 * key for each, and the dash.
 */
public final class MovesScreen extends net.minecraft.client.gui.screens.Screen {
	/** action: "style:<id>" picks a fighting style, "equip:<index>" switches technique */
	private record Line(String text, String action, int indent) {}

	private final List<Line> lines = new ArrayList<>();
	private double scroll;

	public MovesScreen() { super(Component.literal("Techniques")); }

	@Override
	protected void init() {
		lines.clear();
		List<String> styles = Keys.styles();
		String active = Keys.bar.activeStyle();
		lines.add(new Line("§6§lFighting style", null, 0));
		if (styles.isEmpty()) lines.add(new Line("§7(none yet)", null, 1));
		for (String s : styles) {
			boolean on = s.equals(active);
			lines.add(new Line((on ? "§a▶ " : "§7  ") + name(s) + (on ? " §8(in use)" : " §8(click to use)"), "style:" + s, 1));
			if (!on) continue;
			lines.add(new Line("§7Left click §f- punches", null, 2));
			for (Moves.Move m : Moves.of(s)) lines.add(new Line("§7" + Moves.how(m, "Right click") + " §f- " + m.name(), null, 2));
		}
		lines.add(new Line("", null, 0));
		lines.add(new Line("§6§lTechniques §7(" + Keys.keyName(Keys.MODE) + ": technique mode, scroll or " + Keys.keyName(Keys.PREV) + " / " + Keys.keyName(Keys.NEXT) + ": pick one)", null, 0));
		List<Integer> t = Keys.techniques();
		if (t.isEmpty()) lines.add(new Line("§7(none yet)", null, 1));
		for (int idx : t) {
			String id = Keys.bar.items.get(idx);
			boolean sel = idx == Keys.bar.selected;
			lines.add(new Line((sel ? "§b▶ " : "§f  ") + name(id), null, 1));
			List<Moves.Move> moves = Moves.of(id);
			for (int i = 0; i < moves.size(); i++) {
				String key = i < 9 ? Keys.keyName(Keys.MOVES[i]) : "-";
				lines.add(new Line("§e[" + key + "] §f" + moves.get(i).name() + " §8(Bedrock: " + moves.get(i).how() + ")", null, 2));
			}
		}
		List<Integer> other = new ArrayList<>();
		List<String> seen = new ArrayList<>();
		for (int i = 0; i < Keys.bar.items.size(); i++) { String id = Keys.bar.items.get(i); if (!Keys.bar.shown(id) && !seen.contains(id)) { seen.add(id); other.add(i); } }
		if (!other.isEmpty()) {
			lines.add(new Line("", null, 0));
			lines.add(new Line("§6§lOther techniques you own", null, 0));
			for (int i : other) lines.add(new Line("§7  " + name(Keys.bar.items.get(i)) + " §8(click to switch to it)", "equip:" + i, 1));
		}
		boolean stats = Keys.bar.items.contains("ds:stats_book"), energy = Keys.bar.items.contains("ds:cursedenergy");
		if (stats || energy) {
			lines.add(new Line("", null, 0));
			lines.add(new Line("§6§lTools", null, 0));
			if (stats) lines.add(new Line("§e[" + Keys.keyName(Keys.STATS) + "] §f" + name("ds:stats_book"), null, 1));
			if (energy) {
				lines.add(new Line("§e[" + Keys.keyName(Keys.ENERGY) + "] §fCursed Energy Manipulation", null, 1));
				lines.add(new Line("§e[Sneak + " + Keys.keyName(Keys.ENERGY) + "] §fswitch its output", null, 1));
			}
		}
		if (Keys.bar.items.contains("ds:dash")) {
			lines.add(new Line("", null, 0));
			lines.add(new Line("§6§lDash", null, 0));
			lines.add(new Line("§7" + Keys.keyName(Keys.DASH) + " §f- dash", null, 1));
			for (Moves.Move m : Moves.of("ds:dash")) lines.add(new Line("§7" + Moves.how(m, Keys.keyName(Keys.DASH)) + " §f- " + m.name(), null, 1));
		}
		lines.add(new Line("", null, 0));
		lines.add(new Line("§8" + Keys.keyName(Keys.STYLE_HUD) + ": show / hide your style's moves in the corner. All keys can be changed in Controls.", null, 0));
	}

	private static String name(String id) {
		ItemStack s = Screen.stack(id);
		return s.isEmpty() ? id : s.getHoverName().getString();
	}

	@Override
	public void render(GuiGraphics g, int mx, int my, float partial) {
		renderBackground(g);
		g.drawCenteredString(font, Component.literal("§lWhat you can use"), width / 2, 10, 0xFFFFFF);
		int top = 26, y = top - (int) scroll;
		for (Line l : lines) {
			if (y >= top - 10 && y < height - 10) g.drawString(font, Component.literal(l.text), 20 + l.indent * 12, y, 0xFFFFFF, true);
			y += 11;
		}
		super.render(g, mx, my, partial);
	}

	@Override
	public boolean mouseClicked(double mx, double my, int button) {
		int top = 26, y = top - (int) scroll;
		for (Line l : lines) {
			if (l.action != null && my >= y - 1 && my < y + 10) {
				if (l.action.startsWith("style:")) Keys.chooseStyle(l.action.substring(6));
				else if (l.action.startsWith("equip:")) { com.jjka.bedrock.Net.CHANNEL.sendToServer(new com.jjka.bedrock.Net.Press("equip", Integer.parseInt(l.action.substring(6)))); onClose(); return true; }
				init();
				return true;
			}
			y += 11;
		}
		return super.mouseClicked(mx, my, button);
	}

	@Override
	public boolean mouseScrolled(double mx, double my, double delta) {
		int max = Math.max(0, lines.size() * 11 - (height - 40));
		scroll = Math.max(0, Math.min(max, scroll - delta * 22));
		return true;
	}

	@Override
	public boolean keyPressed(int key, int scan, int mods) {
		if (Keys.INFO.matches(key, scan)) { onClose(); return true; }
		return super.keyPressed(key, scan, mods);
	}

	@Override
	public boolean isPauseScreen() { return false; }
}
