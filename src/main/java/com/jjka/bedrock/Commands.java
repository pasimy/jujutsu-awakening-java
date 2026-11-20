package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import net.minecraft.core.BlockPos;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.game.ClientboundSoundPacket;
import net.minecraft.network.protocol.game.ClientboundStopSoundPacket;
import net.minecraft.core.Holder;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvent;
import net.minecraft.sounds.SoundSource;
import net.minecraft.util.Mth;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.effect.MobEffect;
import net.minecraft.world.effect.MobEffectInstance;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.MobSpawnType;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.level.GameRules;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.phys.Vec3;

/**
 * Runs Bedrock commands. Each distinct line is parsed once into a Cmd and cached; running it walks the execute chain with a
 * Ctx (who, where, facing which way). Unknown commands are logged once and skipped.
 */
public final class Commands {
	private Commands() {}

	/** Where a command runs: executor, position, rotation, anchor */
	public static final class Ctx {
		public MinecraftServer server;
		public ServerLevel level;
		public Entity self, initiator;
		public Vec3 pos;
		public float yRot, xRot;
		public boolean eyes;
		/** the function call depth, to stop runaway recursion */
		int depth;

		public Ctx copy() {
			Ctx c = new Ctx();
			c.server = server; c.level = level; c.self = self; c.initiator = initiator; c.pos = pos; c.yRot = yRot; c.xRot = xRot; c.eyes = eyes; c.depth = depth;
			return c;
		}

		public static Ctx of(Entity e) {
			Ctx c = new Ctx();
			c.server = e.getServer(); c.level = (ServerLevel) e.level(); c.self = e; c.pos = e.position(); c.yRot = e.getYRot(); c.xRot = e.getXRot();
			return c;
		}

		public static Ctx world(MinecraftServer server) {
			Ctx c = new Ctx();
			c.server = server; c.level = server.overworld(); c.pos = Vec3.atBottomCenterOf(server.overworld().getSharedSpawnPos()).multiply(1, 0, 1);
			return c;
		}

		/** Where ^ ^ ^ and facing are measured from */
		Vec3 anchor() { return eyes && self != null ? pos.add(0, self.getEyeHeight(), 0) : pos; }
	}

	interface Cmd { int run(Ctx c); }

	private static final Map<String, Cmd> CACHE = new ConcurrentHashMap<>();
	private static final Cmd NOTHING = c -> 0;

	public static int run(Ctx c, String line) {
		Cmd cmd = CACHE.get(line);
		if (cmd == null) {
			try {
				cmd = parse(line.trim());
			} catch (RuntimeException e) {
				Bedrock.warnOnce("cmd", "Couldn't read command '" + line + "': " + e);
				cmd = NOTHING;
			}
			CACHE.put(line, cmd);
		}
		try {
			return cmd.run(c);
		} catch (StackOverflowError e) {
			Bedrock.warnOnce("cmdrun", "Command recursed too deep '" + line + "'");
			return 0;
		} catch (RuntimeException e) {
			Bedrock.warnOnce("cmdrun", "Command failed '" + line + "': " + e);
			return 0;
		}
	}

	public static int runAs(Entity e, String line) {
		if (e.getServer() == null) return 0;
		return run(Ctx.of(e), line);
	}

	// ------------------------------------------------------------------ reading
	static final class R {
		final String s;
		int i;

		R(String s) { this.s = s; }

		void ws() { while (i < s.length() && Character.isWhitespace(s.charAt(i))) i++; }

		boolean end() { ws(); return i >= s.length(); }

		char peek() { ws(); return i < s.length() ? s.charAt(i) : 0; }

		String word() {
			ws();
			int st = i;
			while (i < s.length() && !Character.isWhitespace(s.charAt(i))) i++;
			return s.substring(st, i);
		}

		String peekWord() { int save = i; String w = word(); i = save; return w; }

		boolean eat(String w) {
			int save = i;
			if (word().equalsIgnoreCase(w)) return true;
			i = save;
			return false;
		}

		String rest() { ws(); String r = s.substring(i).trim(); i = s.length(); return r; }

		/** a name: "quoted words" or a word */
		String name() {
			ws();
			if (i < s.length() && s.charAt(i) == '"') {
				int e = s.indexOf('"', i + 1);
				if (e < 0) e = s.length();
				String n = s.substring(i + 1, e);
				i = Math.min(s.length(), e + 1);
				return n;
			}
			return word();
		}

		boolean coordNext() {
			char c = peek();
			if (c == '~' || c == '^') return true;
			if (!(c == '-' || c == '+' || c == '.' || Character.isDigit(c))) return false;
			// "200HollowP" is a name, not a coordinate
			String w = peekWord();
			return w.matches("[-+]?[0-9.]+([~^][-+0-9.]*)*");
		}

		Coord coord() {
			ws();
			if (i >= s.length()) throw new IllegalStateException("missing coordinate");
			char c = s.charAt(i);
			char kind = 'a';
			if (c == '~' || c == '^') { kind = c; i++; }
			int st = i;
			while (i < s.length()) {
				char d = s.charAt(i);
				if (Character.isDigit(d) || d == '.' || (d == '-' || d == '+') && i == st) i++;
				else break;
			}
			String n = s.substring(st, i);
			double v = n.isEmpty() || n.equals("-") || n.equals("+") ? 0 : Double.parseDouble(n);
			if (kind == 'a' && n.isEmpty()) throw new IllegalStateException("bad coordinate at " + s.substring(st));
			return new Coord(kind, v);
		}

		Pos pos() { return new Pos(coord(), coord(), coord()); }

		Target target() {
			ws();
			if (i < s.length() && s.charAt(i) == '@') {
				int st = i;
				i++;
				while (i < s.length() && Character.isLetter(s.charAt(i))) i++;
				int save = i;
				ws();
				if (i < s.length() && s.charAt(i) == '[') {
					int depth = 0;
					boolean q = false;
					for (; i < s.length(); i++) {
						char ch = s.charAt(i);
						if (ch == '"') q = !q;
						if (q) continue;
						if (ch == '[' || ch == '{') depth++;
						if (ch == ']' || ch == '}') { depth--; if (depth == 0) { i++; break; } }
					}
				} else i = save;
				return new Target(Selector.parse(s.substring(st, i).replaceAll("^(@\\w+)\\s+\\[", "$1[")), null);
			}
			return new Target(null, name());
		}

		double num() { return Double.parseDouble(word()); }
	}

	record Coord(char kind, double v) {}

	record Pos(Coord x, Coord y, Coord z) {
		Vec3 at(Ctx c) {
			if (x.kind == '^') return local(c, x.v, y.v, z.v);
			Vec3 p = c.pos;
			return new Vec3(x.kind == '~' ? p.x + x.v : x.v, y.kind == '~' ? p.y + y.v : y.v, z.kind == '~' ? p.z + z.v : z.v);
		}

		boolean relative() { return x.kind != 'a' || y.kind != 'a' || z.kind != 'a'; }
	}

	/** ^left ^up ^forward from the anchor, the way Java (and Bedrock) work them out */
	static Vec3 local(Ctx c, double left, double up, double fwd) {
		Vec3 o = c.anchor();
		float f = Mth.cos((c.yRot + 90) * Mth.DEG_TO_RAD), g = Mth.sin((c.yRot + 90) * Mth.DEG_TO_RAD);
		float h = Mth.cos(-c.xRot * Mth.DEG_TO_RAD), k = Mth.sin(-c.xRot * Mth.DEG_TO_RAD);
		float l = Mth.cos((-c.xRot + 90) * Mth.DEG_TO_RAD), m = Mth.sin((-c.xRot + 90) * Mth.DEG_TO_RAD);
		Vec3 forward = new Vec3(f * h, k, g * h), upv = new Vec3(f * l, m, g * l), leftv = forward.cross(upv).scale(-1);
		return new Vec3(o.x + forward.x * fwd + upv.x * up + leftv.x * left, o.y + forward.y * fwd + upv.y * up + leftv.y * left,
				o.z + forward.z * fwd + upv.z * up + leftv.z * left);
	}

	record Target(Selector sel, String name) {
		List<Entity> entities(Ctx c) {
			if (sel != null) return sel.select(c);
			List<Entity> out = new ArrayList<>();
			ServerPlayer p = c.server.getPlayerList().getPlayerByName(name);
			if (p != null) out.add(p);
			return out;
		}

		boolean isSelector() { return sel != null; }
	}

	// ------------------------------------------------------------------ parsing
	static Cmd parse(String line) {
		if (line.isEmpty() || line.startsWith("#")) return NOTHING;
		if (line.startsWith("/")) line = line.substring(1);
		R r = new R(line);
		String head = r.word().toLowerCase(Locale.ROOT);
		int glued = head.indexOf('~') >= 0 ? head.indexOf('~') : head.indexOf('^');
		if (glued > 0) {
			// Bedrock reads "fill~5~5~5 ..." as fill ~5~5~5
			r.i -= head.length() - glued;
			head = head.substring(0, glued);
		}
		return switch (head) {
			case "execute" -> execute(r);
			case "scoreboard" -> Scoreboard.parse(r);
			case "tag" -> tag(r);
			case "function" -> { String f = r.rest(); yield c -> Functions.run(f, c); }
			case "tp", "teleport" -> tp(r);
			case "effect" -> effect(r);
			case "summon" -> summon(r);
			case "kill" -> kill(r);
			case "damage" -> damage(r);
			case "event" -> event(r);
			case "particle" -> particle(r);
			case "playsound" -> playsound(r);
			case "stopsound" -> stopsound(r);
			case "camerashake" -> Client.camerashake(r);
			case "camera" -> Client.camera(r);
			case "playanimation" -> Client.playanimation(r);
			case "fog" -> Client.fog(r);
			case "hud" -> Client.hud(r);
			case "inputpermission" -> Client.inputpermission(r);
			case "tellraw" -> { Target t = r.target(); String json = r.rest(); yield c -> Text.tellraw(c, t.entities(c), json); }
			case "titleraw" -> titleraw(r, true);
			case "title" -> titleraw(r, false);
			case "say" -> { String m = r.rest(); yield c -> { c.server.getPlayerList().broadcastSystemMessage(Component.literal("[" + (c.self == null ? "Server" : c.self.getName().getString()) + "] " + m), false); return 1; }; }
			case "w", "tell", "msg" -> { Target t = r.target(); String m = r.rest(); yield c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) p.sendSystemMessage(Component.literal(m)); return 1; }; }
			case "fill" -> World.fill(r);
			case "setblock" -> World.setblock(r);
			case "clone" -> World.clone(r);
			case "structure" -> World.structure(r);
			case "spreadplayers" -> World.spreadplayers(r);
			case "gamerule" -> gamerule(r);
			case "time" -> World.time(r);
			case "weather" -> World.weather(r);
			case "give" -> Items.give(r);
			case "clear" -> Items.clear(r);
			case "replaceitem" -> Items.replaceitem(r);
			case "ride" -> ride(r);
			case "gamemode" -> gamemode(r);
			case "xp" -> xp(r);
			case "scriptevent" -> { String id = r.word(); String msg = r.rest(); yield c -> Scripts.event(id, msg, c); }
			case "tickingarea", "setmaxplayers", "dialogue", "recipe", "music", "loot", "enchant", "mobevent", "difficulty", "spawnpoint", "setworldspawn" -> NOTHING;
			default -> {
				Bedrock.warnOnce("cmdname", "Unsupported command: " + head);
				yield NOTHING;
			}
		};
	}

	// ------------------------------------------------------------------ execute
	interface Step { List<Ctx> apply(Ctx c); }

	static Cmd execute(R r) {
		List<Step> steps = new ArrayList<>();
		Cmd run = null;
		while (!r.end()) {
			String sub = r.word().toLowerCase(Locale.ROOT);
			switch (sub) {
				case "as" -> { Target t = r.target(); steps.add(c -> { List<Ctx> out = new ArrayList<>(); for (Entity e : t.entities(c)) { Ctx n = c.copy(); n.self = e; out.add(n); } return out; }); }
				case "at" -> { Target t = r.target(); steps.add(c -> { List<Ctx> out = new ArrayList<>(); for (Entity e : t.entities(c)) { Ctx n = c.copy(); n.pos = e.position(); n.yRot = e.getYRot(); n.xRot = e.getXRot(); n.level = (ServerLevel) e.level(); out.add(n); } return out; }); }
				case "positioned" -> {
					if (r.eat("as")) { Target t = r.target(); steps.add(c -> { List<Ctx> out = new ArrayList<>(); for (Entity e : t.entities(c)) { Ctx n = c.copy(); n.pos = e.position(); out.add(n); } return out; }); }
					else { Pos p = r.pos(); steps.add(c -> { Ctx n = c.copy(); n.pos = p.at(c); n.eyes = false; return List.of(n); }); }
				}
				case "rotated" -> {
					if (r.eat("as")) { Target t = r.target(); steps.add(c -> { List<Ctx> out = new ArrayList<>(); for (Entity e : t.entities(c)) { Ctx n = c.copy(); n.yRot = e.getYRot(); n.xRot = e.getXRot(); out.add(n); } return out; }); }
					else { Coord y = r.coord(), x = r.coord(); steps.add(c -> { Ctx n = c.copy(); n.yRot = (float) (y.kind == '~' ? c.yRot + y.v : y.v); n.xRot = (float) (x.kind == '~' ? c.xRot + x.v : x.v); return List.of(n); }); }
				}
				case "facing" -> {
					if (r.eat("entity")) {
						Target t = r.target();
						boolean eyes = r.peekWord().equalsIgnoreCase("eyes");
						if (eyes || r.peekWord().equalsIgnoreCase("feet")) r.word();
						steps.add(c -> { List<Ctx> out = new ArrayList<>(); for (Entity e : t.entities(c)) { Ctx n = c.copy(); face(n, eyes ? e.getEyePosition() : e.position()); out.add(n); } return out; });
					} else { Pos p = r.pos(); steps.add(c -> { Ctx n = c.copy(); face(n, p.at(c)); return List.of(n); }); }
				}
				case "anchored" -> { boolean eyes = r.word().equalsIgnoreCase("eyes"); steps.add(c -> { Ctx n = c.copy(); n.eyes = eyes; return List.of(n); }); }
				case "align" -> {
					String axes = r.word();
					steps.add(c -> { Ctx n = c.copy(); n.pos = new Vec3(axes.contains("x") ? Math.floor(c.pos.x) : c.pos.x, axes.contains("y") ? Math.floor(c.pos.y) : c.pos.y, axes.contains("z") ? Math.floor(c.pos.z) : c.pos.z); return List.of(n); });
				}
				case "in" -> {
					String dim = r.word();
					steps.add(c -> {
						Ctx n = c.copy();
						for (ServerLevel l : c.server.getAllLevels()) if (l.dimension().location().getPath().equalsIgnoreCase(dim.replace("minecraft:", ""))) n.level = l;
						return List.of(n);
					});
				}
				case "if", "unless" -> {
					boolean want = sub.equals("if");
					java.util.function.Predicate<Ctx> test = condition(r);
					steps.add(c -> test.test(c) == want ? List.of(c) : List.of());
				}
				case "run" -> { String rest = r.rest(); run = parse(rest); }
				default -> throw new IllegalStateException("unknown execute part " + sub);
			}
			if (run != null) break;
		}
		Step[] arr = steps.toArray(new Step[0]);
		Cmd end = run;
		return c -> chain(arr, 0, c, end);
	}

	private static int chain(Step[] steps, int k, Ctx c, Cmd end) {
		if (k == steps.length) return end == null ? 1 : end.run(c);
		int n = 0;
		for (Ctx next : steps[k].apply(c)) n += chain(steps, k + 1, next, end);
		return n;
	}

	static void face(Ctx c, Vec3 target) {
		Vec3 from = c.anchor();
		double dx = target.x - from.x, dy = target.y - from.y, dz = target.z - from.z, h = Math.sqrt(dx * dx + dz * dz);
		c.xRot = Mth.wrapDegrees((float) -(Mth.atan2(dy, h) * Mth.RAD_TO_DEG));
		c.yRot = Mth.wrapDegrees((float) (Mth.atan2(dz, dx) * Mth.RAD_TO_DEG) - 90f);
	}

	private static java.util.function.Predicate<Ctx> condition(R r) {
		String kind = r.word().toLowerCase(Locale.ROOT);
		switch (kind) {
			case "entity" -> { Target t = r.target(); return c -> !t.entities(c).isEmpty(); }
			case "block" -> {
				Pos p = r.pos();
				String block = r.word();
				String states = null;
				if (r.peek() == '[') states = bracket(r);
				else if (!r.end() && r.peekWord().matches("-?\\d+")) r.word(); // old data value
				String st = states;
				return c -> Blocks.matches(c.level.getBlockState(BlockPos.containing(p.at(c))), block, st);
			}
			case "blocks" -> {
				Pos a = r.pos(), b = r.pos(), d = r.pos();
				boolean masked = r.word().equalsIgnoreCase("masked");
				return c -> World.blocksMatch(c, a.at(c), b.at(c), d.at(c), masked);
			}
			case "score" -> {
				Target t = r.target();
				String obj = r.word();
				String op = r.word();
				if (op.equalsIgnoreCase("matches")) {
					Selector.Range range = Selector.Range.parse(r.word());
					return c -> {
						Integer v = Scoreboard.read(c, t, obj);
						return v != null && range.test(v);
					};
				}
				Target t2 = r.target();
				String obj2 = r.word();
				return c -> {
					Integer a = Scoreboard.read(c, t, obj), b = Scoreboard.read(c, t2, obj2);
					if (a == null || b == null) return false;
					return switch (op) { case "<" -> a < b; case "<=" -> a <= b; case "=" -> a.equals(b); case ">=" -> a >= b; case ">" -> a > b; default -> false; };
				};
			}
			default -> throw new IllegalStateException("unknown condition " + kind);
		}
	}

	/** [ ... ] block states */
	static String bracket(R r) {
		r.ws();
		int st = r.i, depth = 0;
		for (; r.i < r.s.length(); r.i++) {
			char ch = r.s.charAt(r.i);
			if (ch == '[') depth++;
			if (ch == ']' && --depth == 0) { r.i++; break; }
		}
		return r.s.substring(st, r.i);
	}

	// ------------------------------------------------------------------ tag
	static Cmd tag(R r) {
		Target t = r.target();
		String op = r.word().toLowerCase(Locale.ROOT);
		String name = op.equals("list") ? "" : r.name();
		return c -> {
			int n = 0;
			for (Entity e : t.entities(c)) {
				if (op.equals("add")) { if (e.addTag(name)) n++; }
				else if (op.equals("remove")) { if (e.removeTag(name)) n++; }
			}
			return n;
		};
	}

	// ------------------------------------------------------------------ tp
	static Cmd tp(R r) {
		Target victims = null, dest = null;
		Pos to = null;
		if (r.coordNext()) to = r.pos();
		else {
			Target first = r.target();
			if (r.end() || !r.coordNext() && !r.peekWord().equalsIgnoreCase("true") && !r.peekWord().equalsIgnoreCase("false") && !r.peekWord().equalsIgnoreCase("facing")) {
				if (r.end()) dest = first;
				else { victims = first; dest = r.target(); }
			} else if (r.coordNext()) { victims = first; to = r.pos(); }
			else dest = first;
		}
		Coord yaw = null, pitch = null;
		Target faceT = null;
		Pos faceP = null;
		boolean check = false;
		while (!r.end()) {
			if (r.eat("facing")) {
				if (r.coordNext()) faceP = r.pos(); else faceT = r.target();
			} else if (r.coordNext()) {
				yaw = r.coord();
				if (r.coordNext()) pitch = r.coord();
			} else {
				String w = r.word();
				if (w.equalsIgnoreCase("true")) check = true;
			}
		}
		Target v = victims, d = dest, ft = faceT;
		Pos p = to, fp = faceP;
		Coord y = yaw, x = pitch;
		boolean chk = check;
		return c -> {
			List<Entity> who = v == null ? (c.self == null ? List.of() : List.of(c.self)) : v.entities(c);
			Vec3 target;
			Float destYaw = null, destPitch = null;
			if (d != null) {
				List<Entity> ds = d.entities(c);
				if (ds.isEmpty()) return 0;
				Entity e = ds.get(0);
				target = e.position();
				destYaw = e.getYRot(); destPitch = e.getXRot();
				// "tp @s @s" just leaves it where it is (the add-on uses it to stop movement)
			} else target = p.at(c);
			int n = 0;
			for (Entity e : who) {
				float ny = e.getYRot(), nx = e.getXRot();
				if (destYaw != null && d != null && v == null) { ny = destYaw; nx = destPitch; }
				if (y != null) ny = (float) (y.kind == '~' ? c.yRot + y.v : y.v);
				if (x != null) nx = (float) (x.kind == '~' ? c.xRot + x.v : x.v);
				if (ft != null || fp != null) {
					Vec3 look = null;
					if (ft != null) { List<Entity> fs = ft.entities(c); if (!fs.isEmpty()) look = fs.get(0).position(); }
					else look = fp.at(c);
					if (look != null) {
						Vec3 from = target.add(0, e.getEyeHeight(), 0);
						double dx = look.x - from.x, dy = look.y - from.y, dz = look.z - from.z, h = Math.sqrt(dx * dx + dz * dz);
						nx = (float) -(Mth.atan2(dy, h) * Mth.RAD_TO_DEG);
						ny = (float) (Mth.atan2(dz, dx) * Mth.RAD_TO_DEG) - 90f;
					}
				}
				if (chk) {
					Vec3 off = target.subtract(e.position());
					if (!c.level.noCollision(e, e.getBoundingBox().move(off))) continue;
				}
				boolean rotate = y != null || x != null || ft != null || fp != null || destYaw != null && v == null;
				teleport(e, c.level, target, Mth.wrapDegrees(ny), Mth.clamp(nx, -90, 90), rotate);
				n++;
			}
			return n;
		};
	}

	static void teleport(Entity e, ServerLevel level, Vec3 to, float yaw, float pitch) { teleport(e, level, to, yaw, pitch, true); }

	static void teleport(Entity e, ServerLevel level, Vec3 to, float yaw, float pitch, boolean rotate) {
		if (e instanceof ServerPlayer p) {
			if (p.level() != level) p.teleportTo(level, to.x, to.y, to.z, yaw, pitch);
			// without a new rotation, leave the player's view alone (Java would otherwise snap it back every tick)
			else if (!rotate) p.connection.teleport(to.x, to.y, to.z, 0, 0, java.util.EnumSet.of(net.minecraft.world.entity.RelativeMovement.X_ROT, net.minecraft.world.entity.RelativeMovement.Y_ROT));
			else p.connection.teleport(to.x, to.y, to.z, yaw, pitch);
			p.resetFallDistance();
		} else if (e.level() == level) {
			e.moveTo(to.x, to.y, to.z, yaw, pitch);
			e.setYHeadRot(yaw);
			if (e instanceof LivingEntity l) l.yBodyRot = yaw;
			e.resetFallDistance();
		}
	}

	// ------------------------------------------------------------------ effect
	static Cmd effect(R r) {
		Target t = r.target();
		String name = r.word().toLowerCase(Locale.ROOT);
		if (name.equals("clear")) {
			String which = r.end() ? null : r.word();
			return c -> {
				for (Entity e : t.entities(c)) if (e instanceof LivingEntity l) {
					if (which == null) l.removeAllEffects();
					else { MobEffect m = Effects.get(which); if (m != null) l.removeEffect(m); }
				}
				return 1;
			};
		}
		String secs = r.end() ? "30" : r.word();
		int amp = r.end() ? 0 : (int) r.num();
		boolean hide = !r.end() && r.word().equalsIgnoreCase("true");
		int ticks = secs.equalsIgnoreCase("infinite") ? -1 : (int) Math.round(Double.parseDouble(secs) * 20);
		return c -> {
			MobEffect m = Effects.get(name);
			if (m == null) { Bedrock.warnOnce("effect", "Unknown effect " + name); return 0; }
			int n = 0;
			for (Entity e : t.entities(c)) if (e instanceof LivingEntity l) {
				if (ticks == 0) { l.removeEffect(m); continue; }
				if (m.isInstantenous()) { m.applyInstantenousEffect(null, null, l, Math.min(255, amp), 1.0); n++; continue; }
				l.removeEffect(m);
				l.addEffect(new MobEffectInstance(m, ticks, Math.max(0, Math.min(255, amp)), false, !hide, !hide));
				n++;
			}
			return n;
		};
	}

	// ------------------------------------------------------------------ summon
	static Cmd summon(R r) {
		String type = Bedrock.id(r.word());
		Pos pos = null;
		Coord yaw = null, pitch = null;
		Target faceT = null;
		Pos faceP = null;
		String event = null, name = null;
		if (r.coordNext()) {
			pos = r.pos();
			if (r.eat("facing")) { if (r.coordNext()) faceP = r.pos(); else faceT = r.target(); }
			else if (r.coordNext()) { yaw = r.coord(); if (r.coordNext()) pitch = r.coord(); }
			if (!r.end()) event = r.word();
			if (!r.end()) name = r.name();
		} else if (!r.end()) {
			name = r.name();
			if (r.coordNext()) pos = r.pos();
		}
		Pos p = pos, fp = faceP;
		Coord y = yaw, x = pitch;
		Target ft = faceT;
		String ev = event == null || event.equalsIgnoreCase("none") || event.equals("*") ? null : event, nm = name;
		return c -> {
			EntityType<?> et = Types.javaType(type);
			if (et == null) { Bedrock.warnOnce("summon", "Can't summon unknown entity " + type); return 0; }
			Vec3 at = p == null ? c.pos : p.at(c);
			Entity e = et.create(c.level);
			if (e == null) return 0;
			float ny = c.self != null && p == null ? c.yRot : y == null ? 0 : (float) (y.kind == '~' ? c.yRot + y.v : y.v);
			float nx = x == null ? 0 : (float) (x.kind == '~' ? c.xRot + x.v : x.v);
			if (ft != null || fp != null) {
				Vec3 look = null;
				if (ft != null) { List<Entity> fs = ft.entities(c); if (!fs.isEmpty()) look = fs.get(0).position(); }
				else look = fp.at(c);
				if (look != null) {
					double dx = look.x - at.x, dy = look.y - at.y, dz = look.z - at.z, h = Math.sqrt(dx * dx + dz * dz);
					nx = (float) -(Mth.atan2(dy, h) * Mth.RAD_TO_DEG);
					ny = (float) (Mth.atan2(dz, dx) * Mth.RAD_TO_DEG) - 90f;
				}
			}
			e.moveTo(at.x, at.y, at.z, ny, nx);
			e.setYHeadRot(ny);
			if (e instanceof LivingEntity l) { l.yBodyRot = ny; l.yHeadRotO = ny; }
			if (nm != null) e.setCustomName(Component.literal(nm));
			if (e instanceof BedrockEntity b) b.spawnEvent(ev);
			else if (e instanceof net.minecraft.world.entity.Mob mob) mob.finalizeSpawn(c.level, c.level.getCurrentDifficultyAt(BlockPos.containing(at)), MobSpawnType.COMMAND, null, null);
			c.level.addFreshEntity(e);
			if (e instanceof BedrockEntity b) Actor.of(b).spawnedOnce(ev);
			return 1;
		};
	}

	// ------------------------------------------------------------------ kill / damage / event
	static Cmd kill(R r) {
		Target t = r.end() ? null : r.target();
		return c -> {
			List<Entity> who = t == null ? (c.self == null ? List.of() : List.of(c.self)) : t.entities(c);
			for (Entity e : who) {
				if (e instanceof Player p) { if (!p.isCreative() || true) p.hurt(p.damageSources().genericKill(), Float.MAX_VALUE); }
				else if (e instanceof LivingEntity l && !(e instanceof BedrockEntity b && !b.isPickable() && l.getMaxHealth() > 9999)) { l.setHealth(0); l.die(l.damageSources().genericKill()); }
				else e.discard();
			}
			return who.size();
		};
	}

	/** The Bedrock cause of the damage being dealt right now (read by damage sensors) */
	static final ThreadLocal<String> CAUSE = new ThreadLocal<>();

	static Cmd damage(R r) {
		Target t = r.target();
		double amount = r.num();
		String cause = r.end() ? "none" : r.word().toLowerCase(Locale.ROOT);
		Target by = null;
		if (r.eat("entity")) by = r.target();
		Target src = by;
		return c -> {
			Entity damager = null;
			if (src != null) { List<Entity> s = src.entities(c); if (!s.isEmpty()) damager = s.get(0); }
			int n = 0;
			for (Entity e : t.entities(c)) {
				if (!(e instanceof LivingEntity l)) continue;
				DamageSource ds = source(l, cause, damager);
				Vec3 v = e.getDeltaMovement();
				CAUSE.set(cause);
				try {
					if (l.hurt(ds, (float) amount)) n++;
				} finally { CAUSE.remove(); }
				// the damage command doesn't push things around; the add-on does its own knockback
				e.setDeltaMovement(v);
			}
			return n;
		};
	}

	static DamageSource source(LivingEntity victim, String cause, Entity damager) {
		var s = victim.damageSources();
		return switch (cause) {
			case "entity_attack", "entity_explosion", "projectile", "none", "override", "suicide", "magic", "thorns", "ram_attack", "sonic_boom", "piston" -> {
				if (damager instanceof Player p) yield s.playerAttack(p);
				if (damager instanceof LivingEntity le) yield s.mobAttack(le);
				yield cause.equals("magic") ? s.magic() : s.generic();
			}
			case "fire" -> s.inFire();
			case "fire_tick" -> s.onFire();
			case "lava" -> s.lava();
			case "fall" -> s.fall();
			case "drowning" -> s.drown();
			case "suffocation" -> s.inWall();
			case "block_explosion" -> s.explosion(null, null);
			case "wither" -> s.wither();
			case "starve" -> s.starve();
			case "void" -> s.fellOutOfWorld();
			case "lightning" -> s.lightningBolt();
			case "freezing" -> s.freeze();
			case "contact" -> s.cactus();
			case "fly_into_wall" -> s.flyIntoWall();
			case "falling_block", "anvil" -> s.fallingBlock(null);
			default -> s.generic();
		};
	}

	static Cmd event(R r) {
		r.eat("entity");
		Target t = r.target();
		String ev = r.word();
		return c -> {
			int n = 0;
			for (Entity e : t.entities(c)) { Actor.of(e).event(ev); n++; }
			return n;
		};
	}

	// ------------------------------------------------------------------ particles and sounds
	static Cmd particle(R r) {
		String id = r.word();
		Pos p = r.coordNext() ? r.pos() : null;
		return c -> {
			Vec3 at = p == null ? c.pos : p.at(c);
			Net.particle(c.level, id, at);
			return 1;
		};
	}

	static Cmd playsound(R r) {
		String sound = r.word();
		Target t = r.end() || r.coordNext() ? null : r.target();
		Pos p = r.coordNext() ? r.pos() : null;
		float vol = r.end() ? 1 : (float) r.num(), pitch = r.end() ? 1 : (float) r.num(), min = r.end() ? 0 : (float) r.num();
		return c -> {
			ResourceLocation rl = Sounds.java(sound);
			if (rl == null) return 0;
			Vec3 at = p == null ? c.pos : p.at(c);
			List<Entity> who = t == null ? (c.self instanceof ServerPlayer sp ? List.of(sp) : List.of()) : t.entities(c);
			Holder<SoundEvent> h = Holder.direct(SoundEvent.createVariableRangeEvent(rl));
			double range = vol > 1 ? vol * 16 : 16;
			int n = 0;
			for (Entity e : who) {
				if (!(e instanceof ServerPlayer sp) || sp.level() != c.level) continue;
				Vec3 where = at;
				float v = vol;
				if (sp.distanceToSqr(at) > range * range) {
					if (min <= 0) continue;
					Vec3 dir = at.subtract(sp.position()).normalize();
					where = sp.position().add(dir.scale(2));
					v = min;
				}
				sp.connection.send(new ClientboundSoundPacket(h, SoundSource.MASTER, where.x, where.y, where.z, v, Mth.clamp(pitch, 0.01f, 2.5f), sp.getRandom().nextLong()));
				n++;
			}
			return n;
		};
	}

	static Cmd stopsound(R r) {
		Target t = r.target();
		String sound = r.end() ? null : r.word();
		return c -> {
			ResourceLocation rl = sound == null ? null : Sounds.java(sound);
			for (Entity e : t.entities(c)) if (e instanceof ServerPlayer sp) sp.connection.send(new ClientboundStopSoundPacket(rl, null));
			return 1;
		};
	}

	// ------------------------------------------------------------------ titles
	static Cmd titleraw(R r, boolean raw) {
		Target t = r.target();
		String mode = r.word().toLowerCase(Locale.ROOT);
		if (mode.equals("times")) {
			int in = (int) r.num(), stay = (int) r.num(), out = (int) r.num();
			return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.titleTimes(p, in, stay, out); return 1; };
		}
		if (mode.equals("clear") || mode.equals("reset")) return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.title(p, mode, ""); return 1; };
		String text = r.rest();
		return c -> {
			int n = 0;
			for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) {
				String s = raw ? Text.raw(c, p, text) : text;
				Net.title(p, mode, s);
				n++;
			}
			return n;
		};
	}

	// ------------------------------------------------------------------ misc
	static Cmd gamerule(R r) {
		String rule = r.word();
		String val = r.end() ? null : r.word();
		return c -> {
			if (val == null) return 0;
			GameRules rules = c.level.getGameRules();
			GameRules.visitGameRuleTypes(new GameRules.GameRuleTypeVisitor() {
				@Override
				public <T extends GameRules.Value<T>> void visit(GameRules.Key<T> key, GameRules.Type<T> type) {
					if (!key.getId().equalsIgnoreCase(rule)) return;
					T v = rules.getRule(key);
					if (v instanceof GameRules.BooleanValue b) b.set(Boolean.parseBoolean(val), c.server);
					else if (v instanceof GameRules.IntegerValue i) { try { i.set(Integer.parseInt(val), c.server); } catch (NumberFormatException ignored) { } }
				}
			});
			return 1;
		};
	}

	public static boolean gameRule(MinecraftServer server, String rule) {
		if (server == null || rule == null) return false;
		boolean[] out = { false };
		GameRules rules = server.getGameRules();
		GameRules.visitGameRuleTypes(new GameRules.GameRuleTypeVisitor() {
			@Override
			public <T extends GameRules.Value<T>> void visit(GameRules.Key<T> key, GameRules.Type<T> type) {
				if (key.getId().equalsIgnoreCase(rule) && rules.getRule(key) instanceof GameRules.BooleanValue b) out[0] = b.get();
			}
		});
		return out[0];
	}

	static Cmd ride(R r) {
		Target riders = r.target();
		String op = r.word().toLowerCase(Locale.ROOT);
		Target ride = op.equals("start_riding") ? r.target() : null;
		String how = r.end() ? "teleport_rider" : r.word();
		return c -> {
			int n = 0;
			switch (op) {
				case "start_riding" -> {
					List<Entity> rs = ride.entities(c);
					if (rs.isEmpty()) return 0;
					Entity v = rs.get(0);
					for (Entity e : riders.entities(c)) {
						if (e == v) continue;
						if (how.equals("teleport_ride")) teleport(v, c.level, e.position(), v.getYRot(), v.getXRot());
						if (e.startRiding(v, true)) n++;
					}
				}
				case "stop_riding" -> { for (Entity e : riders.entities(c)) { e.stopRiding(); n++; } }
				case "evict_riders" -> { for (Entity e : riders.entities(c)) { e.ejectPassengers(); n++; } }
				default -> { }
			}
			return n;
		};
	}

	static Cmd gamemode(R r) {
		String m = r.word();
		Target t = r.end() ? null : r.target();
		return c -> {
			GameType g = switch (m.toLowerCase(Locale.ROOT)) {
				case "1", "c", "creative" -> GameType.CREATIVE;
				case "2", "a", "adventure" -> GameType.ADVENTURE;
				case "spectator", "6", "sp" -> GameType.SPECTATOR;
				default -> GameType.SURVIVAL;
			};
			List<Entity> who = t == null ? (c.self == null ? List.of() : List.of(c.self)) : t.entities(c);
			for (Entity e : who) if (e instanceof ServerPlayer p) p.setGameMode(g);
			return 1;
		};
	}

	static Cmd xp(R r) {
		String amt = r.word();
		Target t = r.end() ? null : r.target();
		boolean levels = amt.toUpperCase(Locale.ROOT).endsWith("L");
		int n = Integer.parseInt(levels ? amt.substring(0, amt.length() - 1) : amt);
		return c -> {
			List<Entity> who = t == null ? (c.self == null ? List.of() : List.of(c.self)) : t.entities(c);
			for (Entity e : who) if (e instanceof ServerPlayer p) { if (levels) p.giveExperienceLevels(n); else p.giveExperiencePoints(n); }
			return 1;
		};
	}

	/** Block state from a Bedrock name, for fill / setblock */
	static BlockState block(String name, String states) { return Blocks.state(name, states); }
}
