package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Each technique item's moves, read from its description ("Spacial Pull (Hold-Jump+Right-Click)" ...), so each can go on
 * its own key. Pressing one fakes that move's input combination for a moment and uses the item, and the add-on's own code
 * does the rest.
 */
public final class Moves {
	private Moves() {}

	public record Move(String name, String how, boolean sneak, boolean doubleSneak, boolean jump, boolean lookUp, boolean lookDown, boolean punch, boolean sprint) {}

	/** How to do it on Java, with the click (or key) that triggers it */
	public static String how(Move m, String trigger) {
		if (m.doubleSneak()) return "Double sneak";
		StringBuilder b = new StringBuilder();
		if (m.sprint()) b.append("Sprint + ");
		if (m.sneak()) b.append("Sneak + ");
		if (m.jump()) b.append("Jump + ");
		if (m.lookUp()) b.append("Look up + ");
		if (m.lookDown()) b.append("Look down + ");
		b.append(m.punch() ? "Left click" : trigger);
		return b.toString();
	}

	private static final Map<String, List<Move>> CACHE = new HashMap<>();
	private static final Pattern PAREN = Pattern.compile("\\(([^()]*)\\)");
	private static final Pattern BRACKET = Pattern.compile("\\[\\s*(.+?) to (.+?)\\s*\\]");
	private static final Pattern KEY = Pattern.compile("(?i)click|punch|sneak|jump|look|sprint|m1");

	public static synchronized List<Move> of(String itemId) {
		if (itemId == null) return List.of();
		return CACHE.computeIfAbsent(itemId, Moves::parse);
	}

	private static List<Move> parse(String id) {
		List<Move> out = new ArrayList<>();
		String text = Items.description(id);
		if (text == null) return out;
		text = text.replaceAll("§.", "").replace("\r", "");
		for (String block : text.split("\\n\\s*\\n")) {
			List<String> lines = new ArrayList<>();
			for (String l : block.split("\\n")) if (!l.trim().isEmpty()) lines.add(l.trim());
			// "[ Right-Click to Switch Shikigami ]" lines (the Shadow Wheel): one move each
			boolean bracketed = false;
			for (String l : lines) {
				Matcher bm = BRACKET.matcher(l);
				if (!bm.matches() || !KEY.matcher(bm.group(1)).find()) continue;
				bracketed = true;
				String c = bm.group(1).toLowerCase(Locale.ROOT), nm = bm.group(2).trim();
				nm = Character.toUpperCase(nm.charAt(0)) + nm.substring(1);
				out.add(new Move(nm, bm.group(1).trim(), c.contains("sneak"), false, c.contains("jump"), c.contains("look up"), c.contains("look down"),
						c.contains("punch") || c.contains("m1") || c.contains("left"), c.contains("sprint")));
			}
			if (bracketed) continue;
			if (lines.isEmpty() || lines.get(0).startsWith("-") || lines.get(0).startsWith("[")) continue;
			String first = lines.get(0), name = first, cond = null;
			// "(Sneak + Right Click) to Flashstep" / "Sneak + Punch to disable infinity"
			int to = first.indexOf(" to ");
			if (to > 0 && KEY.matcher(first.substring(0, to)).find()) {
				cond = first.substring(0, to).replace("(", "").replace(")", "");
				name = first.substring(to + 4);
				name = Character.toUpperCase(name.charAt(0)) + name.substring(1);
			}
			if (cond == null) for (String l : lines) {
				if (l.startsWith("Variants:")) continue;
				Matcher m = PAREN.matcher(l);
				while (m.find()) if (KEY.matcher(m.group(1)).find()) { cond = m.group(1); break; }
				if (cond != null) break;
			}
			boolean cost = false;
			for (String l : lines) if (l.toLowerCase(Locale.ROOT).contains("cost")) cost = true;
			if (cond == null && !cost) continue; // the item's title
			name = PAREN.matcher(name).replaceAll("").trim();
			if (name.isEmpty()) continue;
			String c = cond == null ? "right-click" : cond.toLowerCase(Locale.ROOT);
			boolean dbl = c.contains("double sneak");
			boolean punch = c.contains("punch") || c.contains("m1");
			out.add(new Move(name, cond == null ? "Right-Click" : cond.trim(), c.contains("sneak") && !dbl, dbl, c.contains("jump"),
					c.contains("look up") || c.contains("looking up") || c.contains("straight up"),
					c.contains("look down") || c.contains("looking down") || c.contains("straight down"), punch, c.contains("sprint")));
		}
		// an item whose description lists no moves (Domain Amplification, Boogie Woogie's 2nd skill ...) is used as it is:
		// one move, right click, named after the item
		if (out.isEmpty()) {
			String title = text.split("\\n")[0].trim();
			if (!title.isEmpty()) out.add(new Move(title, "Right-Click", false, false, false, false, false, false, false));
		}
		return out;
	}
}
