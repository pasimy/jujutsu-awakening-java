package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.damagesource.DamageTypes;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraftforge.event.TickEvent;
import net.minecraftforge.event.entity.EntityLeaveLevelEvent;
import net.minecraftforge.event.entity.living.LivingAttackEvent;
import net.minecraftforge.event.entity.living.LivingHurtEvent;
import net.minecraftforge.event.entity.player.PlayerEvent;
import net.minecraftforge.event.entity.player.PlayerInteractEvent;
import net.minecraftforge.event.server.ServerStartingEvent;
import net.minecraftforge.eventbus.api.EventPriority;
import net.minecraftforge.eventbus.api.SubscribeEvent;

/** Glue between Forge and the runtime: the server tick, item use, damage sensors, timers, sensors, controllers, syncing */
public final class Server {
	private Server() {}

	// ------------------------------------------------------------------ server tick
	private static final Set<UUID> USED = new HashSet<>();
	private static final Map<UUID, String> USED_ITEM = new HashMap<>();
	private static final List<String[]> TAGGED = new ArrayList<>();

	@SubscribeEvent
	public static void starting(ServerStartingEvent e) {
		Scores.reset();
		Scripts.reset();
		USED.clear();
		USED_ITEM.clear();
		TAGGED.clear();
		Functions.load();
		Scores.get(e.getServer());
	}

	@SubscribeEvent
	public static void tick(TickEvent.ServerTickEvent e) {
		if (e.phase != TickEvent.Phase.END) return;
		MinecraftServer server = e.getServer();
		Scores.get(server);
		// item use: the add-on's script tags the player "itemUse" and "itemUse:<item>" for one tick
		List<String[]> tagged = new ArrayList<>();
		for (UUID id : USED) {
			ServerPlayer p = server.getPlayerList().getPlayer(id);
			if (p == null) continue;
			String item = USED_ITEM.get(id);
			p.addTag("itemUse");
			tagged.add(new String[] { id.toString(), "itemUse" });
			if (item != null) { p.addTag("itemUse:" + item); tagged.add(new String[] { id.toString(), "itemUse:" + item }); }
		}
		USED.clear();
		USED_ITEM.clear();
		macros(server);
		if (server.getTickCount() % 20 == 0) for (ServerPlayer p : server.getPlayerList().getPlayers()) styles(p);
		Queries.PRESS_JUMP.replaceAll((k, v) -> v - 1);
		Queries.PRESS_JUMP.values().removeIf(v -> v < 0);
		Queries.PRESS_SNEAK.replaceAll((k, v) -> v - 1);
		Queries.PRESS_SNEAK.values().removeIf(v -> v < 0);
		for (ServerPlayer p : server.getPlayerList().getPlayers()) {
			Actor a = Actor.of(p);
			a.variables.put("attack_time", Queries.PRESS_LEFT.getOrDefault(p.getUUID(), 0) > 0 ? 0.6 : (double) p.getAttackAnim(1f));
			a.tick();
		}
		try { Functions.tick(server); } catch (Throwable t) { Bedrock.warnOnce("tick", "Tick functions failed: " + t); }
		try { Scripts.tick(server); } catch (Throwable t) { Bedrock.warnOnce("tick", "Scripts failed: " + t); }
		menuPages(server);
		for (String[] t : TAGGED) {
			ServerPlayer p = server.getPlayerList().getPlayer(UUID.fromString(t[0]));
			if (p != null) p.removeTag(t[1]);
		}
		TAGGED.clear();
		TAGGED.addAll(tagged);
		// properties / groups that changed go to the clients
		for (ServerLevel l : server.getAllLevels()) for (Entity en : l.getAllEntities()) {
			Actor a = Actor.peek(en);
			if (a != null && a.dirty) { a.dirty = false; Net.actor(en, null); }
		}
	}

	/** Using the selected technique (or a real add-on item) */
	public static void use(ServerPlayer p, String item) {
		if ("ds:settings".equals(item)) JjkaCommand.menu(p);
		USED.add(p.getUUID());
		if (item != null) USED_ITEM.put(p.getUUID(), item);
	}

	@SubscribeEvent
	public static void rightClick(PlayerInteractEvent.RightClickItem e) {
		if (e.getEntity() instanceof ServerPlayer p && e.getItemStack().getItem() instanceof Items.BedrockItem b) use(p, b.id);
	}

	static void barChoice(ServerPlayer p, int selected, boolean on, String style) {
		Items.Bar b = Items.bar(p);
		if (style != null && !style.isEmpty() && b.items.contains(style)) b.style = style;
		b.selected = Math.max(0, Math.min(Math.max(0, b.items.size() - 1), selected));
		b.on = on;
		Items.saveBar(p);
	}

	private static final Set<UUID> FROZEN = new HashSet<>();

	static void input(ServerPlayer p, boolean jump, boolean use, boolean attack, boolean right) {
		Queries.JUMPING.put(p.getUUID(), jump);
		// the add-on's menu is driven by jump (select) and sneak (next); on Java, left / right click do the same
		if (p.getTags().contains("menu")) {
			if (attack) Queries.PRESS_JUMP.put(p.getUUID(), 3);
			if (right) Queries.PRESS_SNEAK.put(p.getUUID(), 3);
		}
		// right click: your fighting style's moves (Bedrock: right clicking the style item, with sneak / jump)
		if (use) {
			String style = style(p);
			if (style != null) hold(p, style, 4, () -> use(p, style));
		}
	}

	/** A fighting style in the real inventory (given before, or by a give without a lock) moves onto the bar */
	private static void styles(ServerPlayer p) {
		var inv = p.getInventory();
		for (int i = 0; i < inv.getContainerSize(); i++) {
			if (!(inv.getItem(i).getItem() instanceof Items.BedrockItem b) || !Items.style(b.id)) continue;
			inv.setItem(i, net.minecraft.world.item.ItemStack.EMPTY);
			Items.Bar bar = Items.bar(p);
			if (!bar.items.contains(b.id)) bar.items.add(b.id);
			bar.style = b.id;
			Items.saveBar(p);
		}
	}

	static String style(ServerPlayer p) { return Items.bar(p).activeStyle(); }

	// ------------------------------------------------------------------ move keys: fake a move's inputs, then use the item
	private record Step(int[] delay, Runnable run) {}

	private static final Map<UUID, List<Step>> MACROS = new HashMap<>();

	private static void later(ServerPlayer p, int ticks, Runnable r) { MACROS.computeIfAbsent(p.getUUID(), k -> new ArrayList<>()).add(new Step(new int[] { ticks }, r)); }

	/** pretend the item is in hand for a few ticks, using it now */
	private static void hold(ServerPlayer p, String item, int ticks, Runnable then) {
		Items.FORCED.put(p.getUUID(), new Object[] { item, ticks });
		then.run();
	}

	static void press(ServerPlayer p, String kind, int index) {
		UUID id = p.getUUID();
		if (kind.equals("dash")) {
			if (Items.has(p, "ds:dash", null, -1)) hold(p, "ds:dash", 4, () -> use(p, "ds:dash"));
			return;
		}
		Items.Bar bar = Items.bar(p);
		if (bar.selected < 0 || bar.selected >= bar.items.size()) return;
		String tech = bar.items.get(bar.selected);
		List<Moves.Move> moves = Moves.of(tech);
		if (index < 0 || index >= moves.size()) return;
		Moves.Move m = moves.get(index);
		int t = 6;
		if (m.sneak()) Queries.PRESS_SNEAK.put(id, t);
		if (m.jump()) Queries.PRESS_JUMP.put(id, t);
		if (m.sprint()) Queries.PRESS_SPRINT.put(id, t);
		Queries.PITCH.put(id, new float[] { m.lookDown() ? 85 : m.lookUp() ? -85 : Math.max(-60, Math.min(60, p.getXRot())), t + 2 });
		Items.FORCED.put(id, new Object[] { tech, t + 4 });
		if (m.doubleSneak()) {
			Queries.PRESS_SNEAK.put(id, 2);
			later(p, 4, () -> Queries.PRESS_SNEAK.put(id, 4));
		}
		// a tick for the add-on to see the held keys, then the click
		later(p, m.doubleSneak() ? 6 : 2, () -> {
			if (m.punch()) { Queries.PRESS_LEFT.put(id, 3); p.swing(net.minecraft.world.InteractionHand.MAIN_HAND, true); }
			else use(p, tech);
		});
	}

	private static void macros(MinecraftServer server) {
		for (var en : new ArrayList<>(MACROS.entrySet())) {
			ServerPlayer p = server.getPlayerList().getPlayer(en.getKey());
			if (p == null) { MACROS.remove(en.getKey()); continue; }
			List<Step> ready = new ArrayList<>();
			en.getValue().removeIf(s -> { if (--s.delay[0] <= 0) { ready.add(s); return true; } return false; });
			for (Step s : ready) s.run.run();
			if (en.getValue().isEmpty()) MACROS.remove(en.getKey());
		}
		for (var m : List.of(Queries.PRESS_SPRINT, Queries.PRESS_LEFT)) { m.replaceAll((k, v) -> v - 1); m.values().removeIf(v -> v < 0); }
		Queries.PITCH.values().forEach(v -> v[1]--);
		Queries.PITCH.values().removeIf(v -> v[1] < 0);
		Items.FORCED.values().forEach(v -> v[1] = (Integer) v[1] - 1);
		Items.FORCED.values().removeIf(v -> (Integer) v[1] < 0);
	}

	// ------------------------------------------------------------------ the start menu, clickable
	private static final String[] PAGES = { "menufinal", "menutechnique", "menutraits", "menuclans", "menurace", "menuhelp", "menucredits", "menuhome", "menuintro", "startscreen" };
	private static final Map<UUID, String> PAGE = new HashMap<>();

	private static void menuPages(MinecraftServer server) {
		for (ServerPlayer p : server.getPlayerList().getPlayers()) {
			String page = "";
			if (p.getTags().contains("menu")) {
				page = "menu";
				for (String t : PAGES) if (p.getTags().contains(t)) { page = t; break; }
			}
			if (!page.equals(PAGE.get(p.getUUID()))) {
				PAGE.put(p.getUUID(), page);
				String pg = page;
				Net.CHANNEL.send(net.minecraftforge.network.PacketDistributor.PLAYER.with(() -> p), new Net.Menu(pg, 0, ""));
			}
		}
		PAGE.keySet().removeIf(id -> server.getPlayerList().getPlayer(id) == null);
	}

	static void menu(ServerPlayer p, int scroll, String press) {
		if (!p.getTags().contains("menu")) return;
		Scores s = Scores.get(p.getServer());
		if (scroll > 0 && s.getOr(p, "menuscroll", 0) != scroll) s.set(p, "menuscroll", scroll);
		if (press.equals("select")) Queries.PRESS_JUMP.put(p.getUUID(), 3);
		if (press.equals("next")) Queries.PRESS_SNEAK.put(p.getUUID(), 3);
	}

	static void frozen(ServerPlayer p, boolean frozen) { if (frozen) FROZEN.add(p.getUUID()); else FROZEN.remove(p.getUUID()); }

	@SubscribeEvent
	public static void playerTick(TickEvent.PlayerTickEvent e) {
		if (e.phase != TickEvent.Phase.START || e.player.level().isClientSide) return;
		if (FROZEN.contains(e.player.getUUID())) e.player.setDeltaMovement(0, Math.min(0, e.player.getDeltaMovement().y), 0);
	}

	// ------------------------------------------------------------------ players coming and going
	@SubscribeEvent
	public static void loggedIn(PlayerEvent.PlayerLoggedInEvent e) {
		if (e.getEntity() instanceof ServerPlayer p) {
			Items.saveBar(p);
			Actor.of(p).dirty = true;
		}
	}

	@SubscribeEvent
	public static void tracking(PlayerEvent.StartTracking e) {
		if (e.getEntity() instanceof ServerPlayer p && Actor.peek(e.getTarget()) != null) Net.actor(e.getTarget(), p);
	}

	@SubscribeEvent
	public static void clone(PlayerEvent.Clone e) {
		Player old = e.getOriginal(), now = e.getEntity();
		old.reviveCaps();
		Actor.copy(old, now);
		Items.copyBar(old, now);
		for (String t : old.getTags()) now.addTag(t);
		old.invalidateCaps();
	}

	@SubscribeEvent
	public static void respawn(PlayerEvent.PlayerRespawnEvent e) {
		if (e.getEntity() instanceof ServerPlayer p) { Items.saveBar(p); Actor.of(p).dirty = true; Scripts.respawned(p); }
	}

	@SubscribeEvent
	public static void left(EntityLeaveLevelEvent e) {
		if (e.getLevel().isClientSide()) return;
		Entity en = e.getEntity();
		if (en instanceof Player) return;
		Entity.RemovalReason why = en.getRemovalReason();
		if (why != null && why.shouldDestroy() && Scores.current() != null) Scores.current().forget(en.getUUID());
	}

	// ------------------------------------------------------------------ damage sensor
	public record Sensed(boolean deals, float amount) {}

	/** Bedrock's name for what hurt it */
	static String cause(DamageSource s) {
		String forced = Commands.CAUSE.get();
		if (forced != null) return forced;
		if (s.is(DamageTypes.EXPLOSION) || s.is(DamageTypes.PLAYER_EXPLOSION)) return s.getEntity() != null ? "entity_explosion" : "block_explosion";
		if (s.is(DamageTypes.FALL)) return "fall";
		if (s.is(DamageTypes.IN_FIRE)) return "fire";
		if (s.is(DamageTypes.ON_FIRE)) return "fire_tick";
		if (s.is(DamageTypes.LAVA)) return "lava";
		if (s.is(DamageTypes.DROWN)) return "drowning";
		if (s.is(DamageTypes.IN_WALL)) return "suffocation";
		if (s.is(DamageTypes.MAGIC) || s.is(DamageTypes.INDIRECT_MAGIC)) return "magic";
		if (s.is(DamageTypes.WITHER)) return "wither";
		if (s.is(DamageTypes.FELL_OUT_OF_WORLD)) return "void";
		if (s.is(DamageTypes.LIGHTNING_BOLT)) return "lightning";
		if (s.is(DamageTypes.FREEZE)) return "freezing";
		if (s.is(DamageTypes.CACTUS) || s.is(DamageTypes.SWEET_BERRY_BUSH)) return "contact";
		if (s.is(DamageTypes.STARVE)) return "starve";
		if (s.is(DamageTypes.THORNS)) return "thorns";
		if (s.is(DamageTypes.ARROW) || s.is(DamageTypes.TRIDENT) || s.is(DamageTypes.MOB_PROJECTILE) || s.is(DamageTypes.FIREBALL)) return "projectile";
		if (s.is(DamageTypes.GENERIC_KILL)) return "void";
		if (s.getEntity() != null) return "entity_attack";
		return "none";
	}

	public static Sensed damageSensor(Actor a, DamageSource source, float amount) {
		JsonObject ds = a.component("minecraft:damage_sensor");
		if (ds == null || source.is(DamageTypes.GENERIC_KILL) || source.is(DamageTypes.FELL_OUT_OF_WORLD) && Commands.CAUSE.get() == null) return new Sensed(true, amount);
		JsonElement triggers = ds.get("triggers");
		List<JsonObject> list = new ArrayList<>();
		if (triggers == null) return new Sensed(true, amount);
		if (triggers.isJsonArray()) for (JsonElement t : triggers.getAsJsonArray()) list.add(t.getAsJsonObject());
		else if (triggers.isJsonObject()) list.add(triggers.getAsJsonObject());
		String cause = cause(source);
		Entity damager = source.getEntity();
		Filters.Ctx ctx = new Filters.Ctx(a.entity, damager, null, damager, damager instanceof Player ? damager : null);
		for (JsonObject t : list) {
			String c = t.has("cause") ? t.get("cause").getAsString() : "all";
			if (!c.equals("all") && !c.equals(cause)) continue;
			JsonObject onDamage = t.has("on_damage") && t.get("on_damage").isJsonObject() ? t.getAsJsonObject("on_damage") : null;
			JsonElement filters = onDamage != null && onDamage.has("filters") ? onDamage.get("filters") : t.get("filters");
			if (filters != null && !Filters.test(filters, ctx)) continue;
			if (onDamage != null && onDamage.has("event")) {
				String target = onDamage.has("target") ? onDamage.get("target").getAsString() : "self";
				Entity who = ctx.subject(target);
				if (who != null) Actor.of(who).event(onDamage.get("event").getAsString(), ctx);
			}
			float amt = amount;
			if (t.has("damage_multiplier")) amt *= t.get("damage_multiplier").getAsFloat();
			if (t.has("damage_modifier")) amt += t.get("damage_modifier").getAsFloat();
			boolean deals = true;
			if (t.has("deals_damage")) {
				JsonElement d = t.get("deals_damage");
				deals = d.isJsonPrimitive() && d.getAsJsonPrimitive().isBoolean() ? d.getAsBoolean() : d.getAsString().equals("yes");
			}
			return new Sensed(deals, amt);
		}
		return new Sensed(true, amount);
	}

	/** Players have the add-on's player.json damage sensor too */
	@SubscribeEvent(priority = EventPriority.HIGH)
	public static void playerAttacked(LivingAttackEvent e) {
		if (!(e.getEntity() instanceof ServerPlayer p)) return;
		Actor a = Actor.of(p);
		if (a.def == null) return;
		Sensed s = damageSensor(a, e.getSource(), e.getAmount());
		if (!s.deals()) e.setCanceled(true);
	}

	@SubscribeEvent
	public static void hurt(LivingHurtEvent e) {
		LivingEntity l = e.getEntity();
		if (l.level().isClientSide) return;
		// Bedrock's damage sensors fire on hurt; the add-on also reads detect_health through its controllers
	}

	// ------------------------------------------------------------------ timers / sensors / controllers
	static void timers(Actor a) {
		JsonObject comps = a.components();
		for (var c : comps.entrySet()) {
			if (!c.getKey().equals("minecraft:timer") || !c.getValue().isJsonObject()) continue;
			JsonObject t = c.getValue().getAsJsonObject();
			Integer left = a.timers.get("timer");
			if (left == null) {
				double secs;
				if (t.has("random_time_choices")) {
					JsonArray ch = t.getAsJsonArray("random_time_choices");
					JsonElement pick = ch.get((int) (Math.random() * ch.size()));
					secs = pick.isJsonObject() ? pick.getAsJsonObject().get("value").getAsDouble() : pick.getAsDouble();
				} else if (t.has("time") && t.get("time").isJsonArray()) secs = BedrockEntity.range(t.get("time"));
				else secs = t.has("time") ? t.get("time").getAsDouble() : 0;
				if (t.has("randomInterval") && t.get("randomInterval").getAsBoolean() && !t.get("time").isJsonArray()) secs = Math.random() * secs;
				left = (int) Math.round(secs * 20);
			}
			left--;
			if (left <= 0) {
				boolean loop = !t.has("looping") || t.get("looping").getAsBoolean();
				a.timers.remove("timer");
				if (!loop) a.timers.put("timer", Integer.MAX_VALUE);
				JsonElement ev = t.get("time_down_event");
				if (ev != null && ev.isJsonObject() && ev.getAsJsonObject().has("event")) a.event(ev.getAsJsonObject().get("event").getAsString());
				return;
			}
			a.timers.put("timer", left);
		}
		if (!comps.has("minecraft:timer")) a.timers.remove("timer");
	}

	static void sensors(Actor a) {
		JsonObject s = a.component("minecraft:environment_sensor");
		if (s == null) return;
		JsonElement triggers = s.get("triggers");
		if (triggers == null) return;
		List<JsonObject> list = new ArrayList<>();
		if (triggers.isJsonArray()) for (JsonElement t : triggers.getAsJsonArray()) list.add(t.getAsJsonObject());
		else list.add(triggers.getAsJsonObject());
		Filters.Ctx ctx = Filters.Ctx.of(a.entity);
		for (JsonObject t : list) {
			if (!t.has("event")) continue;
			if (Filters.test(t.get("filters"), ctx)) a.event(t.get("event").getAsString(), ctx);
		}
	}

	private static Map<String, JsonObject> bpControllers;

	static synchronized JsonObject controller(String name) {
		if (bpControllers == null) {
			bpControllers = new HashMap<>();
			for (String f : Bedrock.list("bp/animation_controllers/", ".json")) {
				JsonObject j = Bedrock.json(f);
				if (j == null || !j.has("animation_controllers")) continue;
				for (var c : j.getAsJsonObject("animation_controllers").entrySet()) if (c.getValue().isJsonObject()) bpControllers.put(c.getKey(), c.getValue().getAsJsonObject());
			}
		}
		return bpControllers.get(name);
	}

	static void controllers(Actor a) {
		if (a.def.animate.isEmpty()) return;
		for (String key : a.def.animate) {
			String name = a.def.animations.get(key);
			if (name == null || !name.startsWith("controller.")) continue;
			JsonObject c = controller(name);
			if (c == null || !c.has("states")) continue;
			JsonObject states = c.getAsJsonObject("states");
			String cur = a.controllers.get(name);
			if (cur == null) {
				cur = c.has("initial_state") ? c.get("initial_state").getAsString() : "default";
				a.controllers.put(name, cur);
				run(a, states.getAsJsonObject(cur), "on_entry");
			}
			JsonObject st = states.getAsJsonObject(cur);
			if (st == null || !st.has("transitions")) continue;
			for (JsonElement tr : st.getAsJsonArray("transitions")) {
				if (!tr.isJsonObject()) continue;
				var en = tr.getAsJsonObject().entrySet().iterator().next();
				if (!Molang.truth(Molang.of(en.getValue()).eval(a))) continue;
				String next = en.getKey();
				if (!states.has(next)) break;
				run(a, st, "on_exit");
				a.controllers.put(name, next);
				run(a, states.getAsJsonObject(next), "on_entry");
				break;
			}
		}
	}

	private static void run(Actor a, JsonObject state, String key) {
		if (state == null || !state.has(key)) return;
		for (JsonElement x : state.getAsJsonArray(key)) {
			String s = x.getAsString().trim();
			if (s.startsWith("/")) Commands.runAs(a.entity, s.substring(1));
			else if (s.startsWith("@s ")) a.event(s.substring(3).trim());
			else Molang.compile(s).eval(a);
		}
	}
}
