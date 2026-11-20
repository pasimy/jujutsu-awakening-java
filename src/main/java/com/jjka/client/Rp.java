package com.jjka.client;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jjka.bedrock.Bedrock;

/** The resource pack's JSON, indexed by identifier: client entities, geometry, animations, controllers, particles */
public final class Rp {
	private Rp() {}

	private static Map<String, JsonObject> entities, geometry, animations, controllers, renderControllers, particles, attachables;
	private static final Map<String, Integer[]> GEO_SIZE = new HashMap<>();

	private static synchronized void load() {
		if (entities != null) return;
		entities = new HashMap<>();
		geometry = new HashMap<>();
		animations = new HashMap<>();
		controllers = new HashMap<>();
		renderControllers = new HashMap<>();
		particles = new HashMap<>();
		attachables = new HashMap<>();
		for (String f : Bedrock.index()) {
			if (!f.startsWith("rp/") || !f.endsWith(".json")) continue;
			String rel = f.substring(3).toLowerCase(java.util.Locale.ROOT);
			try {
				if (rel.startsWith("entity/")) {
					JsonObject j = Bedrock.json(f);
					JsonObject ce = j == null ? null : j.getAsJsonObject("minecraft:client_entity");
					if (ce != null) entities.put(Bedrock.id(ce.getAsJsonObject("description").get("identifier").getAsString()), ce.getAsJsonObject("description"));
				} else if (rel.startsWith("models/")) {
					JsonObject j = Bedrock.json(f);
					if (j == null) continue;
					if (j.has("minecraft:geometry")) for (JsonElement g : j.getAsJsonArray("minecraft:geometry")) {
						JsonObject go = g.getAsJsonObject();
						geometry.put(go.getAsJsonObject("description").get("identifier").getAsString(), go);
					}
					for (var e : j.entrySet()) if (e.getKey().startsWith("geometry.") && e.getValue().isJsonObject()) {
						// 1.8 / 1.10 format: "geometry.name:parent": {texturewidth, bones}
						String id = e.getKey().split(":")[0];
						geometry.put(id, e.getValue().getAsJsonObject());
					}
				} else if (rel.startsWith("animations/")) {
					JsonObject j = Bedrock.json(f);
					if (j != null && j.has("animations")) for (var e : j.getAsJsonObject("animations").entrySet()) if (e.getValue().isJsonObject()) animations.put(e.getKey(), e.getValue().getAsJsonObject());
				} else if (rel.startsWith("animation_controllers/")) {
					JsonObject j = Bedrock.json(f);
					if (j != null && j.has("animation_controllers")) for (var e : j.getAsJsonObject("animation_controllers").entrySet()) if (e.getValue().isJsonObject()) controllers.put(e.getKey(), e.getValue().getAsJsonObject());
				} else if (rel.startsWith("render_controllers/")) {
					JsonObject j = Bedrock.json(f);
					if (j != null && j.has("render_controllers")) for (var e : j.getAsJsonObject("render_controllers").entrySet()) if (e.getValue().isJsonObject()) renderControllers.put(e.getKey(), e.getValue().getAsJsonObject());
				} else if (rel.startsWith("particles/")) {
					JsonObject j = Bedrock.json(f);
					JsonObject pe = j == null ? null : j.getAsJsonObject("particle_effect");
					if (pe != null) particles.put(Bedrock.id(pe.getAsJsonObject("description").get("identifier").getAsString()), pe);
				} else if (rel.startsWith("attachables/")) {
					JsonObject j = Bedrock.json(f);
					JsonObject at = j == null ? null : j.getAsJsonObject("minecraft:attachable");
					if (at != null) attachables.put(Bedrock.id(at.getAsJsonObject("description").get("identifier").getAsString()), at.getAsJsonObject("description"));
				}
			} catch (RuntimeException ex) {
				Bedrock.warnOnce("rp", "Couldn't read " + f + ": " + ex);
			}
		}
		Bedrock.LOG.info("Resource pack: {} entities, {} geometries, {} animations, {} controllers, {} render controllers, {} particles",
				entities.size(), geometry.size(), animations.size(), controllers.size(), renderControllers.size(), particles.size());
	}

	public static JsonObject entity(String id) { load(); return entities.get(Bedrock.id(id)); }
	public static JsonObject geometry(String id) { load(); return geometry.get(id); }
	public static JsonObject animation(String id) { load(); return animations.get(id); }
	public static JsonObject controller(String id) { load(); return controllers.get(id); }
	public static JsonObject renderController(String id) { load(); return renderControllers.get(id); }
	public static JsonObject particle(String id) { load(); return particles.get(Bedrock.id(id)); }
	public static JsonObject attachable(String id) { load(); return attachables.get(Bedrock.id(id)); }

	/** Warm the cache off the render thread */
	public static void preload() { load(); }

	static Integer[] size(String geo) { return GEO_SIZE.get(geo); }
}
