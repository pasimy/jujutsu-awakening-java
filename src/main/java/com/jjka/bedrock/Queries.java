package com.jjka.bedrock;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.Mob;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.ItemStack;

/** Molang queries about an entity, shared by the server (behaviour controllers, events) and the client (rendering) */
public final class Queries {
	private Queries() {}

	/** Inputs Java's server doesn't know on its own, sent up by each client: jump held */
	public static final Map<java.util.UUID, Boolean> JUMPING = new ConcurrentHashMap<>();
	/** a click standing in for a jump / sneak (the menu), ticks left */
	public static final Map<java.util.UUID, Integer> PRESS_JUMP = new ConcurrentHashMap<>(), PRESS_SNEAK = new ConcurrentHashMap<>(),
			PRESS_SPRINT = new ConcurrentHashMap<>(), PRESS_LEFT = new ConcurrentHashMap<>();
	/** a pitch to pretend the player is looking at, for "look up / down" moves: {pitch, ticks} */
	public static final Map<java.util.UUID, float[]> PITCH = new ConcurrentHashMap<>();

	public static float pitch(Entity e) {
		float[] p = PITCH.get(e.getUUID());
		return p != null && p[1] > 0 ? p[0] : e.getXRot();
	}

	public static Object query(Entity e, Actor a, String name, Object[] args) {
		LivingEntity l = e instanceof LivingEntity le ? le : null;
		switch (name.toLowerCase(Locale.ROOT)) {
			case "is_sneaking": return e.isShiftKeyDown() || e.isCrouching() || PRESS_SNEAK.getOrDefault(e.getUUID(), 0) > 0;
			case "is_jumping":
				if (e instanceof Player p) return JUMPING.getOrDefault(p.getUUID(), false) || PRESS_JUMP.getOrDefault(p.getUUID(), 0) > 0 || !p.onGround() && p.getDeltaMovement().y > 0.05;
				return l != null && !l.onGround() && l.getDeltaMovement().y > 0;
			case "is_using_item": return l != null && l.isUsingItem();
			case "is_sprinting": return e.isSprinting() || PRESS_SPRINT.getOrDefault(e.getUUID(), 0) > 0;
			case "is_alive": return e.isAlive();
			case "health": return l != null ? (double) (float) Math.ceil(l.getHealth()) : 0.0;
			case "max_health": return l != null ? (double) l.getMaxHealth() : 0.0;
			case "is_on_ground": case "is_grounded": return e.onGround();
			case "is_in_water": return e.isInWater();
			case "is_in_water_or_rain": return e.isInWaterOrRain();
			case "is_in_lava": return e.isInLava();
			case "is_on_fire": case "is_onfire": return e.isOnFire();
			case "is_riding": return e.isPassenger();
			case "has_rider": return e.isVehicle();
			case "is_baby": return l != null && l.isBaby();
			case "is_moving": return e.getDeltaMovement().horizontalDistanceSqr() > 1e-5;
			case "is_swimming": return e.isSwimming();
			case "is_gliding": return l != null && l.isFallFlying();
			case "is_sleeping": return l != null && l.isSleeping();
			case "is_invisible": return e.isInvisible();
			case "is_angry": return e instanceof Mob m && m.getTarget() != null;
			case "has_target": return e instanceof Mob m && m.getTarget() != null;
			case "is_attacking": return l != null && l.swinging;
			case "is_delayed_attacking": return l != null && l.swinging;
			case "is_charging": return false;
			case "is_levitating": return l != null && l.hasEffect(net.minecraft.world.effect.MobEffects.LEVITATION);
			case "is_spectator": return e.isSpectator();
			case "is_first_person": return false;
			case "variant": return (double) (a == null ? 0 : a.variant);
			case "mark_variant": return (double) (a == null ? 0 : a.markVariant);
			case "skin_id": return (double) (a == null ? 0 : a.skinId);
			case "property": case "actor_property": {
				Object v = a == null || args.length == 0 ? null : a.property(String.valueOf(args[0]));
				return v instanceof Boolean b ? (b ? 1.0 : 0.0) : v instanceof Number n ? n.doubleValue() : v;
			}
			case "has_property": return a != null && args.length > 0 && a.property(String.valueOf(args[0])) != null;
			case "modified_move_speed": case "ground_speed": return e.getDeltaMovement().horizontalDistance() * 20;
			case "vertical_speed": return e.getDeltaMovement().y * 20;
			case "modified_distance_moved": return (double) e.walkDist * 1.0;
			case "walk_distance": return (double) e.walkDist;
			case "body_y_rotation": return l != null ? (double) l.yBodyRot : (double) e.getYRot();
			case "head_y_rotation": return (double) e.getYHeadRot();
			case "head_x_rotation": return (double) e.getXRot();
			case "target_x_rotation": return (double) e.getXRot();
			case "target_y_rotation": return (double) e.getYHeadRot();
			case "yaw_speed": return (double) (e.getYRot() - e.yRotO) * 20;
			case "life_time": return e.tickCount / 20.0;
			case "time_of_day": return (e.level().getDayTime() % 24000) / 24000.0;
			case "day": return (double) (e.level().getDayTime() / 24000);
			case "moon_phase": return (double) e.level().getMoonPhase();
			case "player_level": return e instanceof Player p ? (double) p.experienceLevel : 0.0;
			case "scale": return e instanceof BedrockEntity b ? (double) b.scale() : 1.0;
			case "get_name": return e.hasCustomName() ? e.getCustomName().getString() : e instanceof Player p ? p.getGameProfile().getName() : "";
			case "is_name_any": {
				String n = e.hasCustomName() ? e.getCustomName().getString() : "";
				for (Object o : args) if (n.equalsIgnoreCase(String.valueOf(o))) return true;
				return false;
			}
			case "is_item_name_any": case "is_item_equipped": {
				if (l == null) return false;
				String slot = args.length > 0 ? String.valueOf(args[0]) : "slot.weapon.mainhand";
				ItemStack s = slot.contains("offhand") ? l.getItemBySlot(EquipmentSlot.OFFHAND) : e instanceof Player p ? Items.mainhand(p) : l.getMainHandItem();
				if (name.equalsIgnoreCase("is_item_equipped")) return !s.isEmpty();
				String id = Items.idOf(s);
				for (int k = 2; k < args.length; k++) if (id.equalsIgnoreCase(Bedrock.id(String.valueOf(args[k])))) return true;
				for (int k = 1; k < args.length; k++) if (args[k] instanceof String str && id.equalsIgnoreCase(Bedrock.id(str))) return true;
				return false;
			}
			case "equipped_item_any_tag": return false;
			case "is_alive_and_not_dying": return e.isAlive();
			case "hurt_time": return l != null ? (double) l.hurtTime : 0.0;
			case "is_hurt": case "hurt_direction": return l != null && l.hurtTime > 0;
			case "all_animations_finished": case "any_animation_finished": return true;
			case "is_first_person_view": return false;
			case "distance_from_camera": return 0.0;
			case "rider_body_y_rotation": return e.getVehicle() instanceof LivingEntity v ? (double) v.yBodyRot : 0.0;
			case "is_tamed": return a != null && a.has("minecraft:is_tamed");
			case "position": {
				int axis = args.length > 0 ? (int) Molang.num(args[0]) : 0;
				return axis == 0 ? e.getX() : axis == 1 ? e.getY() : e.getZ();
			}
			case "position_delta": {
				int axis = args.length > 0 ? (int) Molang.num(args[0]) : 0;
				var d = e.getDeltaMovement();
				return axis == 0 ? d.x : axis == 1 ? d.y : d.z;
			}
			case "is_selected_item": return false;
			case "time_stamp": return (double) e.level().getGameTime();
			case "eye_target_x_rotation": return (double) e.getXRot();
			case "eye_target_y_rotation": return (double) e.getYHeadRot();
			case "cardinal_facing_2d": return (double) e.getDirection().get3DDataValue();
			case "main_hand_item_use_duration": return l != null ? (double) l.getTicksUsingItem() / 20.0 : 0.0;
			case "count": return 1.0;
			default: return null;
		}
	}
}
