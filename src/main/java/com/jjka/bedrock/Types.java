package com.jjka.bedrock;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.MobCategory;
import net.minecraft.world.entity.MobType;
import net.minecraft.world.entity.animal.Animal;
import net.minecraft.world.entity.monster.Enemy;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.entity.projectile.Projectile;
import net.minecraft.world.entity.raid.Raider;
import net.minecraftforge.registries.ForgeRegistries;

/** Bedrock entity ids and families for vanilla entities, and finding the Java type for a Bedrock id */
public final class Types {
	private Types() {}

	/** Bedrock name -> Java name, where they differ */
	private static final Map<String, String> TO_JAVA = new HashMap<>();
	private static final Map<String, String> TO_BEDROCK = new HashMap<>();

	static {
		pair("xp_orb", "experience_orb");
		pair("thrown_trident", "trident");
		pair("fireworks_rocket", "firework_rocket");
		pair("splash_potion", "potion");
		pair("lingering_potion", "potion");
		pair("xp_bottle", "experience_bottle");
		pair("ender_crystal", "end_crystal");
		pair("evocation_illager", "evoker");
		pair("evocation_fang", "evoker_fangs");
		pair("zombie_pigman", "zombified_piglin");
		pair("villager_v2", "villager");
		pair("zombie_villager_v2", "zombie_villager");
		pair("snow_golem", "snow_golem");
		pair("leash_knot", "leash_knot");
		pair("fishing_hook", "fishing_bobber");
		pair("lightning_bolt", "lightning_bolt");
		pair("tnt", "tnt");
		pair("tnt_minecart", "tnt_minecart");
		pair("chest_boat", "chest_boat");
		pair("mooshroom", "mooshroom");
		pair("wither_skull_dangerous", "wither_skull");
		pair("shulker_bullet", "shulker_bullet");
		pair("llama_spit", "llama_spit");
		pair("small_fireball", "small_fireball");
		pair("dragon_fireball", "dragon_fireball");
		pair("command_block_minecart", "command_block_minecart");
		pair("area_effect_cloud", "area_effect_cloud");
		pair("egg", "egg");
		pair("ender_pearl", "ender_pearl");
		pair("eye_of_ender_signal", "eye_of_ender");
		pair("falling_block", "falling_block");
		pair("item", "item");
		pair("painting", "painting");
		pair("armor_stand", "armor_stand");
	}

	private static void pair(String bedrock, String java) {
		TO_JAVA.put("minecraft:" + bedrock, "minecraft:" + java);
		TO_BEDROCK.putIfAbsent("minecraft:" + java, "minecraft:" + bedrock);
	}

	public static String bedrockId(EntityType<?> t) {
		BedrockEntity.Kind k = BedrockEntity.kindOf(t);
		if (k != null) return k.def().id;
		ResourceLocation rl = ForgeRegistries.ENTITY_TYPES.getKey(t);
		if (rl == null) return "";
		String s = rl.toString();
		return TO_BEDROCK.getOrDefault(s, s);
	}

	/** The Java type for a Bedrock id, or null */
	public static EntityType<?> javaType(String bedrockId) {
		String id = Bedrock.id(bedrockId);
		EntityType<?> b = BedrockEntity.typeOf(id);
		if (b != null) return b;
		String j = TO_JAVA.getOrDefault(id, id);
		ResourceLocation rl = ResourceLocation.tryParse(j);
		if (rl == null || !ForgeRegistries.ENTITY_TYPES.containsKey(rl)) return null;
		return ForgeRegistries.ENTITY_TYPES.getValue(rl);
	}

	/** Roughly the families Bedrock gives vanilla mobs */
	static Set<String> vanillaFamilies(Entity e) {
		Set<String> f = new HashSet<>();
		String id = bedrockId(e.getType());
		String name = id.substring(id.indexOf(':') + 1);
		if (e instanceof Player) { f.add("player"); f.add("mob"); return f; }
		f.add(name);
		if (e instanceof LivingEntity l) {
			f.add("mob");
			if (l.getMobType() == MobType.UNDEAD) f.add("undead");
			if (l.getMobType() == MobType.ARTHROPOD) f.add("arthropod");
			if (l.getMobType() == MobType.ILLAGER) f.add("illager");
			if (e instanceof Enemy || e.getType().getCategory() == MobCategory.MONSTER) f.add("monster");
			if (e instanceof Animal) f.add("animal");
			if (e instanceof Raider) f.add("raider");
		} else {
			f.add("inanimate");
		}
		if (e instanceof Projectile) f.add("projectile");
		switch (name) {
			case "iron_golem" -> f.add("irongolem");
			case "snow_golem" -> f.add("snowgolem");
			case "villager", "villager_v2" -> f.add("villager");
			case "wandering_trader" -> f.add("wandering_trader");
			case "armor_stand" -> f.add("armor_stand");
			case "zombie", "husk", "drowned", "zombie_villager", "zombie_villager_v2" -> f.add("zombie");
			case "skeleton", "stray", "wither_skeleton" -> f.add("skeleton");
			default -> { }
		}
		return f;
	}
}
