package com.jjka.bedrock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.network.chat.Component;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.player.Player;

/** Bedrock rawtext ({"rawtext":[{"text":..},{"score":..},{"selector":..},{"translate":..}]}) turned into a § string */
public final class Text {
	private Text() {}

	private static Map<String, String> lang;

	static synchronized Map<String, String> lang() {
		if (lang != null) return lang;
		lang = new HashMap<>();
		String t = Bedrock.text("rp/texts/en_US.lang");
		if (t != null) for (String line : t.split("\\r?\\n")) {
			int hash = line.indexOf('\t');
			String l = hash >= 0 ? line.substring(0, hash) : line;
			int eq = l.indexOf('=');
			if (eq > 0 && !l.startsWith("#")) lang.put(l.substring(0, eq).trim(), l.substring(eq + 1).trim().replaceAll("\\s+#.*$", ""));
		}
		return lang;
	}

	public static String translate(String key) { return lang().getOrDefault(key, key); }

	static int tellraw(Commands.Ctx c, List<Entity> to, String json) {
		int n = 0;
		for (Entity e : to) if (e instanceof ServerPlayer p) { p.sendSystemMessage(Component.literal(raw(c, p, json))); n++; }
		return n;
	}

	public static String raw(Commands.Ctx c, ServerPlayer viewer, String json) {
		try {
			JsonElement j = Bedrock.parse(json);
			return j.isJsonObject() ? object(c, viewer, j.getAsJsonObject()) : j.getAsString();
		} catch (RuntimeException e) {
			return json;
		}
	}

	private static String object(Commands.Ctx c, ServerPlayer viewer, JsonObject o) {
		StringBuilder b = new StringBuilder();
		if (o.has("rawtext")) for (JsonElement part : o.getAsJsonArray("rawtext")) if (part.isJsonObject()) b.append(part(c, viewer, part.getAsJsonObject()));
		return b.toString();
	}

	private static String part(Commands.Ctx c, ServerPlayer viewer, JsonObject p) {
		if (p.has("text")) return p.get("text").getAsString();
		if (p.has("rawtext")) return object(c, viewer, p);
		if (p.has("score")) {
			JsonObject s = p.getAsJsonObject("score");
			String name = s.has("name") ? s.get("name").getAsString() : "*";
			String obj = s.has("objective") ? s.get("objective").getAsString() : "";
			Scores sc = Scores.current();
			if (sc == null) return "";
			Integer v;
			if (name.equals("*")) v = sc.get(viewer, obj);
			else if (name.startsWith("@")) {
				List<Entity> es = Selector.parse(name).select(c);
				v = es.isEmpty() ? null : sc.get(es.get(0), obj);
			} else v = sc.get(name, obj);
			return v == null ? "" : String.valueOf(v);
		}
		if (p.has("selector")) {
			List<Entity> es = Selector.parse(p.get("selector").getAsString()).select(c);
			StringBuilder b = new StringBuilder();
			for (Entity e : es) {
				if (b.length() > 0) b.append(", ");
				b.append(e instanceof Player pl ? pl.getGameProfile().getName() : e.getName().getString());
			}
			return b.toString();
		}
		if (p.has("translate")) {
			String fmt = translate(p.get("translate").getAsString());
			JsonElement with = p.get("with");
			String[] args = new String[0];
			if (with != null) {
				if (with.isJsonArray()) {
					JsonArray a = with.getAsJsonArray();
					args = new String[a.size()];
					for (int i = 0; i < a.size(); i++) args[i] = a.get(i).getAsString();
				} else if (with.isJsonObject()) {
					JsonArray a = with.getAsJsonObject().getAsJsonArray("rawtext");
					args = new String[a == null ? 0 : a.size()];
					for (int i = 0; i < args.length; i++) args[i] = a.get(i).isJsonObject() ? part(c, viewer, a.get(i).getAsJsonObject()) : a.get(i).getAsString();
				}
			}
			int k = 0;
			StringBuilder b = new StringBuilder();
			for (int i = 0; i < fmt.length(); i++) {
				char ch = fmt.charAt(i);
				if (ch == '%' && i + 1 < fmt.length()) {
					char nx = fmt.charAt(i + 1);
					if (nx == 's') { b.append(k < args.length ? args[k++] : ""); i++; continue; }
					if (Character.isDigit(nx)) {
						int idx = nx - '1';
						b.append(idx >= 0 && idx < args.length ? args[idx] : "");
						i++;
						if (i + 2 < fmt.length() && fmt.charAt(i + 1) == '$' && fmt.charAt(i + 2) == 's') i += 2;
						continue;
					}
					if (nx == '%') { b.append('%'); i++; continue; }
				}
				b.append(ch);
			}
			return b.toString();
		}
		return "";
	}
}
