package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.ListTag;
import net.minecraft.nbt.StringTag;
import net.minecraft.nbt.Tag;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.TooltipFlag;
import net.minecraft.world.level.Level;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

/**
 * The behaviour pack's items. Technique items (the ones the add-on locks into your inventory: ds:limitless1, fists ...) go
 * on a technique bar instead of your hotbar. With technique mode on, keys 1-9 / scrolling pick from that bar and it counts
 * as what you're holding, so the add-on's "holding ds:limitless2 in the main hand" checks work just like on Bedrock.
 */
public final class Items {
	private Items() {}

	public static final class BedrockItem extends Item {
		public final String id;
		final List<String> lore = new ArrayList<>();

		BedrockItem(String id, Properties p, String displayName) {
			super(p);
			this.id = id;
			if (displayName != null) {
				String[] lines = displayName.split("\n");
				for (int i = 1; i < lines.length; i++) lore.add(lines[i]);
			}
		}

		@Override
		public void appendHoverText(ItemStack stack, Level level, List<Component> tip, TooltipFlag flag) {
			for (String l : lore) tip.add(Component.literal(l));
		}
	}

	private static final Map<String, RegistryObject<Item>> ITEMS = new HashMap<>();
	private static final Map<Item, String> IDS = new HashMap<>();

	public static void register(DeferredRegister<Item> reg) {
		for (String file : Bedrock.list("bp/items/", ".json")) {
			JsonObject j = Bedrock.json(file);
			if (j == null || !j.has("minecraft:item")) continue;
			JsonObject it = j.getAsJsonObject("minecraft:item");
			String id = Bedrock.id(it.getAsJsonObject("description").get("identifier").getAsString());
			if (id.startsWith("minecraft:") || ITEMS.containsKey(id)) continue;
			JsonObject c = it.has("components") ? it.getAsJsonObject("components") : new JsonObject();
			int stack = c.has("minecraft:max_stack_size") ? c.get("minecraft:max_stack_size").getAsInt() : 64;
			JsonElement dn = c.get("minecraft:display_name");
			String name = dn != null && dn.isJsonObject() && dn.getAsJsonObject().has("value") ? dn.getAsJsonObject().get("value").getAsString() : null;
			ITEMS.put(id, reg.register(Bedrock.path(id), () -> new BedrockItem(id, new Item.Properties().stacksTo(Math.max(1, Math.min(64, stack))), name)));
		}
	}

	public static Iterable<RegistryObject<Item>> all() { return ITEMS.values(); }

	private static Map<String, String> descriptions;

	/** an item's display name / description text from the behaviour pack */
	public static synchronized String description(String id) {
		if (descriptions == null) {
			descriptions = new HashMap<>();
			for (String file : Bedrock.list("bp/items/", ".json")) {
				JsonObject j = Bedrock.json(file);
				if (j == null || !j.has("minecraft:item")) continue;
				JsonObject it = j.getAsJsonObject("minecraft:item");
				JsonObject c = it.has("components") ? it.getAsJsonObject("components") : new JsonObject();
				JsonElement dn = c.get("minecraft:display_name");
				if (dn != null && dn.isJsonObject() && dn.getAsJsonObject().has("value"))
					descriptions.put(Bedrock.id(it.getAsJsonObject("description").get("identifier").getAsString()), dn.getAsJsonObject().get("value").getAsString());
			}
		}
		return descriptions.get(Bedrock.id(id));
	}

	public static Item item(String bedrockId) {
		String id = Bedrock.id(bedrockId);
		RegistryObject<Item> ro = ITEMS.get(id);
		if (ro != null && ro.isPresent()) return ro.get();
		ResourceLocation rl = ResourceLocation.tryParse(id);
		return rl != null && ForgeRegistries.ITEMS.containsKey(rl) ? ForgeRegistries.ITEMS.getValue(rl) : null;
	}

	public static String idOf(ItemStack s) {
		if (s.isEmpty()) return "minecraft:air";
		if (s.getItem() instanceof BedrockItem b) return b.id;
		ResourceLocation rl = ForgeRegistries.ITEMS.getKey(s.getItem());
		return rl == null ? "" : rl.toString();
	}

	// ------------------------------------------------------------------ the technique bar
	public static final class Bar {
		public final List<String> items = new ArrayList<>();
		public int selected;
		public boolean on;
		/** the fighting style in use (null: the newest one) */
		public String style;
		/** the technique item last equipped or given (Limitless, Boogie Woogie ...); the others you own wait in the J menu */
		public String equipped;

		/** whether the item belongs on the scroll bar: a technique item you've switched away from doesn't */
		public boolean shown(String id) { return !equip(id) || equipped == null || id.equals(equipped); }

		public String activeStyle() {
			if (style != null && items.contains(style)) return style;
			for (int i = items.size() - 1; i >= 0; i--) if (style(items.get(i))) return items.get(i);
			return null;
		}

		CompoundTag save() {
			CompoundTag t = new CompoundTag();
			ListTag l = new ListTag();
			for (String s : items) l.add(StringTag.valueOf(s));
			t.put("items", l);
			t.putInt("selected", selected);
			t.putBoolean("on", on);
			if (style != null) t.putString("style", style);
			if (equipped != null) t.putString("equipped", equipped);
			return t;
		}

		void load(CompoundTag t) {
			items.clear();
			for (Tag s : t.getList("items", Tag.TAG_STRING)) items.add(s.getAsString());
			selected = t.getInt("selected");
			on = t.getBoolean("on");
			style = t.contains("style") ? t.getString("style") : null;
			equipped = t.contains("equipped") ? t.getString("equipped") : null;
		}

		public String held() { return on && selected >= 0 && selected < items.size() ? items.get(selected) : null; }
	}

	private static final Map<Player, Bar> BARS = new java.util.WeakHashMap<>();

	public static Bar bar(Player p) {
		synchronized (BARS) {
			return BARS.computeIfAbsent(p, k -> {
				Bar b = new Bar();
				if (p.getPersistentData().contains("jjka_bar")) b.load(p.getPersistentData().getCompound("jjka_bar"));
				return b;
			});
		}
	}

	public static void saveBar(Player p) {
		Bar b = bar(p);
		p.getPersistentData().put("jjka_bar", b.save());
		if (p instanceof ServerPlayer sp) Net.bar(sp, b);
	}

	public static void copyBar(Player from, Player to) {
		if (from.getPersistentData().contains("jjka_bar")) to.getPersistentData().put("jjka_bar", from.getPersistentData().getCompound("jjka_bar").copy());
		synchronized (BARS) { BARS.remove(to); }
	}

	/** What the player counts as holding: the selected technique in technique mode, otherwise their real main hand */
	/** an item pretended to be in the hand for a few ticks (a move key, the dash key): {id, ticks} */
	public static final Map<java.util.UUID, Object[]> FORCED = new java.util.concurrent.ConcurrentHashMap<>();

	public static ItemStack mainhand(Player p) {
		Object[] f = FORCED.get(p.getUUID());
		if (f != null && (Integer) f[1] > 0) { Item i = item((String) f[0]); if (i != null) return new ItemStack(i); }
		String held = bar(p).held();
		if (held != null) { Item i = item(held); return i == null ? ItemStack.EMPTY : new ItemStack(i); }
		return p.getMainHandItem();
	}

	public static boolean has(Player p, String id, String location, int slot) {
		return count(p, id, location, slot) > 0;
	}

	static int count(Player p, String id, String location, int slot) {
		String loc = location == null ? "" : location.toLowerCase(Locale.ROOT);
		Bar bar = bar(p);
		int n = 0;
		switch (loc) {
			case "slot.weapon.mainhand" -> {
				ItemStack s = mainhand(p);
				if (idOf(s).equals(id)) n += s.getCount();
				// a fighting style on the technique bar is always in your fists: punching uses it whatever technique is picked
				else if (style(id) && id.equals(bar.activeStyle()) && (bar.on || p.getMainHandItem().isEmpty())) n++;
			}
			case "slot.weapon.offhand" -> { ItemStack s = p.getOffhandItem(); if (idOf(s).equals(id)) n += s.getCount(); }
			case "slot.armor.head" -> n += match(p.getItemBySlot(EquipmentSlot.HEAD), id);
			case "slot.armor.chest" -> n += match(p.getItemBySlot(EquipmentSlot.CHEST), id);
			case "slot.armor.legs" -> n += match(p.getItemBySlot(EquipmentSlot.LEGS), id);
			case "slot.armor.feet" -> n += match(p.getItemBySlot(EquipmentSlot.FEET), id);
			case "slot.hotbar" -> {
				if (slot >= 0) { n += match(p.getInventory().getItem(slot), id); if (slot < bar.items.size() && bar.items.get(slot).equals(id)) n++; }
				else { for (int i = 0; i < 9; i++) n += match(p.getInventory().getItem(i), id); for (String s : bar.items) if (s.equals(id)) n++; }
			}
			case "slot.inventory" -> {
				if (slot >= 0) n += match(p.getInventory().getItem(slot + 9), id);
				else for (int i = 9; i < 36; i++) n += match(p.getInventory().getItem(i), id);
			}
			case "slot.enderchest" -> { for (int i = 0; i < p.getEnderChestInventory().getContainerSize(); i++) n += match(p.getEnderChestInventory().getItem(i), id); }
			default -> {
				for (int i = 0; i < p.getInventory().getContainerSize(); i++) n += match(p.getInventory().getItem(i), id);
				for (String s : bar.items) if (s.equals(id)) n++;
			}
		}
		return n;
	}

	/** Fighting styles: the add-on's "fists" / "combat" items you punch with */
	/** The Stats Manual and Cursed Energy Manipulation: used from their own keys, kept off the technique bar */
	public static boolean tool(String id) { return id.equals("ds:stats_book") || id.equals("ds:cursedenergy"); }

	/** Items that equip a whole technique (Limitless, Boogie Woogie ...), replacing the one before. Not the King of
	 * Curses, which you hold alongside your technique */
	public static boolean equip(String id) { return id.endsWith("_technique") && !id.equals("ds:sukuna_technique"); }

	public static boolean style(String id) { return id.endsWith("fists") || id.endsWith("_combat") || id.endsWith("combat_style"); }

	private static int match(ItemStack s, String id) { return !s.isEmpty() && idOf(s).equals(id) ? s.getCount() : 0; }

	/** hasitem={item=..,location=..,slot=..,quantity=..} */
	public static boolean matches(Entity e, JsonObject h) {
		String id = h.has("item") ? Bedrock.id(h.get("item").getAsString()) : null;
		if (id == null) return false;
		String loc = h.has("location") ? h.get("location").getAsString() : null;
		int slot = -1;
		if (h.has("slot")) { try { slot = Integer.parseInt(h.get("slot").getAsString().trim()); } catch (NumberFormatException ignored) { } }
		int n;
		if (e instanceof Player p) n = count(p, id, loc, slot);
		else if (e instanceof LivingEntity l) {
			n = 0;
			if (loc == null || loc.contains("mainhand")) n += match(l.getMainHandItem(), id);
			if (loc == null || loc.contains("offhand")) n += match(l.getOffhandItem(), id);
			if (loc == null || loc.contains("armor")) for (ItemStack s : l.getArmorSlots()) n += match(s, id);
		} else n = 0;
		if (h.has("quantity")) {
			Selector.Range r = Selector.Range.parse(h.get("quantity").getAsString());
			return r.test(n);
		}
		return n > 0;
	}

	// ------------------------------------------------------------------ give / clear / replaceitem
	private static final Map<java.util.UUID, Integer> SELECTED_AT = new java.util.concurrent.ConcurrentHashMap<>();

	static Commands.Cmd give(Commands.R r) {
		Commands.Target t = r.target();
		String id = Bedrock.id(r.word());
		int amount = r.end() ? 1 : (int) r.num();
		if (!r.end() && r.peek() != '{') r.word(); // data
		String comps = r.rest();
		boolean locked = comps.contains("item_lock");
		return c -> {
			Item item = item(id);
			if (item == null) { Bedrock.warnOnce("item", "Unknown item " + id); return 0; }
			int n = 0;
			for (Entity e : t.entities(c)) if (e instanceof ServerPlayer p) {
				if ((locked || style(id)) && item instanceof BedrockItem) {
					Bar b = bar(p);
					if (!b.items.contains(id) || item.getMaxStackSize() > 1) {
						b.items.add(id);
						if (equip(id)) b.equipped = id;
						// a newly given technique is the one you use (Sukuna taking over hands you his moves): the first of
						// the tick's batch, so a function giving several doesn't land on the last
						if (!style(id) && !tool(id) && !id.equals("ds:dash") && !Moves.of(id).isEmpty() && SELECTED_AT.getOrDefault(p.getUUID(), -1) != p.server.getTickCount()) {
							SELECTED_AT.put(p.getUUID(), p.server.getTickCount());
							b.selected = b.items.size() - 1;
						}
					}
					if (style(id)) b.style = id; // a new fighting style is the one you use
					saveBar(p);
				} else {
					ItemStack s = new ItemStack(item, amount);
					if (!p.getInventory().add(s)) p.drop(s, false);
				}
				n++;
			}
			return n;
		};
	}

	static Commands.Cmd clear(Commands.R r) {
		Commands.Target t = r.end() ? null : r.target();
		String id = r.end() ? null : Bedrock.id(r.word());
		if (!r.end()) r.word();
		int max = r.end() ? -1 : (int) r.num();
		return c -> {
			List<Entity> who = t == null ? (c.self == null ? List.of() : List.of(c.self)) : t.entities(c);
			int n = 0;
			for (Entity e : who) if (e instanceof ServerPlayer p) {
				Bar b = bar(p);
				int before = b.items.size();
				if (id == null) b.items.clear(); else b.items.removeIf(id::equals);
				if (b.items.size() != before) { n += before - b.items.size(); if (b.selected >= b.items.size()) b.selected = Math.max(0, b.items.size() - 1); saveBar(p); }
				int left = max < 0 ? Integer.MAX_VALUE : max;
				for (int i = 0; i < p.getInventory().getContainerSize() && left > 0; i++) {
					ItemStack s = p.getInventory().getItem(i);
					if (s.isEmpty() || id != null && !idOf(s).equals(id)) continue;
					int take = Math.min(left, s.getCount());
					s.shrink(take);
					left -= take;
					n += take;
				}
			}
			return n;
		};
	}

	static Commands.Cmd replaceitem(Commands.R r) {
		String kind = r.word();
		if (!kind.equalsIgnoreCase("entity")) return c -> 0;
		Commands.Target t = r.target();
		String slotType = r.word().toLowerCase(Locale.ROOT);
		int slot = (int) r.num();
		if (r.peekWord().equalsIgnoreCase("destroy") || r.peekWord().equalsIgnoreCase("keep")) r.word();
		String id = Bedrock.id(r.word());
		int amount = r.end() ? 1 : (int) r.num();
		if (!r.end() && r.peek() != '{') r.word();
		boolean locked = r.rest().contains("item_lock");
		return c -> {
			Item item = item(id);
			if (item == null) return 0;
			for (Entity e : t.entities(c)) {
				ItemStack s = id.equals("minecraft:air") ? ItemStack.EMPTY : new ItemStack(item, amount);
				if (e instanceof ServerPlayer p && locked && item instanceof BedrockItem && slotType.startsWith("slot.weapon.mainhand")) {
					Bar b = bar(p);
					if (!b.items.contains(id)) b.items.add(id);
					saveBar(p);
					continue;
				}
				if (!(e instanceof LivingEntity l)) continue;
				switch (slotType) {
					case "slot.weapon.mainhand" -> l.setItemSlot(EquipmentSlot.MAINHAND, s);
					case "slot.weapon.offhand" -> l.setItemSlot(EquipmentSlot.OFFHAND, s);
					case "slot.armor.head" -> l.setItemSlot(EquipmentSlot.HEAD, s);
					case "slot.armor.chest" -> l.setItemSlot(EquipmentSlot.CHEST, s);
					case "slot.armor.legs" -> l.setItemSlot(EquipmentSlot.LEGS, s);
					case "slot.armor.feet" -> l.setItemSlot(EquipmentSlot.FEET, s);
					case "slot.hotbar" -> { if (e instanceof Player p) { if (locked && item instanceof BedrockItem) { Bar b = bar(p); if (!b.items.contains(id)) b.items.add(Math.min(slot, b.items.size()), id); saveBar(p); } else p.getInventory().setItem(slot, s); } }
					case "slot.inventory" -> { if (e instanceof Player p) p.getInventory().setItem(9 + slot, s); }
					default -> { }
				}
			}
			return 1;
		};
	}
}
