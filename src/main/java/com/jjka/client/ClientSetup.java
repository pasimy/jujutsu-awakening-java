package com.jjka.client;

import com.jjka.bedrock.BedrockEntity;
import com.jjka.bedrock.Net;

import net.minecraft.client.model.geom.ModelLayers;
import net.minecraft.client.renderer.entity.LivingEntityRenderer;
import net.minecraft.client.renderer.entity.player.PlayerRenderer;
import net.minecraftforge.client.event.ClientPlayerNetworkEvent;
import net.minecraftforge.client.event.EntityRenderersEvent;
import net.minecraftforge.client.event.InputEvent;
import net.minecraftforge.client.event.MovementInputUpdateEvent;
import net.minecraftforge.client.event.RenderGuiOverlayEvent;
import net.minecraftforge.client.event.RenderLevelStageEvent;
import net.minecraftforge.client.event.ViewportEvent;
import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.event.TickEvent;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.fml.event.lifecycle.FMLClientSetupEvent;
import net.minecraftforge.fml.util.ObfuscationReflectionHelper;

/** Client registration: renderers, keys, the player model, and the per-frame hooks */
public final class ClientSetup {
	private ClientSetup() {}

	public static void init(IEventBus bus) {
		Net.client = new ClientImpl();
		bus.addListener(ClientSetup::renderers);
		bus.addListener(ClientSetup::layers);
		bus.addListener(Keys::register);
		bus.addListener((FMLClientSetupEvent e) -> new Thread(Rp::preload, "JJKA resource pack").start());
		var forge = MinecraftForge.EVENT_BUS;
		forge.addListener((TickEvent.ClientTickEvent e) -> {
			if (e.phase == TickEvent.Phase.START) { Keys.tick(); Screen.tick(); }
			else MenuScreen.update();
		});
		forge.addListener((TickEvent.RenderTickEvent e) -> { if (e.phase == TickEvent.Phase.START) Screen.frame(); });
		forge.addListener(Keys::interact);
		forge.addListener(Keys::key);
		forge.addListener(Keys::mouse);
		forge.addListener(Keys::scroll);
		forge.addListener((MovementInputUpdateEvent e) -> Screen.movement(e));
		forge.addListener((ViewportEvent.ComputeCameraAngles e) -> Screen.angles(e));
		forge.addListener((RenderGuiOverlayEvent.Pre e) -> Screen.overlay(e));
		forge.addListener((RenderGuiOverlayEvent.Post e) -> Screen.hud(e));
		forge.addListener((RenderLevelStageEvent e) -> {
			if (e.getStage() == RenderLevelStageEvent.Stage.AFTER_PARTICLES) Particles.render(e.getPoseStack(), e.getCamera());
		});
		forge.addListener((ClientPlayerNetworkEvent.LoggingOut e) -> { Particles.clear(); Screen.clearCam(); MenuScreen.page(""); });
	}

	private static void renderers(EntityRenderersEvent.RegisterRenderers e) {
		for (BedrockEntity.Kind k : BedrockEntity.kinds()) if (k.type().isPresent()) e.registerEntityRenderer(k.type().get(), BedrockRenderer::new);
	}

	/** Swap the player model for one that also plays the add-on's animations */
	private static void layers(EntityRenderersEvent.AddLayers e) {
		for (String skin : e.getSkins()) {
			if (!(e.getSkin(skin) instanceof PlayerRenderer r)) continue;
			boolean slim = skin.equals("slim");
			var model = new PlayerAnims.Model(e.getEntityModels().bakeLayer(slim ? ModelLayers.PLAYER_SLIM : ModelLayers.PLAYER), slim);
			try {
				ObfuscationReflectionHelper.setPrivateValue(LivingEntityRenderer.class, r, model, "f_115290_");
			} catch (RuntimeException ex) {
				com.jjka.bedrock.Bedrock.LOG.error("Couldn't swap the player model; player animations won't show", ex);
			}
		}
	}
}
