package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.ListTag;
import net.minecraft.nbt.StringTag;
import net.minecraft.nbt.Tag;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.MobCategory;
import net.minecraft.world.entity.MobType;
import net.minecraft.world.entity.player.Player;
import net.minecraftforge.registries.ForgeRegistries;

/**
 * The Bedrock side of an entity: which component groups are on, its properties, variant / mark variant / skin id, its
 * families, timers and the behaviour-pack animation controllers that run commands. Players and the add-on's own entities
 * have one; vanilla mobs get a light one (just families) so selectors and filters work on them.
 */
public final class Actor implements Molang.Scope {
	public final Entity entity;
	public final EntityDef def;
	final LinkedHashSet<String> groups = new LinkedHashSet<>();
	private JsonObject merged;
	public final Map<String, Object> properties = new LinkedHashMap<>();
	public int variant, markVariant, skinId;
	final Map<String, Object> variables = new HashMap<>(), temps = new HashMap<>(), context = new HashMap<>();
	/** behaviour-pack animation controller -> current state */
	final Map<String, String> controllers = new HashMap<>();
	final Map<String, Integer> timers = new HashMap<>();
	private Set<String> families;
	boolean dirty = true, groupsChanged, groupsChangedOnce;
	private boolean spawned;

	private static final Map<Entity, Actor> ACTORS = new WeakHashMap<>();

	private Actor(Entity entity, EntityDef def) {
		this.entity = entity;
		this.def = def;
		if (def != null) for (var p : def.properties.values()) properties.put(p.name, p.def);
	}

	public static Actor of(Entity e) {
		synchronized (ACTORS) {
			Actor a = ACTORS.get(e);
			if (a == null) {
				a = new Actor(e, defFor(e));
				ACTORS.put(e, a);
				if (e.getPersistentData().contains("jjka", Tag.TAG_COMPOUND)) a.load(e.getPersistentData().getCompound("jjka"));
			}
			return a;
		}
	}

	public static Actor peek(Entity e) { synchronized (ACTORS) { return ACTORS.get(e); } }

	static EntityDef defFor(Entity e) {
		if (e instanceof BedrockEntity b) return b.def();
		if (e instanceof Player) return EntityDef.get("minecraft:player");
		return null;
	}

	/** The Bedrock id of any entity: ds:projectile, minecraft:zombie, minecraft:xp_orb ... */
	public static String typeId(Entity e) {
		if (e instanceof BedrockEntity b) return b.def().id;
		return Types.bedrockId(e.getType());
	}

	// ------------------------------------------------------------------ components
	/** The live component set: the base components with every active group's laid over it, in the order they went on */
	public JsonObject components() {
		if (merged != null) return merged;
		JsonObject m = new JsonObject();
		if (def != null) {
			for (var c : def.components.entrySet()) m.add(c.getKey(), c.getValue());
			for (String g : groups) {
				JsonObject grp = def.groups.get(g);
				if (grp != null) for (var c : grp.entrySet()) m.add(c.getKey(), c.getValue());
			}
		}
		merged = m;
		return m;
	}

	public JsonObject component(String name) {
		JsonElement c = components().get(name);
		return c != null && c.isJsonObject() ? c.getAsJsonObject() : null;
	}

	public boolean has(String name) { return components().has(name); }

	public static boolean hasComponent(Entity e, String name) {
		Actor a = of(e);
		if (a.def != null) return a.has(name);
		return switch (name) {
			case "minecraft:health" -> e instanceof LivingEntity;
			case "minecraft:armor_stand" -> e instanceof net.minecraft.world.entity.decoration.ArmorStand;
			default -> false;
		};
	}

	public static Set<String> families(Entity e) {
		Actor a = of(e);
		if (a.families == null) a.families = a.computeFamilies();
		return a.families;
	}

	private Set<String> computeFamilies() {
		Set<String> f = new HashSet<>();
		JsonObject tf = component("minecraft:type_family");
		if (tf != null && tf.has("family")) for (JsonElement x : tf.getAsJsonArray("family")) f.add(x.getAsString().toLowerCase(Locale.ROOT));
		if (def == null || entity instanceof Player) f.addAll(Types.vanillaFamilies(entity));
		return f;
	}

	// ------------------------------------------------------------------ events
	public void event(String name) { event(name, Filters.Ctx.of(entity)); }

	public void event(String name, Filters.Ctx ctx) {
		if (def == null || name == null) return;
		String n = name.startsWith("@s:") ? name.substring(3) : name;
		JsonObject ev = def.events.get(n);
		if (ev == null) {
			if (!n.startsWith("minecraft:")) Bedrock.warnOnce("event", typeId(entity) + " has no event " + n);
			return;
		}
		run(ev, ctx, 0);
		apply();
	}

	private void run(JsonObject ev, Filters.Ctx ctx, int depth) {
		if (depth > 16) return;
		if (ev.has("filters") && !Filters.test(ev.get("filters"), ctx)) return;
		if (ev.has("remove")) for (String g : list(ev.getAsJsonObject("remove"), "component_groups")) if (groups.remove(g)) changed();
		if (ev.has("add")) for (String g : list(ev.getAsJsonObject("add"), "component_groups")) {
			groups.remove(g);
			groups.add(g);
			changed();
		}
		if (ev.has("set_property")) for (var p : ev.getAsJsonObject("set_property").entrySet()) {
			EntityDef.Property prop = def.properties.get(p.getKey().toLowerCase(Locale.ROOT));
			if (prop == null) continue;
			JsonElement v = p.getValue();
			Object val;
			if (v.isJsonPrimitive() && v.getAsJsonPrimitive().isString() && !prop.type.equals("enum")) val = Molang.compile(v.getAsString()).eval(this);
			else if (v.isJsonPrimitive() && v.getAsJsonPrimitive().isString() && prop.type.equals("enum") && v.getAsString().contains("q.")) val = Molang.compile(v.getAsString()).eval(this);
			else if (v.isJsonPrimitive()) val = v.getAsJsonPrimitive().isBoolean() ? v.getAsBoolean() : v.getAsJsonPrimitive().isNumber() ? v.getAsDouble() : v.getAsString();
			else continue;
			setProperty(prop.name, val);
		}
		if (ev.has("queue_command")) commands(ev.getAsJsonObject("queue_command"));
		if (ev.has("run_command")) commands(ev.getAsJsonObject("run_command"));
		if (ev.has("trigger")) {
			JsonElement t = ev.get("trigger");
			String evName = t.isJsonPrimitive() ? t.getAsString() : t.getAsJsonObject().has("event") ? t.getAsJsonObject().get("event").getAsString() : null;
			String target = t.isJsonObject() && t.getAsJsonObject().has("target") ? t.getAsJsonObject().get("target").getAsString() : "self";
			if (t.isJsonObject() && t.getAsJsonObject().has("filters") && !Filters.test(t.getAsJsonObject().get("filters"), ctx)) evName = null;
			if (evName != null) {
				Entity who = ctx.subject(target);
				if (who == entity || who == null) { JsonObject next = def.events.get(evName.replace("@s:", "")); if (next != null) run(next, ctx, depth + 1); }
				else of(who).event(evName, Filters.Ctx.of(who));
			}
		}
		if (ev.has("sequence")) for (JsonElement s : ev.getAsJsonArray("sequence")) if (s.isJsonObject()) run(s.getAsJsonObject(), ctx, depth + 1);
		if (ev.has("randomize")) {
			JsonArray opts = ev.getAsJsonArray("randomize");
			double total = 0;
			for (JsonElement o : opts) total += weight(o);
			double r = Math.random() * total;
			for (JsonElement o : opts) {
				r -= weight(o);
				if (r <= 0) { run(o.getAsJsonObject(), ctx, depth + 1); break; }
			}
		}
	}

	private static double weight(JsonElement o) {
		return o.isJsonObject() && o.getAsJsonObject().has("weight") ? o.getAsJsonObject().get("weight").getAsDouble() : 1;
	}

	private void commands(JsonObject q) {
		if (!(entity.level() instanceof ServerLevel)) return;
		JsonElement c = q.get("command");
		if (c == null) return;
		List<String> cmds = new ArrayList<>();
		if (c.isJsonArray()) for (JsonElement x : c.getAsJsonArray()) cmds.add(x.getAsString());
		else cmds.add(c.getAsString());
		for (String cmd : cmds) Commands.runAs(entity, cmd.startsWith("/") ? cmd.substring(1) : cmd);
	}

	private static List<String> list(JsonObject o, String key) {
		List<String> out = new ArrayList<>();
		if (o != null && o.has(key)) for (JsonElement e : o.getAsJsonArray(key)) out.add(e.getAsString());
		return out;
	}

	private void changed() {
		merged = null;
		families = null;
		groupsChanged = true;
		dirty = true;
	}

	/** Puts component changes into effect (size, health, physics ...) */
	void apply() {
		if (!groupsChanged) return;
		groupsChanged = false;
		JsonObject v = component("minecraft:variant");
		if (v != null && v.has("value")) variant = v.get("value").getAsInt();
		JsonObject mv = component("minecraft:mark_variant");
		if (mv != null && mv.has("value")) markVariant = mv.get("value").getAsInt();
		JsonObject sk = component("minecraft:skin_id");
		if (sk != null && sk.has("value")) skinId = sk.get("value").getAsInt();
		if (entity instanceof BedrockEntity b) b.applyComponents();
		save();
	}

	public void setProperty(String name, Object value) {
		if (def == null) return;
		EntityDef.Property p = def.properties.get(name.toLowerCase(Locale.ROOT));
		if (p == null) return;
		Object v = p.coerce(value);
		Object old = properties.put(p.name, v);
		if (!v.equals(old)) { dirty = true; save(); }
	}

	public Object property(String name) {
		if (name == null) return null;
		String n = name.toLowerCase(Locale.ROOT);
		return properties.get(n);
	}

	/** The first time it ticks: minecraft:entity_spawned (Bedrock runs it when an entity is created) */
	void spawnedOnce(String spawnEvent) {
		if (spawned) return;
		spawned = true;
		if (entity.getPersistentData().getBoolean("jjka_born")) return;
		entity.getPersistentData().putBoolean("jjka_born", true);
		if (def != null && def.events.containsKey("minecraft:entity_spawned")) event("minecraft:entity_spawned");
		if (spawnEvent != null && !spawnEvent.equals("minecraft:entity_spawned")) event(spawnEvent);
		apply();
	}

	// ------------------------------------------------------------------ ticking (server)
	void tick() {
		if (def == null) return;
		Server.timers(this);
		Server.sensors(this);
		Server.controllers(this);
		apply();
	}

	// ------------------------------------------------------------------ Molang
	@Override public Object query(String name, Object[] args) { return Queries.query(entity, this, name, args); }

	@Override public Map<String, Object> vars(char kind) { return kind == 'v' ? variables : kind == 't' ? temps : context; }

	// ------------------------------------------------------------------ saving
	void save() {
		entity.getPersistentData().put("jjka", write());
	}

	CompoundTag write() {
		CompoundTag t = new CompoundTag();
		ListTag g = new ListTag();
		for (String s : groups) g.add(StringTag.valueOf(s));
		t.put("groups", g);
		CompoundTag p = new CompoundTag();
		for (var e : properties.entrySet()) {
			Object v = e.getValue();
			if (v instanceof Boolean b) p.putBoolean(e.getKey(), b);
			else if (v instanceof Integer i) p.putInt(e.getKey(), i);
			else if (v instanceof Number n) p.putDouble(e.getKey(), n.doubleValue());
			else p.putString(e.getKey(), String.valueOf(v));
		}
		t.put("properties", p);
		t.putInt("variant", variant);
		t.putInt("mark_variant", markVariant);
		t.putInt("skin_id", skinId);
		return t;
	}

	void load(CompoundTag t) {
		groups.clear();
		for (Tag s : t.getList("groups", Tag.TAG_STRING)) groups.add(s.getAsString());
		CompoundTag p = t.getCompound("properties");
		if (def != null) for (String k : p.getAllKeys()) {
			EntityDef.Property prop = def.properties.get(k);
			if (prop == null) continue;
			Tag v = p.get(k);
			properties.put(k, switch (prop.type) {
				case "bool" -> p.getBoolean(k);
				case "int" -> p.getInt(k);
				case "enum" -> p.getString(k);
				default -> p.getDouble(k);
			});
			if (v == null) properties.put(k, prop.def);
		}
		variant = t.getInt("variant");
		markVariant = t.getInt("mark_variant");
		skinId = t.getInt("skin_id");
		changed();
		spawned = true;
	}

	/** On the client: what the server says its groups and properties are */
	public void sync(List<String> gs, List<String[]> props, int v, int m, int skin) {
		groups.clear();
		groups.addAll(gs);
		for (String[] p : props) {
			EntityDef.Property def = this.def == null ? null : this.def.properties.get(p[0]);
			properties.put(p[0], def == null ? p[1] : def.coerce(p[1]));
		}
		variant = v; markVariant = m; skinId = skin;
		changed();
		if (entity instanceof BedrockEntity b) b.applyComponents();
	}

	/** A player respawning keeps what they had */
	public static void copy(Entity from, Entity to) {
		Actor a = of(from);
		CompoundTag t = a.write();
		to.getPersistentData().put("jjka", t);
		to.getPersistentData().putBoolean("jjka_born", true);
		synchronized (ACTORS) { ACTORS.remove(to); }
		Actor b = of(to);
		b.apply();
	}

	// ------------------------------------------------------------------ vanilla helpers
	static boolean monster(EntityType<?> t) { return t.getCategory() == MobCategory.MONSTER; }

	static boolean undead(Entity e) { return e instanceof LivingEntity l && l.getMobType() == MobType.UNDEAD; }

	static String key(EntityType<?> t) { var k = ForgeRegistries.ENTITY_TYPES.getKey(t); return k == null ? "" : k.toString(); }
}
