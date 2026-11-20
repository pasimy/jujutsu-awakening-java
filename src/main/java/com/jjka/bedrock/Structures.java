package com.jjka.bedrock;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.Rotation;
import net.minecraft.world.level.block.state.BlockState;

/** Bedrock .mcstructure files (little-endian NBT), placed with "structure load" */
public final class Structures {
	private Structures() {}

	private record Struct(int sx, int sy, int sz, int[] indices, List<String> palette, List<Map<String, Object>> entities, int[] origin) {}

	private static final Map<String, Struct> CACHE = new HashMap<>();

	private static synchronized Struct get(String name) {
		String n = name.toLowerCase(Locale.ROOT);
		if (CACHE.containsKey(n)) return CACHE.get(n);
		String ns = "mystructure", path = n;
		int colon = n.indexOf(':');
		if (colon >= 0) { ns = n.substring(0, colon); path = n.substring(colon + 1); }
		String file = null;
		for (String f : Bedrock.list("bp/structures/", ".mcstructure")) {
			String rel = f.substring("bp/structures/".length(), f.length() - ".mcstructure".length()).toLowerCase(Locale.ROOT);
			if (rel.equals(path) && ns.equals("mystructure") || rel.equals(ns + "/" + path)) { file = f; break; }
		}
		Struct s = null;
		if (file != null) {
			try (InputStream in = Bedrock.open(file)) {
				s = read(in.readAllBytes());
			} catch (Exception e) {
				Bedrock.warnOnce("structure", "Couldn't read " + file + ": " + e);
			}
		} else Bedrock.warnOnce("structure", "No structure " + name);
		CACHE.put(n, s);
		return s;
	}

	@SuppressWarnings("unchecked")
	private static Struct read(byte[] data) throws IOException {
		ByteBuffer b = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
		b.get(); // compound
		str(b);
		Map<String, Object> root = (Map<String, Object>) payload(b, 10);
		List<Object> size = (List<Object>) root.get("size");
		int sx = (Integer) size.get(0), sy = (Integer) size.get(1), sz = (Integer) size.get(2);
		Map<String, Object> st = (Map<String, Object>) root.get("structure");
		List<Object> layers = (List<Object>) st.get("block_indices");
		List<Object> l0 = (List<Object>) layers.get(0);
		int[] idx = new int[l0.size()];
		for (int i = 0; i < idx.length; i++) idx[i] = (Integer) l0.get(i);
		Map<String, Object> pal = (Map<String, Object>) ((Map<String, Object>) st.get("palette")).get("default");
		List<String> palette = new ArrayList<>();
		for (Object o : (List<Object>) pal.get("block_palette")) palette.add((String) ((Map<String, Object>) o).get("name"));
		List<Map<String, Object>> ents = new ArrayList<>();
		Object e = st.get("entities");
		if (e instanceof List<?> l) for (Object o : l) if (o instanceof Map<?, ?> m) ents.add((Map<String, Object>) m);
		int[] origin = new int[3];
		if (root.get("structure_world_origin") instanceof List<?> o && o.size() == 3) for (int i = 0; i < 3; i++) origin[i] = (Integer) o.get(i);
		return new Struct(sx, sy, sz, idx, palette, ents, origin);
	}

	private static String str(ByteBuffer b) {
		int len = Short.toUnsignedInt(b.getShort());
		byte[] s = new byte[len];
		b.get(s);
		return new String(s, java.nio.charset.StandardCharsets.UTF_8);
	}

	private static Object payload(ByteBuffer b, int type) {
		switch (type) {
			case 1: return (int) b.get();
			case 2: return (int) b.getShort();
			case 3: return b.getInt();
			case 4: return b.getLong();
			case 5: return b.getFloat();
			case 6: return b.getDouble();
			case 7: { int n = b.getInt(); byte[] a = new byte[n]; b.get(a); return a; }
			case 8: return str(b);
			case 9: {
				int t = b.get(), n = b.getInt();
				List<Object> l = new ArrayList<>(Math.max(0, n));
				for (int i = 0; i < n; i++) l.add(payload(b, t));
				return l;
			}
			case 10: {
				Map<String, Object> m = new HashMap<>();
				while (true) {
					int t = b.get();
					if (t == 0) return m;
					String k = str(b);
					m.put(k, payload(b, t));
				}
			}
			case 11: { int n = b.getInt(); int[] a = new int[n]; for (int i = 0; i < n; i++) a[i] = b.getInt(); return a; }
			case 12: { int n = b.getInt(); long[] a = new long[n]; for (int i = 0; i < n; i++) a[i] = b.getLong(); return a; }
			default: throw new IllegalStateException("bad tag " + type);
		}
	}

	@SuppressWarnings("unchecked")
	public static boolean load(ServerLevel level, String name, BlockPos at, String rotation) {
		Struct s = get(name);
		if (s == null) return false;
		Rotation rot = switch (rotation) { case "90_degrees" -> Rotation.CLOCKWISE_90; case "180_degrees" -> Rotation.CLOCKWISE_180; case "270_degrees" -> Rotation.COUNTERCLOCKWISE_90; default -> Rotation.NONE; };
		BlockState[] states = new BlockState[s.palette.size()];
		for (int i = 0; i < states.length; i++) {
			String n = s.palette.get(i);
			states[i] = n.equals("minecraft:structure_void") ? null : Blocks.state(n, null);
		}
		BlockPos.MutableBlockPos m = new BlockPos.MutableBlockPos();
		int i = 0;
		for (int x = 0; x < s.sx; x++) for (int y = 0; y < s.sy; y++) for (int z = 0; z < s.sz; z++, i++) {
			int k = s.indices[i];
			if (k < 0 || k >= states.length || states[k] == null) continue;
			BlockPos local = new BlockPos(x, y, z).rotate(rot);
			m.set(at.getX() + local.getX(), at.getY() + local.getY(), at.getZ() + local.getZ());
			if (level.isOutsideBuildHeight(m)) continue;
			level.setBlock(m, states[k].rotate(rot), Block.UPDATE_CLIENTS);
		}
		for (Map<String, Object> e : s.entities) {
			try {
				String id = (String) e.get("identifier");
				EntityType<?> t = id == null ? null : Types.javaType(id);
				List<Object> pos = (List<Object>) e.get("Pos");
				if (t == null || pos == null) continue;
				Entity ent = t.create(level);
				if (ent == null) continue;
				// positions in a structure are absolute from where it was saved; place relative to its origin
				ent.moveTo(at.getX() + (Float) pos.get(0) - s.origin[0], at.getY() + (Float) pos.get(1) - s.origin[1], at.getZ() + (Float) pos.get(2) - s.origin[2]);
				level.addFreshEntity(ent);
			} catch (RuntimeException ignored) { }
		}
		return true;
	}
}
