package com.jjka.bedrock;

import java.util.Locale;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.core.BlockPos;
import net.minecraft.world.Difficulty;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.Mob;
import net.minecraft.world.entity.OwnableEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.ItemStack;

/** Bedrock entity filters ({"test": ..., "subject": ..., "operator": ..., "value": ...} with all_of / any_of / none_of) */
public final class Filters {
	private Filters() {}

	/** Who the subjects are */
	public record Ctx(Entity self, Entity other, Entity target, Entity damager, Entity player) {
		public static Ctx of(Entity self) { return new Ctx(self, null, null, null, null); }

		Entity subject(String s) {
			return switch (s) {
				case "other" -> other;
				case "target" -> target != null ? target : self instanceof Mob m ? m.getTarget() : null;
				case "damager" -> damager;
				case "player" -> player;
				case "parent" -> self instanceof OwnableEntity o ? o.getOwner() : null;
				default -> self;
			};
		}
	}

	public static boolean test(JsonElement f, Ctx c) {
		if (f == null || f.isJsonNull()) return true;
		if (f.isJsonArray()) {
			for (JsonElement e : f.getAsJsonArray()) if (!test(e, c)) return false;
			return true;
		}
		if (!f.isJsonObject()) return true;
		JsonObject o = f.getAsJsonObject();
		if (o.has("all_of")) { if (!test(o.get("all_of"), c)) return false; }
		if (o.has("any_of")) {
			JsonElement a = o.get("any_of");
			boolean any = false;
			if (a.isJsonArray()) { for (JsonElement e : a.getAsJsonArray()) if (test(e, c)) { any = true; break; } }
			else any = test(a, c);
			if (!any) return false;
		}
		if (o.has("none_of")) {
			JsonElement a = o.get("none_of");
			if (a.isJsonArray()) { for (JsonElement e : a.getAsJsonArray()) if (test(e, c)) return false; }
			else if (test(a, c)) return false;
		}
		if (!o.has("test")) return true;
		return one(o, c);
	}

	private static boolean one(JsonObject o, Ctx c) {
		String test = o.get("test").getAsString().toLowerCase(Locale.ROOT);
		String subjectName = o.has("subject") ? o.get("subject").getAsString() : "self";
		Entity e = c.subject(subjectName);
		String op = o.has("operator") ? o.get("operator").getAsString() : "equals";
		JsonElement value = o.get("value");
		String domain = o.has("domain") ? o.get("domain").getAsString() : null;
		Object have;
		switch (test) {
			case "is_family" -> have = e != null && Actor.families(e).contains(str(value));
			case "has_tag" -> have = e != null && e.getTags().contains(str(value));
			case "has_component" -> have = e != null && Actor.hasComponent(e, Bedrock.id(str(value)));
			case "actor_health" -> have = e instanceof LivingEntity l ? (double) Math.round(l.getHealth()) : 0.0;
			case "is_sneaking" -> have = e != null && e.isShiftKeyDown();
			case "on_ground" -> have = e != null && e.onGround();
			case "in_water" -> have = e != null && e.isInWater();
			case "in_water_or_rain" -> have = e != null && e.isInWaterOrRain();
			case "in_lava" -> have = e != null && e.isInLava();
			case "is_underwater" -> have = e != null && e.isUnderWater();
			case "on_fire" -> have = e != null && e.isOnFire();
			case "is_riding" -> have = e != null && e.isPassenger();
			case "has_rider" -> have = e != null && e.isVehicle();
			case "has_target" -> have = e instanceof Mob m && m.getTarget() != null;
			case "is_target" -> have = e != null && c.self() instanceof Mob m && m.getTarget() == e;
			case "is_owner" -> have = e != null && c.self() instanceof OwnableEntity ow && ow.getOwner() == e;
			case "is_daytime" -> have = e != null && e.level().isDay();
			case "is_baby" -> have = e instanceof LivingEntity l && l.isBaby();
			case "is_moving" -> have = e != null && e.getDeltaMovement().horizontalDistanceSqr() > 1e-4;
			case "is_sprinting" -> have = e != null && e.isSprinting();
			case "is_climbing" -> have = e instanceof LivingEntity l && l.onClimbable();
			case "is_sitting" -> have = false;
			case "is_invisible" -> have = e != null && e.isInvisible();
			case "is_leashed" -> have = e instanceof Mob m && m.isLeashed();
			case "is_difficulty" -> have = e != null && difficulty(e.level().getDifficulty()).equals(str(value));
			case "is_variant" -> have = e != null ? (double) Actor.of(e).variant : 0.0;
			case "is_mark_variant" -> have = e != null ? (double) Actor.of(e).markVariant : 0.0;
			case "is_skin_id" -> have = e != null ? (double) Actor.of(e).skinId : 0.0;
			case "is_altitude" -> have = e != null ? Math.floor(e.getY()) : 0.0;
			case "is_brightness" -> have = e != null ? e.level().getMaxLocalRawBrightness(e.blockPosition()) / 15.0 : 0.0;
			case "is_underground" -> have = e != null && !e.level().canSeeSky(e.blockPosition());
			case "is_snow_covered", "is_raining" -> have = e != null && e.level().isRaining();
			case "is_temperature_value" -> have = e != null ? (double) e.level().getBiome(e.blockPosition()).value().getBaseTemperature() : 0.0;
			case "is_mob_effect", "has_mob_effect" -> have = e instanceof LivingEntity l && Effects.has(l, str(value));
			case "has_equipment" -> have = e instanceof LivingEntity l && equipment(l, domain, Bedrock.id(str(value)));
			case "distance_to_nearest_player" -> {
				Player p = e == null ? null : e.level().getNearestPlayer(e, -1);
				have = p == null ? Double.MAX_VALUE : (double) p.distanceTo(e);
			}
			case "random_chance" -> have = Math.random() * Math.max(1, num(value)) < 1;
			case "int_property", "float_property", "bool_property", "enum_property" -> {
				Object p = e == null ? null : Actor.of(e).property(domain);
				have = p instanceof Boolean b ? (Object) b : p instanceof String s ? s : p == null ? null : Molang.num(p);
				if (have == null) return false;
			}
			case "has_property" -> have = e != null && Actor.of(e).property(str(value)) != null;
			case "hourly_clock_time" -> have = e != null ? (double) (e.level().getDayTime() % 24000) : 0.0;
			case "moon_phase" -> have = e != null ? (double) e.level().getMoonPhase() : 0.0;
			case "is_block" -> {
				BlockPos pos = e == null ? null : e.blockPosition();
				have = pos != null && Blocks.matches(e.level().getBlockState(pos), str(value), null);
			}
			case "on_ladder" -> have = e instanceof LivingEntity l && l.onClimbable();
			case "is_panicking", "is_avoiding_mobs", "is_navigating", "is_persistent", "is_visible", "is_illager_captain",
					"has_ranged_weapon", "is_vehicle_family", "trusts", "in_caravan", "in_contact_with_water", "in_nether", "in_overworld",
					"is_in_village", "has_biome_tag", "has_ability", "has_damage", "has_container_open", "is_waterlogged", "is_sleeping",
					"inactivity_timer", "is_bound_to_creaking_heart", "rider_count", "surface_mob", "weather", "weather_at_position",
					"y_rotation", "target_distance", "light_level", "clock_time", "is_avoiding_block", "home_distance", "has_nametag",
					"any_slot_empty", "all_slots_empty", "has_silk_touch", "is_color", "has_trade_supply", "is_game_rule", "is_target_of" -> {
				have = misc(test, e, c, value, domain);
				if (have == null) return false;
			}
			default -> {
				Bedrock.warnOnce("filter", "Unsupported filter test: " + test);
				return false;
			}
		}
		return compare(have, op, value == null ? (have instanceof Boolean ? new com.google.gson.JsonPrimitive(true) : null) : value);
	}

	private static Object misc(String test, Entity e, Ctx c, JsonElement value, String domain) {
		return switch (test) {
			case "target_distance" -> {
				Entity t = c.subject("target");
				yield t == null || e == null ? Double.MAX_VALUE : (double) t.distanceTo(e);
			}
			case "has_nametag" -> e != null && e.hasCustomName();
			case "in_nether" -> e != null && e.level().dimension() == net.minecraft.world.level.Level.NETHER;
			case "in_overworld" -> e != null && e.level().dimension() == net.minecraft.world.level.Level.OVERWORLD;
			case "in_contact_with_water" -> e != null && e.isInWaterOrRain();
			case "is_persistent" -> e instanceof Mob m && m.isPersistenceRequired();
			case "is_visible" -> e != null && !e.isInvisible();
			case "light_level" -> e != null ? (double) e.level().getMaxLocalRawBrightness(e.blockPosition()) : 0.0;
			case "is_game_rule" -> e != null && Commands.gameRule(e.level().getServer(), domain);
			case "y_rotation" -> e != null ? (double) e.getYRot() : 0.0;
			case "is_sleeping" -> e instanceof LivingEntity l && l.isSleeping();
			default -> false;
		};
	}

	static boolean equipment(LivingEntity l, String domain, String item) {
		String d = domain == null ? "any" : domain;
		java.util.function.Predicate<ItemStack> is = s -> !s.isEmpty() && Items.idOf(s).equals(item);
		return switch (d) {
			case "hand" -> is.test(l.getItemBySlot(EquipmentSlot.MAINHAND)) || is.test(l.getItemBySlot(EquipmentSlot.OFFHAND));
			case "head" -> is.test(l.getItemBySlot(EquipmentSlot.HEAD));
			case "torso" -> is.test(l.getItemBySlot(EquipmentSlot.CHEST));
			case "leg" -> is.test(l.getItemBySlot(EquipmentSlot.LEGS));
			case "feet" -> is.test(l.getItemBySlot(EquipmentSlot.FEET));
			case "armor" -> is.test(l.getItemBySlot(EquipmentSlot.HEAD)) || is.test(l.getItemBySlot(EquipmentSlot.CHEST))
					|| is.test(l.getItemBySlot(EquipmentSlot.LEGS)) || is.test(l.getItemBySlot(EquipmentSlot.FEET));
			default -> {
				for (EquipmentSlot s : EquipmentSlot.values()) if (is.test(l.getItemBySlot(s))) yield true;
				yield l instanceof Player p && Items.has(p, item, null, -1);
			}
		};
	}

	private static String difficulty(Difficulty d) {
		return switch (d) { case PEACEFUL -> "peaceful"; case EASY -> "easy"; case NORMAL -> "normal"; case HARD -> "hard"; };
	}

	private static String str(JsonElement v) {
		return v == null || v.isJsonNull() ? "" : v.isJsonPrimitive() ? v.getAsString().toLowerCase(Locale.ROOT) : v.toString();
	}

	private static double num(JsonElement v) {
		try { return v == null ? 0 : v.getAsDouble(); } catch (RuntimeException e) { return 0; }
	}

	private static boolean compare(Object have, String op, JsonElement want) {
		if (have instanceof Boolean b) {
			boolean w = want == null || (want.isJsonPrimitive() && (want.getAsJsonPrimitive().isBoolean() ? want.getAsBoolean() : !want.getAsString().equals("0") && !want.getAsString().equalsIgnoreCase("false")));
			boolean eq = b == w;
			return switch (op) { case "!=", "not", "<>" -> !eq; default -> eq; };
		}
		if (have instanceof String s) {
			boolean eq = s.equalsIgnoreCase(str(want));
			return switch (op) { case "!=", "not", "<>" -> !eq; default -> eq; };
		}
		double h = Molang.num(have), w;
		if (want != null && want.isJsonPrimitive() && want.getAsJsonPrimitive().isBoolean()) w = want.getAsBoolean() ? 1 : 0;
		else w = num(want);
		return switch (op) {
			case "!=", "not", "<>" -> h != w;
			case "<" -> h < w;
			case "<=" -> h <= w;
			case ">" -> h > w;
			case ">=" -> h >= w;
			default -> h == w;
		};
	}
}
