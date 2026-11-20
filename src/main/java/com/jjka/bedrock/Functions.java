package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.server.MinecraftServer;

/** The behaviour pack's .mcfunction files, and its tick.json */
public final class Functions {
	private Functions() {}

	private static Map<String, String[]> functions;
	private static List<String> tick;

	public static synchronized void load() {
		if (functions != null) return;
		functions = new HashMap<>();
		for (String file : Bedrock.list("bp/functions/", ".mcfunction")) {
			String text = Bedrock.text(file);
			if (text == null) continue;
			String name = file.substring("bp/functions/".length(), file.length() - ".mcfunction".length()).toLowerCase(Locale.ROOT);
			List<String> lines = new ArrayList<>();
			for (String l : text.split("\\r?\\n")) {
				String t = l.trim();
				if (!t.isEmpty() && !t.startsWith("#")) lines.add(t);
			}
			functions.put(name, lines.toArray(new String[0]));
		}
		tick = new ArrayList<>();
		JsonObject t = Bedrock.json("bp/functions/tick.json");
		if (t != null && t.has("values")) for (JsonElement e : t.getAsJsonArray("values")) tick.add(e.getAsString().toLowerCase(Locale.ROOT));
		Bedrock.LOG.info("Loaded {} functions, {} run every tick", functions.size(), tick.size());
	}

	public static boolean exists(String name) { load(); return functions.containsKey(clean(name)); }

	private static String clean(String name) {
		String n = name.trim().toLowerCase(Locale.ROOT).replace('\\', '/');
		if (n.startsWith("\"") && n.endsWith("\"")) n = n.substring(1, n.length() - 1);
		if (n.startsWith("/")) n = n.substring(1);
		return n;
	}

	public static int run(String name, Commands.Ctx c) {
		load();
		String[] lines = functions.get(clean(name));
		if (lines == null) {
			Bedrock.warnOnce("function", "No function " + name);
			return 0;
		}
		if (c.depth > 64) return 0;
		Commands.Ctx inner = c.copy();
		inner.depth = c.depth + 1;
		for (String line : lines) Commands.run(inner, line);
		return 1;
	}

	/** Every server tick: the tick.json functions, run by the world at its origin */
	public static void tick(MinecraftServer server) {
		load();
		Commands.Ctx c = Commands.Ctx.world(server);
		c.pos = net.minecraft.world.phys.Vec3.ZERO;
		for (String f : tick) run(f, c);
	}
}
