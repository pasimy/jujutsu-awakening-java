package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/** A behaviour-pack entity definition (minecraft:entity): its components, component groups, events and properties */
public final class EntityDef {
	public final String id;
	public final String file;
	public final JsonObject components;
	public final Map<String, JsonObject> groups = new HashMap<>();
	public final Map<String, JsonObject> events = new HashMap<>();
	public final Map<String, Property> properties = new LinkedHashMap<>();
	/** description.scripts.animate + description.animations: server-side controllers that run commands */
	public final List<String> animate = new ArrayList<>();
	public final Map<String, String> animations = new HashMap<>();
	public final boolean summonable, spawnable;
	public final String runtimeId;
	final double format;

	public static final class Property {
		public final String name, type;
		public final List<String> values = new ArrayList<>();
		public final double min, max;
		public final Object def;
		public final boolean sync;

		Property(String name, JsonObject j) {
			this.name = name;
			type = j.has("type") ? j.get("type").getAsString() : "int";
			if (j.has("values")) for (JsonElement v : j.getAsJsonArray("values")) values.add(v.getAsString());
			if (j.has("range") && j.get("range").isJsonArray()) {
				JsonArray r = j.getAsJsonArray("range");
				min = r.get(0).getAsDouble();
				max = r.get(1).getAsDouble();
			} else { min = Double.NEGATIVE_INFINITY; max = Double.POSITIVE_INFINITY; }
			sync = j.has("client_sync") && j.get("client_sync").getAsBoolean();
			JsonElement d = j.get("default");
			if (type.equals("bool")) def = d != null && (d.isJsonPrimitive() && d.getAsJsonPrimitive().isBoolean() ? d.getAsBoolean() : d != null && !d.getAsString().equals("0") && !d.getAsString().equals("false"));
			else if (type.equals("enum")) def = d == null ? values.isEmpty() ? "" : values.get(0) : d.getAsString();
			else if (d != null && d.isJsonPrimitive() && d.getAsJsonPrimitive().isNumber()) def = type.equals("int") ? (Object) d.getAsInt() : (Object) d.getAsDouble();
			else def = type.equals("int") ? (Object) 0 : (Object) 0.0;
		}

		/** A value set by an event or command, coerced to this property's type */
		public Object coerce(Object v) {
			return switch (type) {
				case "bool" -> v instanceof Boolean b ? b : v instanceof String s ? s.equalsIgnoreCase("true") || s.equals("1") : Molang.truth(v);
				case "enum" -> {
					String s = String.valueOf(v);
					yield values.contains(s) ? s : def;
				}
				case "int" -> (int) Math.max(min, Math.min(max, Math.round(v instanceof String s ? parse(s) : Molang.num(v))));
				default -> Math.max(min, Math.min(max, v instanceof String s ? parse(s) : Molang.num(v)));
			};
		}

		private static double parse(String s) { try { return Double.parseDouble(s); } catch (NumberFormatException e) { return 0; } }
	}

	EntityDef(String file, JsonObject root) {
		this.file = file;
		JsonObject e = root.getAsJsonObject("minecraft:entity");
		JsonObject d = e.getAsJsonObject("description");
		id = Bedrock.id(d.get("identifier").getAsString());
		summonable = !d.has("is_summonable") || d.get("is_summonable").getAsBoolean();
		spawnable = d.has("is_spawnable") && d.get("is_spawnable").getAsBoolean();
		runtimeId = d.has("runtime_identifier") ? Bedrock.id(d.get("runtime_identifier").getAsString()) : null;
		components = e.has("components") ? e.getAsJsonObject("components") : new JsonObject();
		if (e.has("component_groups")) for (var g : e.getAsJsonObject("component_groups").entrySet())
			if (g.getValue().isJsonObject()) groups.put(g.getKey(), g.getValue().getAsJsonObject());
		if (e.has("events")) for (var ev : e.getAsJsonObject("events").entrySet())
			if (ev.getValue().isJsonObject()) events.put(ev.getKey(), ev.getValue().getAsJsonObject());
		JsonObject props = d.has("properties") ? d.getAsJsonObject("properties") : null;
		if (props != null) for (var p : props.entrySet()) properties.put(p.getKey().toLowerCase(Locale.ROOT), new Property(p.getKey().toLowerCase(Locale.ROOT), p.getValue().getAsJsonObject()));
		if (d.has("animations")) for (var a : d.getAsJsonObject("animations").entrySet()) animations.put(a.getKey(), a.getValue().getAsString());
		if (d.has("scripts") && d.getAsJsonObject("scripts").has("animate"))
			for (JsonElement a : d.getAsJsonObject("scripts").getAsJsonArray("animate"))
				animate.add(a.isJsonPrimitive() ? a.getAsString() : a.getAsJsonObject().keySet().iterator().next());
		double f = 0;
		try { f = Double.parseDouble(root.get("format_version").getAsString().replaceFirst("^(\\d+\\.\\d+).*", "$1")); } catch (RuntimeException ignored) { }
		format = f;
	}

	// ------------------------------------------------------------------ all of them
	private static Map<String, EntityDef> defs;

	public static synchronized Map<String, EntityDef> all() {
		if (defs != null) return defs;
		defs = new LinkedHashMap<>();
		for (String file : Bedrock.list("bp/entities/", ".json")) {
			JsonObject j = Bedrock.json(file);
			if (j == null || !j.has("minecraft:entity")) continue;
			try {
				EntityDef d = new EntityDef(file, j);
				EntityDef old = defs.get(d.id);
				// the add-on has a few copies of the same entity; keep the newest format (then the one that isn't "- Copy")
				if (old == null || d.format > old.format || d.format == old.format && old.file.contains("Copy") && !d.file.contains("Copy")) defs.put(d.id, d);
			} catch (RuntimeException ex) {
				Bedrock.warnOnce("entity", "Couldn't read " + file + ": " + ex);
			}
		}
		return defs;
	}

	public static EntityDef get(String id) { return all().get(Bedrock.id(id)); }
}
