package com.jjka.bedrock;

import java.util.List;
import java.util.Locale;

import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.phys.Vec3;

/** Commands that are only something a player sees: camera shake, camera, animations, fog, hud, input permission */
final class Client {
	private Client() {}

	static Commands.Cmd camerashake(Commands.R r) {
		String op = r.word().toLowerCase(Locale.ROOT);
		Commands.Target t = r.target();
		if (op.equals("stop")) return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("shake", "stop", "", "", new float[] { 0, 0 })); return 1; };
		float intensity = r.end() ? 0.5f : (float) r.num(), secs = r.end() ? 1 : (float) r.num();
		String type = r.end() ? "positional" : r.word().toLowerCase(Locale.ROOT);
		return c -> {
			for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("shake", "add", type, "", new float[] { intensity, secs }));
			return 1;
		};
	}

	static Commands.Cmd camera(Commands.R r) {
		Commands.Target t = r.target();
		String op = r.word().toLowerCase(Locale.ROOT);
		switch (op) {
			case "clear" -> { return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("clear", "", "", "", new float[0])); return 1; }; }
			case "fade" -> {
				float in = 0, hold = 0, out = 0, cr = 0, cg = 0, cb = 0;
				while (!r.end()) {
					String w = r.word().toLowerCase(Locale.ROOT);
					if (w.equals("time")) { in = (float) r.num(); hold = (float) r.num(); out = (float) r.num(); }
					else if (w.equals("color")) { cr = (float) r.num(); cg = (float) r.num(); cb = (float) r.num(); }
				}
				float[] f = { in, hold, out, cr, cg, cb };
				return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("fade", "", "", "", f)); return 1; };
			}
			case "set" -> {
				String preset = r.word();
				float ease = 0;
				String easeType = "linear";
				Commands.Pos pos = null;
				Commands.Coord rx = null, ry = null;
				Commands.Target faceT = null;
				Commands.Pos faceP = null;
				while (!r.end()) {
					String w = r.word().toLowerCase(Locale.ROOT);
					switch (w) {
						case "ease" -> { ease = (float) r.num(); easeType = r.word(); }
						case "pos" -> pos = r.pos();
						case "rot" -> { rx = r.coord(); ry = r.coord(); }
						case "facing" -> { if (r.coordNext()) faceP = r.pos(); else faceT = r.target(); }
						default -> { }
					}
				}
				float e = ease;
				String et = easeType;
				Commands.Pos p = pos, fp = faceP;
				Commands.Coord x = rx, y = ry;
				Commands.Target ft = faceT;
				return c -> {
					for (Entity ent : t.entities(c)) {
						if (!(ent instanceof ServerPlayer sp)) continue;
						Vec3 at = p == null ? sp.getEyePosition() : p.at(c);
						float yaw = sp.getYRot(), pitch = sp.getXRot();
						boolean hasRot = false;
						if (x != null) { pitch = (float) (x.kind() == '~' ? c.xRot + x.v() : x.v()); yaw = (float) (y.kind() == '~' ? c.yRot + y.v() : y.v()); hasRot = true; }
						Vec3 look = null;
						if (ft != null) { List<Entity> fs = ft.entities(c); if (!fs.isEmpty()) look = fs.get(0).getEyePosition(); }
						else if (fp != null) look = fp.at(c);
						if (look != null) {
							double dx = look.x - at.x, dy = look.y - at.y, dz = look.z - at.z, h = Math.sqrt(dx * dx + dz * dz);
							pitch = (float) -Math.toDegrees(Math.atan2(dy, h));
							yaw = (float) Math.toDegrees(Math.atan2(dz, dx)) - 90f;
							hasRot = true;
						}
						Net.fx(sp, new Net.Fx("set", preset, et, "", new float[] { e, (float) at.x, (float) at.y, (float) at.z, yaw, pitch, p != null ? 1 : 0, hasRot ? 1 : 0 }));
					}
					return 1;
				};
			}
			default -> { return c -> 0; }
		}
	}

	static Commands.Cmd playanimation(Commands.R r) {
		Commands.Target t = r.target();
		String anim = r.word();
		String next = r.end() ? "" : r.word();
		float blend = r.end() ? 0 : (float) r.num();
		String stop = r.end() ? "" : r.name();
		String controller = r.end() ? "" : r.word();
		return c -> {
			int n = 0;
			for (Entity e : t.entities(c)) { Net.animation(e, new Net.Anim(e.getId(), anim, next, blend, stop, controller)); n++; }
			return n;
		};
	}

	static Commands.Cmd fog(Commands.R r) {
		Commands.Target t = r.target();
		String op = r.word().toLowerCase(Locale.ROOT);
		String id = op.equals("push") ? r.word() : "";
		String user = r.end() ? "" : r.word();
		return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("fog", op, id, user, new float[0])); return 1; };
	}

	static Commands.Cmd hud(Commands.R r) {
		Commands.Target t = r.target();
		String op = r.word().toLowerCase(Locale.ROOT);
		String el = r.end() ? "all" : r.word().toLowerCase(Locale.ROOT);
		return c -> { for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) Net.fx(p, new Net.Fx("hud", op, el, "", new float[0])); return 1; };
	}

	static Commands.Cmd inputpermission(Commands.R r) {
		String op = r.word().toLowerCase(Locale.ROOT);
		Commands.Target t = r.target();
		String kind = r.word().toLowerCase(Locale.ROOT);
		String state = r.end() ? "enabled" : r.word().toLowerCase(Locale.ROOT);
		if (!op.equals("set")) return c -> 0;
		return c -> {
			for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) {
				Net.fx(p, new Net.Fx("input", kind, state, "", new float[0]));
				if (kind.equals("movement")) Server.frozen(p, state.equals("disabled"));
			}
			return 1;
		};
	}
}
