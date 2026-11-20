package com.jjka.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.joml.Matrix4f;
import org.joml.Vector3f;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/**
 * Bedrock geometry baked into quads, in Java model space (y down from 24, pixel units) so it renders through the normal
 * entity pipeline. Bone and cube rotations carry straight over (Bedrock's angles are Java's ModelPart angles).
 */
public final class Geo {
	public final String id;
	public final int texW, texH;
	public final List<Bone> bones = new ArrayList<>();
	public final Map<String, Bone> byName = new LinkedHashMap<>();
	/** a huge mesh around everything (a domain's sphere): drawn as a backdrop that doesn't hide effects beyond it */
	public boolean backdrop;
	/** something room-sized (a domain's walls): the clouds shouldn't show through it */
	public boolean huge;

	public static final class Bone {
		public final String name;
		public Bone parent;
		final String parentName;
		/** pivot in Java model space (pixels) */
		public final Vector3f pivot;
		/** rest rotation, radians */
		public final Vector3f rot;
		public final List<float[]> quads = new ArrayList<>(); // 4 x (x,y,z,u,v) + normal(3)
		public final Map<String, Vector3f> locators = new HashMap<>();
		public final List<Bone> children = new ArrayList<>();

		Bone(String name, String parentName, Vector3f pivot, Vector3f rot) { this.name = name; this.parentName = parentName; this.pivot = pivot; this.rot = rot; }
	}

	private Geo(String id, int w, int h) { this.id = id; texW = w; texH = h; }

	private static final Map<String, Geo> CACHE = new HashMap<>();

	public static synchronized Geo get(String id) {
		if (id == null) return null;
		if (CACHE.containsKey(id)) return CACHE.get(id);
		Geo g = null;
		JsonObject j = Rp.geometry(id);
		if (j != null) try { g = build(id, j); } catch (RuntimeException e) { com.jjka.bedrock.Bedrock.warnOnce("geo", "Bad geometry " + id + ": " + e); }
		CACHE.put(id, g);
		return g;
	}

	private static float f(JsonArray a, int i) { return a == null || a.size() <= i ? 0 : a.get(i).getAsFloat(); }

	private static Geo build(String id, JsonObject j) {
		JsonObject d = j.has("description") ? j.getAsJsonObject("description") : j;
		int tw = d.has("texture_width") ? d.get("texture_width").getAsInt() : d.has("texturewidth") ? d.get("texturewidth").getAsInt() : 64;
		int th = d.has("texture_height") ? d.get("texture_height").getAsInt() : d.has("textureheight") ? d.get("textureheight").getAsInt() : 64;
		Geo g = new Geo(id, tw, th);
		if (!j.has("bones")) return g;
		for (JsonElement be : j.getAsJsonArray("bones")) {
			JsonObject b = be.getAsJsonObject();
			String name = b.get("name").getAsString();
			JsonArray pv = b.has("pivot") ? b.getAsJsonArray("pivot") : null;
			JsonArray rt = b.has("rotation") ? b.getAsJsonArray("rotation") : null;
			Vector3f pivot = new Vector3f(f(pv, 0), 24 - f(pv, 1), f(pv, 2));
			Vector3f rot = new Vector3f((float) Math.toRadians(f(rt, 0)), (float) Math.toRadians(f(rt, 1)), (float) Math.toRadians(f(rt, 2)));
			Bone bone = new Bone(name, b.has("parent") ? b.get("parent").getAsString() : null, pivot, rot);
			boolean boneMirror = b.has("mirror") && b.get("mirror").getAsBoolean();
			float boneInflate = b.has("inflate") ? b.get("inflate").getAsFloat() : 0;
			if (b.has("cubes")) for (JsonElement ce : b.getAsJsonArray("cubes")) cube(g, bone, ce.getAsJsonObject(), boneMirror, boneInflate);
			if (b.has("poly_mesh") && b.get("poly_mesh").isJsonObject()) mesh(g, bone, b.getAsJsonObject("poly_mesh"));
			if (b.has("locators")) for (var l : b.getAsJsonObject("locators").entrySet()) {
				JsonArray p = l.getValue().isJsonArray() ? l.getValue().getAsJsonArray() : l.getValue().getAsJsonObject().getAsJsonArray("offset");
				bone.locators.put(l.getKey(), new Vector3f(f(p, 0), 24 - f(p, 1), f(p, 2)));
			}
			g.bones.add(bone);
			g.byName.put(name.toLowerCase(java.util.Locale.ROOT), bone);
		}
		for (Bone b : g.bones) {
			if (b.parentName != null) {
				b.parent = g.byName.get(b.parentName.toLowerCase(java.util.Locale.ROOT));
				if (b.parent != null) b.parent.children.add(b);
			}
		}
		return g;
	}

	private static void cube(Geo g, Bone bone, JsonObject c, boolean boneMirror, float boneInflate) {
		JsonArray o = c.getAsJsonArray("origin"), s = c.getAsJsonArray("size");
		float inflate = c.has("inflate") ? c.get("inflate").getAsFloat() : boneInflate;
		boolean mirror = c.has("mirror") ? c.get("mirror").getAsBoolean() : boneMirror;
		float sx = f(s, 0), sy = f(s, 1), sz = f(s, 2);
		if (Math.max(sx, Math.max(sy, sz)) > 160) g.huge = true;
		// Java model space: y down from 24
		float x0 = f(o, 0) - inflate, x1 = f(o, 0) + sx + inflate;
		if (mirror) { float t = x0; x0 = x1; x1 = t; }
		float y0 = 24 - (f(o, 1) + sy) - inflate, y1 = 24 - f(o, 1) + inflate;
		float z0 = f(o, 2) - inflate, z1 = f(o, 2) + sz + inflate;
		Matrix4f rot = null;
		if (c.has("rotation")) {
			JsonArray r = c.getAsJsonArray("rotation");
			JsonArray p = c.has("pivot") ? c.getAsJsonArray("pivot") : null;
			float px = f(p, 0), py = 24 - f(p, 1), pz = f(p, 2);
			rot = new Matrix4f().translate(px, py, pz).rotateZYX((float) Math.toRadians(f(r, 2)), (float) Math.toRadians(f(r, 1)), (float) Math.toRadians(f(r, 0))).translate(-px, -py, -pz);
		}
		float[][] v = {
			{ x0, y0, z0 }, { x1, y0, z0 }, { x1, y1, z0 }, { x0, y1, z0 },
			{ x0, y0, z1 }, { x1, y0, z1 }, { x1, y1, z1 }, { x0, y1, z1 },
		};
		// the same faces and vertex order as Java's ModelPart.Cube
		int[][] faces = {
			{ 5, 4, 0, 1 }, // DOWN (y-; on screen the top)
			{ 2, 3, 7, 6 }, // UP (on screen the bottom)
			{ 0, 4, 7, 3 }, // WEST
			{ 1, 0, 3, 2 }, // NORTH
			{ 5, 1, 2, 6 }, // EAST
			{ 4, 5, 6, 7 }, // SOUTH
		};
		float[][] normals = { { 0, -1, 0 }, { 0, 1, 0 }, { -1, 0, 0 }, { 0, 0, -1 }, { 1, 0, 0 }, { 0, 0, 1 } };
		float[][] uvs = new float[6][];
		JsonElement uv = c.get("uv");
		if (uv != null && uv.isJsonObject()) {
			JsonObject u = uv.getAsJsonObject();
			uvs[0] = face(u, "up", false);
			uvs[1] = face(u, "down", true);
			uvs[2] = face(u, "west", false);
			uvs[3] = face(u, "north", false);
			uvs[4] = face(u, "east", false);
			uvs[5] = face(u, "south", false);
		} else {
			float u = uv == null ? 0 : uv.getAsJsonArray().get(0).getAsFloat(), w = uv == null ? 0 : uv.getAsJsonArray().get(1).getAsFloat();
			float dx = (float) Math.floor(sx), dy = (float) Math.floor(sy), dz = (float) Math.floor(sz);
			float f4 = u, f5 = u + dz, f6 = u + dz + dx, f7 = u + dz + dx + dx, f8 = u + dz + dx + dz, f9 = u + dz + dx + dz + dx;
			float f10 = w, f11 = w + dz, f12 = w + dz + dy;
			uvs[0] = new float[] { f5, f10, f6, f11 };
			uvs[1] = new float[] { f6, f11, f7, f10 };
			uvs[2] = new float[] { f4, f11, f5, f12 };
			uvs[3] = new float[] { f5, f11, f6, f12 };
			uvs[4] = new float[] { f6, f11, f8, f12 };
			uvs[5] = new float[] { f8, f11, f9, f12 };
		}
		for (int k = 0; k < 6; k++) {
			if (uvs[k] == null) continue;
			float u1 = uvs[k][0] / g.texW, v1 = uvs[k][1] / g.texH, u2 = uvs[k][2] / g.texW, v2 = uvs[k][3] / g.texH;
			float[] q = new float[23];
			// Java's Polygon: vertex 0 -> (u2,v1), 1 -> (u1,v1), 2 -> (u1,v2), 3 -> (u2,v2); mirrored, the order reverses
			float[][] tuv = { { u2, v1 }, { u1, v1 }, { u1, v2 }, { u2, v2 } };
			for (int i = 0; i < 4; i++) {
				int src = mirror ? 3 - i : i;
				float[] p = v[faces[k][src]].clone();
				if (rot != null) { Vector3f t = rot.transformPosition(new Vector3f(p[0], p[1], p[2])); p[0] = t.x; p[1] = t.y; p[2] = t.z; }
				q[i * 5] = p[0]; q[i * 5 + 1] = p[1]; q[i * 5 + 2] = p[2]; q[i * 5 + 3] = tuv[src][0]; q[i * 5 + 4] = tuv[src][1];
			}
			Vector3f n = new Vector3f(mirror ? -normals[k][0] : normals[k][0], normals[k][1], normals[k][2]);
			if (rot != null) rot.transformDirection(n);
			q[20] = n.x; q[21] = n.y; q[22] = n.z;
			// skip faces with no area in the texture (Bedrock's way of hiding a face)
			if (u1 == u2 && v1 == v2) continue;
			bone.quads.add(q);
		}
	}

	/**
	 * poly_mesh: free-form triangles / quads (domain spheres and the like). Positions are model-space pixels like cube origins;
	 * UVs count up from the bottom of the texture (0-1 when normalized_uvs, else pixels).
	 */
	private static void mesh(Geo g, Bone bone, JsonObject m) {
		JsonArray pos = m.getAsJsonArray("positions"), nor = m.has("normals") ? m.getAsJsonArray("normals") : null, uv = m.has("uvs") ? m.getAsJsonArray("uvs") : null;
		if (pos == null || !m.has("polys") || !m.get("polys").isJsonArray()) return;
		boolean norm = m.has("normalized_uvs") && m.get("normalized_uvs").getAsBoolean();
		for (JsonElement pe : m.getAsJsonArray("polys")) {
			JsonArray poly = pe.getAsJsonArray();
			if (poly.size() < 3) continue;
			float[] q = new float[23];
			for (int i = 0; i < 4; i++) {
				JsonArray vtx = poly.get(Math.min(i, poly.size() - 1)).getAsJsonArray();
				JsonArray p = pos.get(vtx.get(0).getAsInt()).getAsJsonArray();
				q[i * 5] = f(p, 0); q[i * 5 + 1] = 24 - f(p, 1); q[i * 5 + 2] = f(p, 2);
				if (Math.abs(f(p, 0)) > 160 || Math.abs(f(p, 1)) > 160 || Math.abs(f(p, 2)) > 160) g.backdrop = g.huge = true;
				if (uv != null && vtx.size() > 2) {
					JsonArray t = uv.get(vtx.get(2).getAsInt()).getAsJsonArray();
					float u = f(t, 0), v = f(t, 1);
					q[i * 5 + 3] = norm ? u : u / g.texW;
					q[i * 5 + 4] = norm ? 1 - v : 1 - v / g.texH;
				}
				if (i == 0 && nor != null && vtx.size() > 1) {
					JsonArray n = nor.get(vtx.get(1).getAsInt()).getAsJsonArray();
					q[20] = f(n, 0); q[21] = -f(n, 1); q[22] = f(n, 2);
				}
			}
			if (nor == null) q[21] = -1;
			bone.quads.add(q);
		}
	}

	/** Per-face UV: {"uv":[u,v],"uv_size":[w,h]} */
	private static float[] face(JsonObject u, String name, boolean flipV) {
		if (!u.has(name)) return null;
		JsonObject f = u.getAsJsonObject(name);
		JsonArray a = f.getAsJsonArray("uv"), s = f.getAsJsonArray("uv_size");
		float x = f(a, 0), y = f(a, 1), w = s == null ? 0 : f(s, 0), h = s == null ? 0 : f(s, 1);
		return flipV ? new float[] { x, y + h, x + w, y } : new float[] { x, y, x + w, y + h };
	}
}
