package com.jjka.bedrock;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

import net.minecraft.resources.ResourceLocation;

/** Reading the two packs out of the jar (bedrock/bp, bedrock/rp), and small shared helpers */
public final class Bedrock {
	/** test hook: (entity, what happened to it) */
	public static java.util.function.BiConsumer<net.minecraft.world.entity.Entity, String> DEBUG;

	private Bedrock() {}

	public static final String MODID = "jjka";
	public static final Logger LOG = LoggerFactory.getLogger("JJKA");
	private static final Set<String> WARNED = ConcurrentHashMap.newKeySet();
	private static List<String> index;

	/** Logs a problem once (per key), so a broken line in a function run every tick doesn't flood the log */
	public static void warnOnce(String key, String message) {
		if (WARNED.size() < 5000 && WARNED.add(key + "|" + message)) LOG.warn(message);
	}

	public static InputStream open(String path) {
		return Bedrock.class.getResourceAsStream("/bedrock/" + path);
	}

	/** Every file in the packs, as "bp/..." / "rp/..." */
	public static synchronized List<String> index() {
		if (index != null) return index;
		List<String> out = new ArrayList<>();
		try (InputStream in = open("index.txt")) {
			if (in != null) for (String line : new String(in.readAllBytes(), StandardCharsets.UTF_8).split("\n"))
				if (!line.isBlank()) out.add(line.trim());
		} catch (IOException e) { LOG.error("Couldn't read the pack index", e); }
		index = Collections.unmodifiableList(out);
		return index;
	}

	/** Files under a folder ("bp/functions/") */
	public static List<String> list(String folder, String suffix) {
		List<String> out = new ArrayList<>();
		String f = folder.toLowerCase(Locale.ROOT);
		for (String p : index()) if (p.toLowerCase(Locale.ROOT).startsWith(f) && p.toLowerCase(Locale.ROOT).endsWith(suffix)) out.add(p);
		return out;
	}

	public static String text(String path) {
		try (InputStream in = open(path)) {
			if (in == null) return null;
			String s = new String(in.readAllBytes(), StandardCharsets.UTF_8);
			return s.startsWith("﻿") ? s.substring(1) : s;
		} catch (IOException e) {
			return null;
		}
	}

	/** Bedrock JSON allows comments and trailing commas */
	public static JsonObject json(String path) {
		String s = text(path);
		if (s == null) return null;
		try {
			return parse(s).getAsJsonObject();
		} catch (RuntimeException e) {
			warnOnce("json", "Couldn't read " + path + ": " + e.getMessage());
			return null;
		}
	}

	public static JsonElement parse(String s) {
		JsonReader r = new JsonReader(new java.io.StringReader(stripComments(s)));
		r.setLenient(true);
		return JsonParser.parseReader(r);
	}

	public static String stripComments(String t) {
		StringBuilder b = new StringBuilder(t.length());
		int n = t.length();
		boolean str = false;
		for (int i = 0; i < n; i++) {
			char c = t.charAt(i);
			if (str) {
				b.append(c);
				if (c == '\\' && i + 1 < n) b.append(t.charAt(++i));
				else if (c == '"') str = false;
			} else if (c == '"') {
				str = true;
				b.append(c);
			} else if (c == '/' && i + 1 < n && t.charAt(i + 1) == '/') {
				while (i < n && t.charAt(i) != '\n') i++;
				b.append('\n');
			} else if (c == '/' && i + 1 < n && t.charAt(i + 1) == '*') {
				int e = t.indexOf("*/", i + 2);
				i = e < 0 ? n : e + 1;
			} else b.append(c);
		}
		// trailing commas
		return b.toString().replaceAll(",(\\s*[}\\]])", "$1");
	}

	public static Reader reader(InputStream in) { return new InputStreamReader(in, StandardCharsets.UTF_8); }

	/** The same "safe" name tools/import_bedrock.py gives textures and sounds */
	public static String safe(String p) {
		StringBuilder b = new StringBuilder(p.length());
		for (char c : p.replace('\\', '/').toLowerCase(Locale.ROOT).toCharArray())
			b.append(c >= 'a' && c <= 'z' || c >= '0' && c <= '9' || c == '/' || c == '.' || c == '_' || c == '-' ? c : '_');
		return b.toString();
	}

	/** "textures/entity/x" -> jjka:textures/entity/x.png */
	public static ResourceLocation texture(String bedrockPath) {
		String p = safe(bedrockPath.toLowerCase(Locale.ROOT).endsWith(".png") ? bedrockPath : bedrockPath + ".png");
		// not under textures/particle: Java stitches every mod's textures/particle/ into its own particle atlas, and the
		// add-on's hundreds of big effect textures made it far too large for the graphics card (vanilla particles turned black)
		if (p.startsWith("textures/particle/")) p = "textures/bparticle/" + p.substring("textures/particle/".length());
		return new ResourceLocation(MODID, p);
	}

	public static ResourceLocation sound(String bedrockName) { return new ResourceLocation(MODID, safe(bedrockName)); }

	/** "ds:projectile" -> "ds:projectile"; "zombie" -> "minecraft:zombie" */
	public static String id(String s) {
		s = s.trim().toLowerCase(Locale.ROOT);
		return s.indexOf(':') < 0 ? "minecraft:" + s : s;
	}

	/** A Java resource path made from a namespaced Bedrock id (ds:projectile -> ds__projectile) */
	public static String path(String bedrockId) { return safe(bedrockId.replace(":", "__")); }
}
