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
		// the overworld's sky effects, minus the clouds while you're inside a domain
		bus.addListener((net.minecraftforge.client.event.RegisterDimensionSpecialEffectsEvent e) ->
				e.register(net.minecraft.world.level.dimension.BuiltinDimensionTypes.OVERWORLD_EFFECTS, new net.minecraft.client.renderer.DimensionSpecialEffects.OverworldEffects() {
					@Override
					public boolean renderClouds(net.minecraft.client.multiplayer.ClientLevel level, int ticks, float partial, com.mojang.blaze3d.vertex.PoseStack ps, double x, double y, double z, org.joml.Matrix4f proj) {
						// (cutscene cameras too: the domain intros fill the screen with effects that don't hide what's behind them)
						return BedrockRenderer.Backdrop.active() || Screen.camOn();
					}
				}));
		bus.addListener((FMLClientSetupEvent e) -> new Thread(Rp::preload, "JJKA resource pack").start());
		var forge = MinecraftForge.EVENT_BUS;
		forge.addListener((TickEvent.ClientTickEvent e) -> {
			if (e.phase == TickEvent.Phase.START) { Keys.tick(); Screen.tick(); }
			else MenuScreen.update();
		});
		forge.addListener((TickEvent.RenderTickEvent e) -> { if (e.phase == TickEvent.Phase.START) Screen.frame(); });
		// while the add-on's cutscene camera is on: no first-person hand floating in view, no name tag over your own head
		forge.addListener((net.minecraftforge.client.event.RenderHandEvent e) -> { if (Screen.camOn()) e.setCanceled(true); });
		forge.addListener((net.minecraftforge.client.event.RenderNameTagEvent e) -> {
			if (Screen.camOn() && e.getEntity() == net.minecraft.client.Minecraft.getInstance().player) e.setResult(net.minecraftforge.eventbus.api.Event.Result.DENY);
		});
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
				// unmapped (dev) names: find the model field by its type
				try {
					for (java.lang.reflect.Field f : LivingEntityRenderer.class.getDeclaredFields())
						if (net.minecraft.client.model.EntityModel.class.isAssignableFrom(f.getType())) { f.setAccessible(true); f.set(r, model); }
				} catch (ReflectiveOperationException ex2) {
					com.jjka.bedrock.Bedrock.LOG.error("Couldn't swap the player model; player animations won't show", ex);
				}
			}
			r.addLayer(new PlayerLayer(r));
		}
	}
}
