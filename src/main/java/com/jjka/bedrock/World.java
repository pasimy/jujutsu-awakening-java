package com.jjka.bedrock;

import java.util.List;
import java.util.Locale;

import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.levelgen.Heightmap;
import net.minecraft.world.phys.Vec3;

/** Commands that change blocks or the world: fill, setblock, clone, structure, spreadplayers, time, weather */
final class World {
	private World() {}

	private static final int MAX_FILL = 32768;

	static Commands.Cmd fill(Commands.R r) {
		Commands.Pos a = r.pos(), b = r.pos();
		String block = r.word();
		String states = r.peek() == '[' ? Commands.bracket(r) : null;
		if (states == null && !r.end() && r.peekWord().matches("\\d+")) r.word();
		String mode = r.end() ? "replace" : r.word().toLowerCase(Locale.ROOT);
		String filter = mode.equals("replace") && !r.end() ? r.word() : null;
		if (filter != null && r.peek() == '[') Commands.bracket(r);
		return c -> {
			BlockState state = Commands.block(block, states);
			if (state == null) return 0;
			BlockPos p1 = BlockPos.containing(a.at(c)), p2 = BlockPos.containing(b.at(c));
			int x0 = Math.min(p1.getX(), p2.getX()), x1 = Math.max(p1.getX(), p2.getX());
			int y0 = Math.max(c.level.getMinBuildHeight(), Math.min(p1.getY(), p2.getY())), y1 = Math.min(c.level.getMaxBuildHeight() - 1, Math.max(p1.getY(), p2.getY()));
			int z0 = Math.min(p1.getZ(), p2.getZ()), z1 = Math.max(p1.getZ(), p2.getZ());
			long vol = (long) (x1 - x0 + 1) * (y1 - y0 + 1) * (z1 - z0 + 1);
			if (vol > MAX_FILL || vol <= 0) return 0;
			int n = 0;
			BlockPos.MutableBlockPos m = new BlockPos.MutableBlockPos();
			for (int x = x0; x <= x1; x++) for (int y = y0; y <= y1; y++) for (int z = z0; z <= z1; z++) {
				m.set(x, y, z);
				if (!c.level.isLoaded(m)) continue;
				BlockState old = c.level.getBlockState(m);
				boolean edge = x == x0 || x == x1 || y == y0 || y == y1 || z == z0 || z == z1;
				switch (mode) {
					case "keep" -> { if (!old.isAir()) continue; }
					case "outline" -> { if (!edge) continue; }
					case "hollow" -> { if (!edge) { if (!old.isAir()) c.level.setBlock(m, net.minecraft.world.level.block.Blocks.AIR.defaultBlockState(), 2); continue; } }
					case "replace" -> { if (filter != null && !Blocks.matches(old, filter, null)) continue; }
					case "destroy" -> { if (!old.isAir()) c.level.destroyBlock(m, true); }
					default -> { }
				}
				if (old == state) continue;
				if (old.getDestroySpeed(c.level, m) < 0 && !old.is(net.minecraft.world.level.block.Blocks.BARRIER)) continue; // bedrock etc.
				if (c.level.setBlock(m, state, Block.UPDATE_CLIENTS)) n++;
			}
			return n;
		};
	}

	static Commands.Cmd setblock(Commands.R r) {
		Commands.Pos p = r.pos();
		String block = r.word();
		String states = r.peek() == '[' ? Commands.bracket(r) : null;
		if (states == null && !r.end() && r.peekWord().matches("\\d+")) r.word();
		String mode = r.end() ? "replace" : r.word().toLowerCase(Locale.ROOT);
		return c -> {
			BlockState state = Commands.block(block, states);
			if (state == null) return 0;
			BlockPos at = BlockPos.containing(p.at(c));
			BlockState old = c.level.getBlockState(at);
			if (mode.equals("keep") && !old.isAir()) return 0;
			if (mode.equals("destroy")) c.level.destroyBlock(at, true);
			return c.level.setBlock(at, state, Block.UPDATE_ALL) ? 1 : 0;
		};
	}

	static Commands.Cmd clone(Commands.R r) {
		Commands.Pos a = r.pos(), b = r.pos(), d = r.pos();
		return c -> {
			BlockPos p1 = BlockPos.containing(a.at(c)), p2 = BlockPos.containing(b.at(c)), dst = BlockPos.containing(d.at(c));
			BlockPos lo = new BlockPos(Math.min(p1.getX(), p2.getX()), Math.min(p1.getY(), p2.getY()), Math.min(p1.getZ(), p2.getZ()));
			BlockPos hi = new BlockPos(Math.max(p1.getX(), p2.getX()), Math.max(p1.getY(), p2.getY()), Math.max(p1.getZ(), p2.getZ()));
			long vol = (long) (hi.getX() - lo.getX() + 1) * (hi.getY() - lo.getY() + 1) * (hi.getZ() - lo.getZ() + 1);
			if (vol > MAX_FILL) return 0;
			for (BlockPos p : BlockPos.betweenClosed(lo, hi)) c.level.setBlock(dst.offset(p.subtract(lo)), c.level.getBlockState(p), 2);
			return 1;
		};
	}

	static boolean blocksMatch(Commands.Ctx c, Vec3 a, Vec3 b, Vec3 d, boolean masked) {
		BlockPos p1 = BlockPos.containing(a), p2 = BlockPos.containing(b), dst = BlockPos.containing(d);
		BlockPos lo = new BlockPos(Math.min(p1.getX(), p2.getX()), Math.min(p1.getY(), p2.getY()), Math.min(p1.getZ(), p2.getZ()));
		BlockPos hi = new BlockPos(Math.max(p1.getX(), p2.getX()), Math.max(p1.getY(), p2.getY()), Math.max(p1.getZ(), p2.getZ()));
		for (BlockPos p : BlockPos.betweenClosed(lo, hi)) {
			BlockState s = c.level.getBlockState(p);
			if (masked && s.isAir()) continue;
			if (s != c.level.getBlockState(dst.offset(p.subtract(lo)))) return false;
		}
		return true;
	}

	static Commands.Cmd structure(Commands.R r) {
		String op = r.word().toLowerCase(Locale.ROOT);
		if (!op.equals("load")) return c -> 0;
		String name = r.name();
		Commands.Pos p = r.coordNext() ? r.pos() : null;
		String rot = r.end() ? "0_degrees" : r.word();
		return c -> Structures.load(c.level, name, BlockPos.containing(p == null ? c.pos : p.at(c)), rot) ? 1 : 0;
	}

	static Commands.Cmd spreadplayers(Commands.R r) {
		Commands.Coord x = r.coord(), z = r.coord();
		double spread = r.num(), range = r.num();
		Commands.Target t = r.target();
		return c -> {
			double cx = x.kind() == '~' ? c.pos.x + x.v() : x.v(), cz = z.kind() == '~' ? c.pos.z + z.v() : z.v();
			List<Entity> who = t.entities(c);
			for (Entity e : who) {
				double a = Math.random() * Math.PI * 2, d = Math.random() * range;
				int tx = (int) Math.floor(cx + Math.cos(a) * d), tz = (int) Math.floor(cz + Math.sin(a) * d);
				ServerLevel l = c.level;
				int ty = l.getHeight(Heightmap.Types.MOTION_BLOCKING_NO_LEAVES, tx, tz);
				Commands.teleport(e, l, new Vec3(tx + 0.5, ty, tz + 0.5), e.getYRot(), e.getXRot());
			}
			return who.size();
		};
	}

	static Commands.Cmd time(Commands.R r) {
		String op = r.word().toLowerCase(Locale.ROOT);
		String v = r.end() ? "0" : r.word().toLowerCase(Locale.ROOT);
		return c -> {
			long t = switch (v) { case "day" -> 1000; case "noon" -> 6000; case "night" -> 13000; case "midnight" -> 18000; case "sunrise" -> 23000; case "sunset" -> 12000; default -> { try { yield Long.parseLong(v); } catch (NumberFormatException e) { yield 0; } } };
			for (ServerLevel l : c.server.getAllLevels()) {
				if (op.equals("set")) l.setDayTime(t);
				else if (op.equals("add")) l.setDayTime(l.getDayTime() + t);
			}
			return 1;
		};
	}

	static Commands.Cmd weather(Commands.R r) {
		String w = r.word().toLowerCase(Locale.ROOT);
		int secs = r.end() ? 6000 : (int) r.num();
		return c -> {
			int ticks = secs * 20;
			switch (w) {
				case "clear" -> c.server.overworld().setWeatherParameters(ticks, 0, false, false);
				case "rain" -> c.server.overworld().setWeatherParameters(0, ticks, true, false);
				case "thunder" -> c.server.overworld().setWeatherParameters(0, ticks, true, true);
				default -> { }
			}
			return 1;
		};
	}
}
