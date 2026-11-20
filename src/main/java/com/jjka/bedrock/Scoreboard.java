package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;

/** The scoreboard command, on top of Scores */
final class Scoreboard {
	private Scoreboard() {}

	/** Who a score target names: entities, or a fake player name */
	static List<Object> holders(Commands.Ctx c, Commands.Target t) {
		List<Object> out = new ArrayList<>();
		if (t.isSelector()) out.addAll(t.entities(c));
		else if (t.name().equals("*")) out.add("*");
		else {
			ServerPlayer p = c.server.getPlayerList().getPlayerByName(t.name());
			out.add(p != null ? p : t.name());
		}
		return out;
	}

	static Integer read(Commands.Ctx c, Commands.Target t, String obj) {
		Scores s = Scores.current();
		if (s == null) return null;
		List<Object> hs = holders(c, t);
		if (hs.isEmpty()) return null;
		Object h = hs.get(0);
		return h instanceof Entity e ? s.get(e, obj) : s.get((String) h, obj);
	}

	private static Integer get(Scores s, Object h, String obj) { return h instanceof Entity e ? s.get(e, obj) : s.get((String) h, obj); }

	private static void set(Scores s, Object h, String obj, int v) { if (h instanceof Entity e) s.set(e, obj, v); else s.set((String) h, obj, v); }

	static Commands.Cmd parse(Commands.R r) {
		String what = r.word().toLowerCase(Locale.ROOT);
		if (what.equals("objectives")) {
			String op = r.word().toLowerCase(Locale.ROOT);
			switch (op) {
				case "add" -> {
					String name = r.word();
					r.word(); // dummy
					String display = r.end() ? name : r.name();
					return c -> Scores.current().add(name, display) ? 1 : 0;
				}
				case "remove" -> { String name = r.word(); return c -> { Scores.current().remove(name); return 1; }; }
				case "setdisplay" -> {
					String slot = r.word().toLowerCase(Locale.ROOT);
					String name = r.end() ? null : r.word();
					return c -> {
						if (name == null) Scores.current().displays.remove(slot); else Scores.current().displays.put(slot, name);
						Scores.current().setDirty();
						Net.sidebar(c.server);
						return 1;
					};
				}
				default -> { return c -> 0; }
			}
		}
		if (!what.equals("players")) return c -> 0;
		String op = r.word().toLowerCase(Locale.ROOT);
		switch (op) {
			case "set", "add", "remove" -> {
				Commands.Target t = r.target();
				String obj = r.word();
				int v = (int) Math.round(r.num());
				return c -> {
					Scores s = Scores.current();
					int n = 0;
					for (Object h : holders(c, t)) {
						if (h.equals("*")) continue;
						Integer cur = get(s, h, obj);
						int base = cur == null ? 0 : cur;
						set(s, h, obj, op.equals("set") ? v : op.equals("add") ? base + v : base - v);
						n++;
					}
					return n;
				};
			}
			case "reset" -> {
				Commands.Target t = r.target();
				String obj = r.end() ? null : r.word();
				return c -> {
					Scores s = Scores.current();
					for (Object h : holders(c, t)) { if (h instanceof Entity e) s.reset(e, obj); else if (!h.equals("*")) s.reset((String) h, obj); }
					return 1;
				};
			}
			case "random" -> {
				Commands.Target t = r.target();
				String obj = r.word();
				long min = (long) r.num(), max = (long) r.num();
				return c -> {
					Scores s = Scores.current();
					for (Object h : holders(c, t)) if (!h.equals("*")) set(s, h, obj, (int) (min + (long) (Math.random() * (max - min + 1))));
					return 1;
				};
			}
			case "test" -> {
				Commands.Target t = r.target();
				String obj = r.word();
				String a = r.word(), b = r.end() ? "*" : r.word();
				return c -> {
					Integer v = read(c, t, obj);
					if (v == null) return 0;
					int lo = a.equals("*") ? Integer.MIN_VALUE : Integer.parseInt(a), hi = b.equals("*") ? Integer.MAX_VALUE : Integer.parseInt(b);
					return v >= lo && v <= hi ? 1 : 0;
				};
			}
			case "operation" -> {
				Commands.Target t = r.target();
				String obj = r.word();
				String o = r.word();
				Commands.Target src = r.target();
				String sobj = r.word();
				return c -> {
					Scores s = Scores.current();
					List<Object> sources = holders(c, src);
					int n = 0;
					for (Object h : holders(c, t)) {
						if (h.equals("*")) continue;
						for (Object sh : sources) {
							if (sh.equals("*")) continue;
							Integer sv = get(s, sh, sobj);
							if (sv == null) continue;
							Integer cur = get(s, h, obj);
							int a = cur == null ? 0 : cur, b = sv;
							int res;
							switch (o) {
								case "=" -> res = b;
								case "+=" -> res = a + b;
								case "-=" -> res = a - b;
								case "*=" -> res = a * b;
								case "/=" -> res = b == 0 ? a : Math.floorDiv(a, b);
								case "%=" -> res = b == 0 ? a : Math.floorMod(a, b);
								case "<" -> res = Math.min(a, b);
								case ">" -> res = Math.max(a, b);
								case "><" -> { res = b; set(s, sh, sobj, a); }
								default -> res = a;
							}
							set(s, h, obj, res);
							n++;
						}
					}
					return n;
				};
			}
			case "list" -> { return c -> 1; }
			default -> { return c -> 0; }
		}
	}
}
