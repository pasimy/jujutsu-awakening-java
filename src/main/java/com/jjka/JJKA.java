package com.jjka;

import com.jjka.bedrock.Bedrock;
import com.jjka.bedrock.BedrockEntity;
import com.jjka.bedrock.EntityDef;
import com.jjka.bedrock.Functions;
import com.jjka.bedrock.Items;
import com.jjka.bedrock.Net;
import com.jjka.bedrock.Server;

import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.event.entity.EntityAttributeCreationEvent;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.fml.DistExecutor;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.event.lifecycle.FMLCommonSetupEvent;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

@Mod(Bedrock.MODID)
public final class JJKA {
	public static final DeferredRegister<EntityType<?>> ENTITIES = DeferredRegister.create(ForgeRegistries.ENTITY_TYPES, Bedrock.MODID);
	public static final DeferredRegister<Item> ITEMS = DeferredRegister.create(ForgeRegistries.ITEMS, Bedrock.MODID);
	public static final DeferredRegister<CreativeModeTab> TABS = DeferredRegister.create(Registries.CREATIVE_MODE_TAB, Bedrock.MODID);

	public static final RegistryObject<CreativeModeTab> TAB = TABS.register("main", () -> CreativeModeTab.builder()
			.title(Component.literal("Jujutsu Awakening"))
			.icon(() -> { Item i = Items.item("ds:limitless_technique"); return i == null ? ItemStack.EMPTY : new ItemStack(i); })
			.displayItems((params, out) -> { for (RegistryObject<Item> i : Items.all()) if (i.isPresent()) out.accept(i.get()); })
			.build());

	public JJKA() {
		IEventBus bus = FMLJavaModLoadingContext.get().getModEventBus();
		// the packs are read now: Forge needs every entity and item registered up front
		EntityDef.all();
		BedrockEntity.register(ENTITIES);
		Items.register(ITEMS);
		ENTITIES.register(bus);
		ITEMS.register(bus);
		TABS.register(bus);
		bus.addListener(this::attributes);
		bus.addListener(this::setup);
		MinecraftForge.EVENT_BUS.register(Server.class);
		MinecraftForge.EVENT_BUS.register(com.jjka.bedrock.JjkaCommand.class);
		DistExecutor.unsafeRunWhenOn(Dist.CLIENT, () -> () -> com.jjka.client.ClientSetup.init(bus));
	}

	private void setup(FMLCommonSetupEvent e) {
		Net.register();
		e.enqueueWork(Functions::load);
	}

	private void attributes(EntityAttributeCreationEvent e) {
		for (BedrockEntity.Kind k : BedrockEntity.kinds()) if (k.type().isPresent()) e.put(k.type().get(), BedrockEntity.attributes());
	}
}
