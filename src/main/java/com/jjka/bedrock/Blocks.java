package com.jjka.bedrock;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraftforge.registries.ForgeRegistries;

/** Bedrock block names (some are old names covering several blocks, like red_flower) and their Java blocks */
public final class Blocks {
	private Blocks() {}

	private static final Map<String, String[]> ALIASES = new HashMap<>();

	private static void alias(String bedrock, String... java) { ALIASES.put(bedrock, java); }

	static {
		alias("grass", "grass_block");
		alias("tallgrass", "grass", "fern");
		alias("short_grass", "grass");
		alias("double_plant", "sunflower", "lilac", "tall_grass", "large_fern", "rose_bush", "peony");
		alias("red_flower", "poppy", "blue_orchid", "allium", "azure_bluet", "red_tulip", "orange_tulip", "white_tulip", "pink_tulip", "oxeye_daisy", "cornflower", "lily_of_the_valley");
		alias("yellow_flower", "dandelion");
		alias("leaves", "oak_leaves", "spruce_leaves", "birch_leaves", "jungle_leaves");
		alias("leaves2", "acacia_leaves", "dark_oak_leaves");
		alias("log", "oak_log", "spruce_log", "birch_log", "jungle_log");
		alias("log2", "acacia_log", "dark_oak_log");
		alias("wood", "oak_wood", "spruce_wood", "birch_wood", "jungle_wood", "acacia_wood", "dark_oak_wood");
		alias("planks", "oak_planks", "spruce_planks", "birch_planks", "jungle_planks", "acacia_planks", "dark_oak_planks", "mangrove_planks", "cherry_planks", "bamboo_planks", "crimson_planks", "warped_planks");
		alias("stone_slab", "smooth_stone_slab", "sandstone_slab", "cobblestone_slab", "brick_slab", "stone_brick_slab", "quartz_slab", "nether_brick_slab");
		alias("stone_slab2", "red_sandstone_slab", "purpur_slab", "prismarine_slab", "dark_prismarine_slab", "prismarine_brick_slab", "mossy_cobblestone_slab", "smooth_sandstone_slab", "red_nether_brick_slab");
		alias("stone_slab3", "end_stone_brick_slab", "smooth_red_sandstone_slab", "polished_andesite_slab", "andesite_slab", "diorite_slab", "polished_diorite_slab", "granite_slab", "polished_granite_slab");
		alias("stone_slab4", "mossy_stone_brick_slab", "smooth_quartz_slab", "stone_slab", "cut_sandstone_slab", "cut_red_sandstone_slab");
		alias("wooden_slab", "oak_slab", "spruce_slab", "birch_slab", "jungle_slab", "acacia_slab", "dark_oak_slab");
		alias("wool", "white_wool", "orange_wool", "magenta_wool", "light_blue_wool", "yellow_wool", "lime_wool", "pink_wool", "gray_wool", "light_gray_wool", "cyan_wool", "purple_wool", "blue_wool", "brown_wool", "green_wool", "red_wool", "black_wool");
		alias("concrete", "white_concrete");
		alias("stained_glass", "white_stained_glass");
		alias("stained_hardened_clay", "white_terracotta");
		alias("hardened_clay", "terracotta");
		alias("flowing_water", "water");
		alias("flowing_lava", "lava");
		alias("deadbush", "dead_bush");
		alias("reeds", "sugar_cane");
		alias("waterlily", "lily_pad");
		alias("web", "cobweb");
		alias("snow_layer", "snow");
		alias("magma", "magma_block");
		alias("light_block", "light");
		alias("unlit_redstone_torch", "redstone_torch");
		alias("standing_sign", "oak_sign");
		alias("wall_sign", "oak_wall_sign");
		alias("darkoak_standing_sign", "dark_oak_sign");
		alias("darkoak_wall_sign", "dark_oak_wall_sign");
		alias("wooden_button", "oak_button");
		alias("wooden_pressure_plate", "oak_pressure_plate");
		alias("wooden_door", "oak_door");
		alias("trapdoor", "oak_trapdoor");
		alias("fence", "oak_fence");
		alias("fence_gate", "oak_fence_gate");
		alias("standing_banner", "white_banner");
		alias("wall_banner", "white_wall_banner");
		alias("frame", "air");
		alias("glow_frame", "air");
		alias("cave_vines_body_with_berries", "cave_vines_plant");
		alias("cave_vines_head_with_berries", "cave_vines");
		alias("bamboo_sapling", "bamboo_sapling");
		alias("monster_egg", "infested_stone");
		alias("quartz_block", "quartz_block");
		alias("chiseled_quartz_block", "chiseled_quartz_block");
		alias("brick_block", "bricks");
		alias("stonebrick", "stone_bricks");
		alias("mossy_stone_bricks", "mossy_stone_bricks");
		alias("mob_spawner", "spawner");
		alias("lit_pumpkin", "jack_o_lantern");
		alias("melon_block", "melon");
		alias("slime", "slime_block");
		alias("snow", "snow_block");
		alias("noteblock", "note_block");
		alias("invisible_bedrock", "barrier");
		alias("invisiblebedrock", "barrier");
		alias("border_block", "barrier");
		alias("structure_void", "structure_void");
		alias("seagrass", "seagrass", "tall_seagrass");
		alias("coral", "tube_coral");
		alias("carpet", "white_carpet");
		alias("concretepowder", "white_concrete_powder");
		alias("silver_glazed_terracotta", "light_gray_glazed_terracotta");
		alias("powered_repeater", "repeater");
		alias("unpowered_repeater", "repeater");
		alias("powered_comparator", "comparator");
		alias("unpowered_comparator", "comparator");
		alias("lit_furnace", "furnace");
		alias("lit_redstone_ore", "redstone_ore");
		alias("lit_redstone_lamp", "redstone_lamp");
		alias("redstone_lamp", "redstone_lamp");
		alias("chemistry_table", "crafting_table");
		alias("item_frame", "air");
		// the add-on's own blocks, until they're ported as blocks
		alias("ds:void", "black_concrete");
		alias("ds:void_white", "white_concrete");
		alias("ds:foreign_bricks", "deepslate_bricks");
		alias("ds:crate_v2", "barrel");
		alias("ds:crate_v3", "barrel");
		alias("ds:crate_v4", "barrel");
		alias("ds:crate_v5", "barrel");
	}

	private static final Map<String, Set<Block>> SETS = new HashMap<>();

	static Set<Block> blocks(String bedrockName) {
		String n = bedrockName.toLowerCase(Locale.ROOT);
		if (n.startsWith("minecraft:")) n = n.substring(10);
		String key = n;
		synchronized (SETS) {
			Set<Block> s = SETS.get(key);
			if (s != null) return s;
			s = new HashSet<>();
			String[] java = ALIASES.get(key);
			if (java == null) java = new String[] { key };
			for (String j : java) {
				ResourceLocation rl = ResourceLocation.tryParse(j.contains(":") ? j : "minecraft:" + j);
				if (rl != null && ForgeRegistries.BLOCKS.containsKey(rl)) s.add(ForgeRegistries.BLOCKS.getValue(rl));
				else {
					ResourceLocation mine = new ResourceLocation(Bedrock.MODID, Bedrock.path(key));
					if (ForgeRegistries.BLOCKS.containsKey(mine)) s.add(ForgeRegistries.BLOCKS.getValue(mine));
				}
			}
			if (s.isEmpty()) Bedrock.warnOnce("block", "Unknown block " + bedrockName);
			SETS.put(key, s);
			return s;
		}
	}

	public static boolean matches(BlockState state, String bedrockName, String states) {
		Set<Block> s = blocks(bedrockName);
		if (s.contains(state.getBlock())) return true;
		// "air" in Bedrock also covers the other kinds of air
		return bedrockName.equalsIgnoreCase("air") && state.isAir();
	}

	public static BlockState state(String bedrockName, String states) {
		Set<Block> s = blocks(bedrockName);
		if (s.isEmpty()) return null;
		String[] java = ALIASES.get(bedrockName.toLowerCase(Locale.ROOT).replace("minecraft:", ""));
		Block b = null;
		if (java != null) {
			ResourceLocation rl = ResourceLocation.tryParse(java[0].contains(":") ? java[0] : "minecraft:" + java[0]);
			if (rl != null) b = ForgeRegistries.BLOCKS.getValue(rl);
		}
		if (b == null) b = s.iterator().next();
		return b.defaultBlockState();
	}
}
