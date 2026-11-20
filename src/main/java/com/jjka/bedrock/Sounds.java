package com.jjka.bedrock;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonObject;

import net.minecraft.resources.ResourceLocation;
import net.minecraftforge.registries.ForgeRegistries;

/** A Bedrock sound name -> the sound to play on Java: the add-on's own (assets/jjka/sounds.json) or vanilla's */
public final class Sounds {
	private Sounds() {}

	private static Set<String> own;
	private static final Map<String, ResourceLocation> CACHE = new HashMap<>();
	private static final Map<String, String> VANILLA = new HashMap<>();

	static {
		String[][] m = {
			{ "random.explode", "entity.generic.explode" }, { "note.pling", "block.note_block.pling" }, { "note.bell", "block.note_block.bell" },
			{ "note.bd", "block.note_block.basedrum" }, { "note.harp", "block.note_block.harp" }, { "note.bass", "block.note_block.bass" },
			{ "random.levelup", "entity.player.levelup" }, { "random.orb", "entity.experience_orb.pickup" }, { "random.click", "ui.button.click" },
			{ "random.splash", "entity.generic.splash" }, { "random.fizz", "block.fire.extinguish" }, { "random.glass", "block.glass.break" },
			{ "random.anvil_land", "block.anvil.land" }, { "random.anvil_break", "block.anvil.destroy" }, { "random.swim", "entity.generic.swim" },
			{ "random.burp", "entity.player.burp" }, { "random.eat", "entity.generic.eat" }, { "random.drink", "entity.generic.drink" },
			{ "random.toast", "ui.toast.in" }, { "random.totem", "item.totem.use" }, { "random.break", "entity.item.break" },
			{ "random.pling", "block.note_block.pling" }, { "random.shock", "entity.lightning_bolt.impact" }, { "random.wither.shoot", "entity.wither.shoot" },
			{ "beacon.power", "block.beacon.power_select" }, { "beacon.activate", "block.beacon.activate" }, { "beacon.deactivate", "block.beacon.deactivate" },
			{ "beacon.ambient", "block.beacon.ambient" }, { "bracon.power", "block.beacon.power_select" },
			{ "bubble.up", "block.bubble_column.upwards_inside" }, { "bubble.down", "block.bubble_column.whirlpool_inside" },
			{ "place.sculk", "block.sculk.place" }, { "portal.trigger", "block.portal.trigger" }, { "portal.travel", "block.portal.travel" },
			{ "portal.portal", "block.portal.ambient" }, { "item.trident.throw", "item.trident.throw" }, { "item.trident.thunder", "item.trident.thunder" },
			{ "item.trident.return", "item.trident.return" }, { "dig.chain", "block.chain.break" }, { "dig.grass", "block.grass.break" },
			{ "dig.dirt", "block.gravel.break" }, { "dig.ancient_debris", "block.ancient_debris.break" }, { "break.amethyst_block", "block.amethyst_block.break" },
			{ "ambient.cave", "ambient.cave" }, { "ambient.soulsand_valley.additions", "ambient.soul_sand_valley.additions" },
			{ "ambient.soulsand_valley.mood", "ambient.soul_sand_valley.mood" }, { "ambient.basalt_deltas.mood", "ambient.basalt_deltas.mood" },
			{ "ambient.nether_wastes.loop", "ambient.nether_wastes.loop" }, { "ambient.nether_wastes.mood", "ambient.nether_wastes.mood" },
			{ "ambient.warped_forest.loop", "ambient.warped_forest.loop" }, { "ambient.crimson_forest.mood", "ambient.crimson_forest.mood" },
			{ "ambient.weather.lightning.impact", "entity.lightning_bolt.impact" }, { "ambient.weather.thunder", "entity.lightning_bolt.thunder" },
			{ "mob.shock", "entity.lightning_bolt.impact" }, { "block.end_portal.spawn", "block.end_portal.spawn" }, { "block.barrel.close", "block.barrel.close" },
			{ "block.turtle_egg.break", "entity.turtle.egg_break" }, { "block.turtle_egg.crack", "entity.turtle.egg_crack" }, { "block.bell.hit", "block.bell.use" },
			{ "particle.soul_escape", "particle.soul_escape" }, { "firework.blast", "entity.firework_rocket.blast" }, { "camera.take_picture", "entity.item_frame.place" },
			{ "armor.equip.iron", "item.armor.equip_iron" }, { "armor.equip_iron", "item.armor.equip_iron" }, { "respawn_anchor.deplete", "block.respawn_anchor.deplete" },
			{ "respawn_anchor.charge", "block.respawn_anchor.charge" }, { "elytra.loop", "item.elytra.flying" }, { "crossbow.shoot", "item.crossbow.shoot" },
			{ "conduit.short", "block.conduit.ambient.short" }, { "conduit.ambient", "block.conduit.ambient" }, { "raid.horn", "event.raid.horn" },
			{ "record.mellohi", "music_disc.mellohi" }, { "use.netherite", "block.netherite_block.step" }, { "mob.block.campfire.crackle", "block.campfire.crackle" },
			{ "mob.evocation_fangs.attack", "entity.evoker_fangs.attack" }, { "mob.evocation_illager.cast_spell", "entity.evoker.cast_spell" },
			{ "mob.elderguardian.curse", "entity.elder_guardian.curse" }, { "mob.enderdragon.flap", "entity.ender_dragon.flap" },
			{ "mob.ender_dragon.flap", "entity.ender_dragon.flap" }, { "mob.enderdragin.flap", "entity.ender_dragon.flap" },
			{ "mob.enderdragon.growl", "entity.ender_dragon.growl" }, { "mob.enderdragon.death", "entity.ender_dragon.death" },
			{ "mob.endermen.idle", "entity.enderman.ambient" }, { "mob.endermen.portal", "entity.enderman.teleport" }, { "mob.zombie.remedy", "entity.zombie_villager.cure" },
			{ "mob.wither.break_block", "entity.wither.break_block" }, { "mob.wither_break_block", "entity.wither.break_block" }, { "mob.wither.break", "entity.wither.break_block" },
			{ "mob.phantom_death", "entity.phantom.death" }, { "mob.drowned.say", "entity.drowned.ambient" }, { "mob.sheep.say", "entity.sheep.ambient" },
			{ "mob.sheep.shear", "entity.sheep.shear" }, { "mob.bee.loop", "entity.bee.loop" }, { "mob.random.explode", "entity.generic.explode" },
			{ "mob.wolf.growl", "entity.wolf.growl" }, { "mob.slime.jump", "entity.slime.jump" }, { "mob.bat.takeoff", "entity.bat.takeoff" },
			{ "mob.breeze.shoot", "entity.blaze.shoot" }, { "mob.guardian.death", "entity.guardian.death" }, { "mob.spider.step", "entity.spider.step" },
			{ "mob.cow.hurt", "entity.cow.hurt" }, { "mob.rabbit.death", "entity.rabbit.death" }, { "mob.stormwraith.attack", "entity.wither.shoot" },
		};
		for (String[] p : m) VANILLA.put(p[0], p[1]);
	}

	private static synchronized Set<String> own() {
		if (own != null) return own;
		own = new java.util.HashSet<>();
		try (var in = Sounds.class.getResourceAsStream("/assets/jjka/sounds.json")) {
			if (in != null) {
				JsonObject j = com.google.gson.JsonParser.parseReader(Bedrock.reader(in)).getAsJsonObject();
				own.addAll(j.keySet());
			}
		} catch (Exception e) { Bedrock.LOG.error("Couldn't read sounds.json", e); }
		return own;
	}

	public static synchronized ResourceLocation java(String bedrock) {
		String n = bedrock.toLowerCase(Locale.ROOT);
		if (CACHE.containsKey(n)) return CACHE.get(n);
		ResourceLocation rl = null;
		String s = Bedrock.safe(n);
		if (own().contains(s)) rl = new ResourceLocation(Bedrock.MODID, s);
		else {
			String v = VANILLA.get(n);
			if (v == null) v = guess(n);
			ResourceLocation r = ResourceLocation.tryParse("minecraft:" + v);
			if (r != null && ForgeRegistries.SOUND_EVENTS.containsKey(r)) rl = r;
			else Bedrock.warnOnce("sound", "No sound for " + bedrock);
		}
		CACHE.put(n, rl);
		return rl;
	}

	private static String guess(String n) {
		if (n.startsWith("mob.")) {
			String[] p = n.substring(4).split("\\.");
			if (p.length >= 2) {
				String ev = p[p.length - 1];
				String mob = String.join("_", java.util.Arrays.copyOf(p, p.length - 1));
				if (ev.equals("say") || ev.equals("idle")) ev = "ambient";
				return "entity." + mob + "." + ev;
			}
		}
		if (n.startsWith("random.")) return "entity.generic." + n.substring(7);
		if (n.startsWith("dig.")) return "block." + n.substring(4) + ".break";
		if (n.startsWith("note.")) return "block.note_block." + n.substring(5);
		return n;
	}
}
