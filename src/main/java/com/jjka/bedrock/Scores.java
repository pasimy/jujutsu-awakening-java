package com.jjka.bedrock;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.Tag;
import net.minecraft.server.MinecraftServer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.level.saveddata.SavedData;

/**
 * Bedrock's scoreboard: objectives of participants (entities by UUID, or "fake players" by name). Kept apart from Java's
 * own scoreboard (the add-on uses hundreds of objectives every tick) and saved with the world.
 */
public final class Scores extends SavedData {
	public static final class Objective {
		final String name;
		String display;
		final Map<UUID, Integer> entities = new HashMap<>();
		final Map<String, Integer> fakes = new HashMap<>();

		Objective(String name, String display) { this.name = name; this.display = display; }
	}

	private final Map<String, Objective> objectives = new LinkedHashMap<>();
	/** sidebar / list / belowname -> objective */
	public final Map<String, String> displays = new HashMap<>();
	private static Scores current;

	public static Scores get(MinecraftServer server) {
		Scores s = server.overworld().getDataStorage().computeIfAbsent(Scores::load, Scores::new, "jjka_scores");
		current = s;
		return s;
	}

	public static Scores current() { return current; }

	static void reset() { current = null; }

	public Objective objective(String name) { return objectives.get(name); }

	/** Bedrock adds objectives with "scoreboard objectives add"; the add-on also uses some it never adds, so make them on use */
	public Objective ensure(String name) {
		Objective o = objectives.get(name);
		if (o == null) { o = new Objective(name, name); objectives.put(name, o); setDirty(); }
		return o;
	}

	public boolean add(String name, String display) {
		if (objectives.containsKey(name)) return false;
		objectives.put(name, new Objective(name, display == null ? name : display));
		setDirty();
		return true;
	}

	public void remove(String name) {
		if (objectives.remove(name) != null) setDirty();
		displays.values().removeIf(name::equals);
	}

	public Iterable<String> names() { return objectives.keySet(); }

	// ------------------------------------------------------------------ entity scores
	public Integer get(Entity e, String objective) {
		Objective o = objectives.get(objective);
		return o == null ? null : o.entities.get(e.getUUID());
	}

	public int getOr(Entity e, String objective, int fallback) {
		Integer v = get(e, objective);
		return v == null ? fallback : v;
	}

	public void set(Entity e, String objective, int value) {
		Objective o = ensure(objective);
		Integer old = o.entities.put(e.getUUID(), value);
		if (old == null || old != value) setDirty();
	}

	public void reset(Entity e, String objective) {
		if (objective == null) { for (Objective o : objectives.values()) o.entities.remove(e.getUUID()); }
		else { Objective o = objectives.get(objective); if (o != null) o.entities.remove(e.getUUID()); }
		setDirty();
	}

	/** An entity that's gone for good takes its scores with it */
	public void forget(UUID id) {
		boolean any = false;
		for (Objective o : objectives.values()) any |= o.entities.remove(id) != null;
		if (any) setDirty();
	}

	// ------------------------------------------------------------------ fake players
	public Integer get(String fake, String objective) {
		Objective o = objectives.get(objective);
		return o == null ? null : o.fakes.get(fake);
	}

	public void set(String fake, String objective, int value) {
		ensure(objective).fakes.put(fake, value);
		setDirty();
	}

	public void reset(String fake, String objective) {
		if (objective == null) { for (Objective o : objectives.values()) o.fakes.remove(fake); }
		else { Objective o = objectives.get(objective); if (o != null) o.fakes.remove(fake); }
		setDirty();
	}

	// ------------------------------------------------------------------ saving
	@Override
	public CompoundTag save(CompoundTag tag) {
		CompoundTag all = new CompoundTag();
		for (Objective o : objectives.values()) {
			CompoundTag t = new CompoundTag();
			t.putString("display", o.display);
			CompoundTag ents = new CompoundTag();
			for (var e : o.entities.entrySet()) ents.putInt(e.getKey().toString(), e.getValue());
			CompoundTag fakes = new CompoundTag();
			for (var e : o.fakes.entrySet()) fakes.putInt(e.getKey(), e.getValue());
			t.put("entities", ents);
			t.put("fakes", fakes);
			all.put(o.name, t);
		}
		tag.put("objectives", all);
		CompoundTag d = new CompoundTag();
		displays.forEach(d::putString);
		tag.put("displays", d);
		return tag;
	}

	static Scores load(CompoundTag tag) {
		Scores s = new Scores();
		CompoundTag all = tag.getCompound("objectives");
		for (String name : all.getAllKeys()) {
			CompoundTag t = all.getCompound(name);
			Objective o = new Objective(name, t.getString("display"));
			CompoundTag ents = t.getCompound("entities");
			for (String k : ents.getAllKeys()) try { o.entities.put(UUID.fromString(k), ents.getInt(k)); } catch (IllegalArgumentException ignored) { }
			CompoundTag fakes = t.getCompound("fakes");
			for (String k : fakes.getAllKeys()) o.fakes.put(k, fakes.getInt(k));
			s.objectives.put(name, o);
		}
		CompoundTag d = tag.getCompound("displays");
		for (String k : d.getAllKeys()) if (d.contains(k, Tag.TAG_STRING)) s.displays.put(k, d.getString(k));
		return s;
	}
}
