package com.jjka.bedrock;

import java.util.Locale;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.effect.MobEffect;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.LivingEntity;
import net.minecraftforge.registries.ForgeRegistries;

/** Bedrock effect names */
public final class Effects {
	private Effects() {}

	public static MobEffect get(String name) {
		String n = name.toLowerCase(Locale.ROOT).replace("minecraft:", "");
		return switch (n) {
			case "slowness" -> MobEffects.MOVEMENT_SLOWDOWN;
			case "speed" -> MobEffects.MOVEMENT_SPEED;
			case "haste" -> MobEffects.DIG_SPEED;
			case "mining_fatigue" -> MobEffects.DIG_SLOWDOWN;
			case "strength" -> MobEffects.DAMAGE_BOOST;
			case "instant_health" -> MobEffects.HEAL;
			case "instant_damage" -> MobEffects.HARM;
			case "jump_boost" -> MobEffects.JUMP;
			case "nausea" -> MobEffects.CONFUSION;
			case "resistance" -> MobEffects.DAMAGE_RESISTANCE;
			case "fatal_poison" -> MobEffects.POISON;
			case "village_hero" -> MobEffects.HERO_OF_THE_VILLAGE;
			default -> {
				ResourceLocation rl = ResourceLocation.tryParse("minecraft:" + n);
				yield rl != null && ForgeRegistries.MOB_EFFECTS.containsKey(rl) ? ForgeRegistries.MOB_EFFECTS.getValue(rl) : null;
			}
		};
	}

	public static boolean has(LivingEntity l, String name) {
		MobEffect m = get(name);
		return m != null && l.hasEffect(m);
	}
}
