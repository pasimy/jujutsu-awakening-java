package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.level.GameType;
import net.minecraft.world.phys.AABB;
import net.minecraft.world.phys.Vec3;

/** A Bedrock target selector (@a @e @p @r @s @initiator) with its arguments, parsed once */
public final class Selector {
	final char kind;
	final List<Arg> args = new ArrayList<>();
	Double x, y, z, dx, dy, dz, r, rm, rx, rxm, ry, rym;
	Integer c, l, lm;
	boolean xRel, yRel, zRel;
	final List<String[]> types = new ArrayList<>(); // {id, "!"?}
	final List<String[]> families = new ArrayList<>();
	final List<String[]> names = new ArrayList<>();
	final List<String[]> tags = new ArrayList<>();
	final List<String[]> modes = new ArrayList<>();
	final List<Object[]> scores = new ArrayList<>(); // {objective, Range}
	final List<JsonObject> hasitem = new ArrayList<>();
	final List<Object[]> props = new ArrayList<>(); // {name, value string, negate}

	interface Arg {}

	/** A score test: 1..5, 3.., ..2, 4, !3, !1..2 */
	public record Range(int min, int max, boolean not) {
		public static Range parse(String s) {
			s = s.trim();
			boolean not = s.startsWith("!");
			if (not) s = s.substring(1).trim();
			int dots = s.indexOf("..");
			int min, max;
			if (dots < 0) { min = max = (int) Math.round(Double.parseDouble(s)); }
			else {
				String a = s.substring(0, dots).trim(), b = s.substring(dots + 2).trim();
				min = a.isEmpty() ? Integer.MIN_VALUE : (int) Math.round(Double.parseDouble(a));
				max = b.isEmpty() ? Integer.MAX_VALUE : (int) Math.round(Double.parseDouble(b));
			}
			return new Range(min, max, not);
		}

		public boolean test(int v) { boolean in = v >= min && v <= max; return not != in; }
	}

	private Selector(char kind) { this.kind = kind; }

	/** "@e[type=x,scores={a=1..}]" (the whole thing) */
	public static Selector parse(String text) {
		String t = text.trim();
		char k = t.length() > 1 ? Character.toLowerCase(t.charAt(1)) : 's';
		int open = t.indexOf('[');
		String head = open < 0 ? t : t.substring(0, open);
		if (head.equalsIgnoreCase("@initiator")) k = 'i';
		Selector s = new Selector(k);
		if (open >= 0) {
			int close = t.lastIndexOf(']');
			String body = t.substring(open + 1, close < 0 ? t.length() : close);
			for (String part : split(body, ',')) {
				int eq = part.indexOf('=');
				if (eq < 0) continue;
				String key = part.substring(0, eq).trim().toLowerCase(Locale.ROOT);
				String val = part.substring(eq + 1).trim();
				try { s.arg(key, val); } catch (RuntimeException e) { Bedrock.warnOnce("selector", "Bad selector argument " + key + "=" + val + " in " + text); }
			}
		}
		return s;
	}

	/** Splits on a separator that isn't inside {} [] or quotes */
	static List<String> split(String s, char sep) {
		List<String> out = new ArrayList<>();
		int depth = 0, start = 0;
		boolean q = false;
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			if (ch == '"') q = !q;
			else if (q) continue;
			else if (ch == '{' || ch == '[') depth++;
			else if (ch == '}' || ch == ']') depth--;
			else if (ch == sep && depth == 0) { out.add(s.substring(start, i)); start = i + 1; }
		}
		if (start < s.length()) out.add(s.substring(start));
		return out;
	}

	private static String unquote(String v) {
		v = v.trim();
		return v.length() >= 2 && v.startsWith("\"") && v.endsWith("\"") ? v.substring(1, v.length() - 1) : v;
	}

	private static String[] neg(String v) {
		v = v.trim();
		boolean n = v.startsWith("!");
		return new String[] { unquote(n ? v.substring(1) : v), n ? "!" : "" };
	}

	private void arg(String key, String val) {
		switch (key) {
			case "x" -> { xRel = val.startsWith("~"); x = num(val); }
			case "y" -> { yRel = val.startsWith("~"); y = num(val); }
			case "z" -> { zRel = val.startsWith("~"); z = num(val); }
			case "dx" -> dx = num(val);
			case "dy" -> dy = num(val);
			case "dz" -> dz = num(val);
			case "r" -> r = num(val);
			case "rm" -> rm = num(val);
			case "rx" -> rx = num(val);
			case "rxm" -> rxm = num(val);
			case "ry" -> ry = num(val);
			case "rym" -> rym = num(val);
			case "c" -> c = (int) Math.round(num(val));
			case "l" -> l = (int) num(val);
			case "lm" -> lm = (int) num(val);
			case "type" -> { String[] t = neg(val); t[0] = Bedrock.id(t[0]); types.add(t); }
			case "family" -> { String[] t = neg(val); t[0] = t[0].toLowerCase(Locale.ROOT); families.add(t); }
			case "name" -> names.add(neg(val));
			case "tag" -> tags.add(neg(val));
			case "m" -> modes.add(neg(val));
			case "scores" -> {
				String body = val.trim();
				if (body.startsWith("{")) body = body.substring(1, body.length() - 1);
				for (String p : split(body, ',')) {
					int eq = p.indexOf('=');
					if (eq < 0) continue;
					scores.add(new Object[] { unquote(p.substring(0, eq).trim()), Range.parse(p.substring(eq + 1)) });
				}
			}
			case "hasitem" -> {
				String t = val.trim();
				if (t.startsWith("[")) { for (String o : split(t.substring(1, t.endsWith("]") ? t.length() - 1 : t.length()), ',')) if (!o.isBlank()) hasitem.add(obj(o)); }
				else hasitem.add(obj(t));
			}
			case "has_property" -> {
				String body = val.trim();
				if (body.startsWith("{")) body = body.substring(1, body.length() - 1);
				for (String p : split(body, ',')) {
					int eq = p.indexOf('=');
					if (eq < 0) continue;
					String name = unquote(p.substring(0, eq).trim()), v = p.substring(eq + 1).trim();
					if (name.equals("property")) continue;
					boolean n = v.startsWith("!");
					props.add(new Object[] { name.toLowerCase(Locale.ROOT), unquote(n ? v.substring(1) : v), n });
				}
			}
			case "haspermission" -> { }
			default -> Bedrock.warnOnce("selector", "Unsupported selector argument " + key);
		}
	}

	/** {item=ds:x,location=slot.weapon.mainhand} -> JSON */
	private static JsonObject obj(String v) {
		JsonObject o = new JsonObject();
		String body = v.trim();
		if (body.startsWith("{")) body = body.substring(1, body.endsWith("}") ? body.length() - 1 : body.length());
		for (String p : split(body, ',')) {
			int eq = p.indexOf('=');
			if (eq < 0) continue;
			o.addProperty(unquote(p.substring(0, eq).trim()).toLowerCase(Locale.ROOT), unquote(p.substring(eq + 1).trim()));
		}
		return o;
	}

	private static double num(String v) {
		v = v.trim();
		if (v.startsWith("~") || v.startsWith("^")) v = v.substring(1);
		return v.isEmpty() ? 0 : Double.parseDouble(v);
	}

	// ------------------------------------------------------------------ evaluation
	public List<Entity> select(Commands.Ctx ctx) {
		List<Entity> out = new ArrayList<>();
		Vec3 pos = new Vec3(x == null ? ctx.pos.x : xRel ? ctx.pos.x + x : x, y == null ? ctx.pos.y : yRel ? ctx.pos.y + y : y, z == null ? ctx.pos.z : zRel ? ctx.pos.z + z : z);
		if (kind == 's') {
			if (ctx.self != null && !ctx.self.isRemoved() && matches(ctx.self, ctx, pos)) out.add(ctx.self);
			return out;
		}
		if (kind == 'i') {
			if (ctx.initiator != null && matches(ctx.initiator, ctx, pos)) out.add(ctx.initiator);
			return out;
		}
		boolean players = kind == 'a' || kind == 'p' || kind == 'r' && types.isEmpty();
		ServerLevel level = ctx.level;
		boolean local = r != null || dx != null || dy != null || dz != null || x != null || y != null || z != null;
		if (players) {
			for (ServerPlayer p : ctx.server.getPlayerList().getPlayers()) {
				if (local && p.level() != level) continue;
				if (kind != 'a' && !p.isAlive()) continue;
				if (matches(p, ctx, pos)) out.add(p);
			}
		} else {
			Iterable<Entity> pool;
			if (r != null && dx == null && dy == null && dz == null) {
				double rr = r + 2;
				pool = level.getEntities((Entity) null, new AABB(pos.x - rr, pos.y - rr, pos.z - rr, pos.x + rr, pos.y + rr, pos.z + rr), e -> true);
			} else if (dx != null || dy != null || dz != null) {
				pool = level.getEntities((Entity) null, box(pos).inflate(1), e -> true);
			} else pool = level.getAllEntities();
			for (Entity e : pool) {
				if (e.isRemoved() || e instanceof LivingEntity le && le.isDeadOrDying()) continue;
				if (matches(e, ctx, pos)) out.add(e);
			}
		}
		int count = c != null ? c : kind == 'p' || kind == 'r' ? 1 : Integer.MAX_VALUE;
		if (kind == 'r') {
			java.util.Collections.shuffle(out);
		} else if (count != Integer.MAX_VALUE || kind == 'p') {
			Comparator<Entity> near = Comparator.comparingDouble(e -> e.position().distanceToSqr(pos));
			out.sort(count < 0 ? near.reversed() : near);
		}
		int n = Math.abs(count);
		if (out.size() > n) return new ArrayList<>(out.subList(0, n));
		return out;
	}

	private AABB box(Vec3 pos) {
		double ax = pos.x, ay = pos.y, az = pos.z;
		double bx = ax + (dx == null ? 0 : dx), by = ay + (dy == null ? 0 : dy), bz = az + (dz == null ? 0 : dz);
		return new AABB(Math.min(ax, bx), Math.min(ay, by), Math.min(az, bz), Math.max(ax, bx) + 1, Math.max(ay, by) + 1, Math.max(az, bz) + 1);
	}

	public boolean matches(Entity e, Commands.Ctx ctx, Vec3 pos) {
		// cheap tests first
		for (String[] t : types) {
			String id = Actor.typeId(e);
			boolean is = id.equals(t[0]) || t[0].equals("minecraft:player") && e instanceof Player;
			if (t[1].isEmpty() != is) return false;
		}
		for (String[] t : tags) {
			boolean has;
			if (t[0].isEmpty()) has = !e.getTags().isEmpty();
			else has = e.getTags().contains(t[0]);
			if (t[0].isEmpty()) { if (t[1].isEmpty() == has) return false; }
			else if (t[1].isEmpty() != has) return false;
		}
		if (r != null || rm != null) {
			double d = e.position().distanceTo(pos);
			if (r != null && d > r) return false;
			if (rm != null && d < rm) return false;
		}
		if (dx != null || dy != null || dz != null) {
			if (!box(pos).intersects(e.getBoundingBox())) return false;
		}
		if (!scores.isEmpty()) {
			Scores sc = Scores.current();
			if (sc == null) return false;
			for (Object[] s : scores) {
				Integer v = sc.get(e, (String) s[0]);
				if (v == null || !((Range) s[1]).test(v)) return false;
			}
		}
		for (String[] f : families) if (f[1].isEmpty() != Actor.families(e).contains(f[0])) return false;
		for (String[] n : names) {
			String name = e instanceof Player p ? p.getGameProfile().getName() : e.hasCustomName() ? e.getCustomName().getString() : e.getName().getString();
			if (n[1].isEmpty() != name.equals(n[0])) return false;
		}
		for (String[] m : modes) {
			if (!(e instanceof ServerPlayer p)) return false;
			if (m[1].isEmpty() != gameMode(m[0], p.gameMode.getGameModeForPlayer())) return false;
		}
		if (l != null || lm != null) {
			if (!(e instanceof Player p)) return false;
			if (l != null && p.experienceLevel > l) return false;
			if (lm != null && p.experienceLevel < lm) return false;
		}
		float pitch = Queries.pitch(e);
		if (rx != null && pitch > rx) return false;
		if (rxm != null && pitch < rxm) return false;
		if (ry != null || rym != null) {
			float yaw = net.minecraft.util.Mth.wrapDegrees(e.getYRot());
			if (ry != null && yaw > ry) return false;
			if (rym != null && yaw < rym) return false;
		}
		for (JsonObject h : hasitem) if (!Items.matches(e, h)) return false;
		if (!props.isEmpty()) {
			Actor a = Actor.of(e);
			for (Object[] p : props) {
				Object have = a.property((String) p[0]);
				boolean neg = (Boolean) p[2];
				boolean eq;
				if (have == null) eq = false;
				else if (have instanceof Boolean b) eq = b == Boolean.parseBoolean((String) p[1]);
				else if (have instanceof String s) eq = s.equals(p[1]);
				else {
					String want = (String) p[1];
					if (want.contains("..")) eq = Range.parse(want).test((int) Math.round(Molang.num(have)));
					else try { eq = Molang.num(have) == Double.parseDouble(want); } catch (NumberFormatException ex) { eq = false; }
				}
				if (neg == eq) return false;
			}
		}
		return true;
	}

	private static boolean gameMode(String m, GameType t) {
		return switch (m.toLowerCase(Locale.ROOT)) {
			case "0", "s", "survival" -> t == GameType.SURVIVAL;
			case "1", "c", "creative" -> t == GameType.CREATIVE;
			case "2", "a", "adventure" -> t == GameType.ADVENTURE;
			case "spectator", "6", "sp" -> t == GameType.SPECTATOR;
			case "d", "default", "5" -> t == GameType.SURVIVAL;
			default -> false;
		};
	}

	static JsonArray none() { return new JsonArray(); }
}
