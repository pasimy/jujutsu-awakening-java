package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

import net.minecraft.network.FriendlyByteBuf;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.phys.Vec3;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.fml.DistExecutor;
import net.minecraftforge.network.NetworkDirection;
import net.minecraftforge.network.NetworkEvent;
import net.minecraftforge.network.NetworkRegistry;
import net.minecraftforge.network.PacketDistributor;
import net.minecraftforge.network.simple.SimpleChannel;

/** Packets between the server's runtime and each client's (particles, camera, animations, titles, the technique bar ...) */
public final class Net {
	private Net() {}

	public static final String VERSION = "1";
	public static final SimpleChannel CHANNEL = NetworkRegistry.newSimpleChannel(new ResourceLocation(Bedrock.MODID, "main"), () -> VERSION, VERSION::equals, VERSION::equals);

	/** Implemented on the client */
	public interface ClientSide {
		void particle(String id, double x, double y, double z);
		void bar(List<String> items, int selected, boolean on);
		void title(String mode, String text);
		void titleTimes(int in, int stay, int out);
		void shake(boolean stop, float intensity, float seconds, boolean rotational);
		void cameraFade(float in, float hold, float out, float r, float g, float b);
		void cameraSet(String preset, float ease, String easeType, Vec3 pos, float yRot, float xRot, boolean hasPos, boolean hasRot);
		void cameraClear();
		void animation(int entity, String anim, String next, float blendOut, String stop, String controller);
		void fog(String op, String id, String user);
		void hud(String op, String element);
		void input(String kind, boolean enabled);
		void actor(int entity, List<String> groups, List<String[]> props, int variant, int mark, int skin);
		void push(float x, float y, float z);
		void menu(String page);
	}

	public static ClientSide client;

	private static int id;

	public static void register() {
		CHANNEL.registerMessage(id++, Particle.class, Particle::write, Particle::new, Particle::handle);
		CHANNEL.registerMessage(id++, Bar.class, Bar::write, Bar::new, Bar::handle);
		CHANNEL.registerMessage(id++, Title.class, Title::write, Title::new, Title::handle);
		CHANNEL.registerMessage(id++, Fx.class, Fx::write, Fx::new, Fx::handle);
		CHANNEL.registerMessage(id++, Anim.class, Anim::write, Anim::new, Anim::handle);
		CHANNEL.registerMessage(id++, ActorSync.class, ActorSync::write, ActorSync::new, ActorSync::handle);
		CHANNEL.registerMessage(id++, Input.class, Input::write, Input::new, Input::handle);
		CHANNEL.registerMessage(id++, Menu.class, Menu::write, Menu::new, Menu::handle);
		CHANNEL.registerMessage(id++, Press.class, Press::write, Press::new, Press::handle);
	}

	private static void onClient(NetworkEvent.Context ctx, Runnable r) {
		ctx.enqueueWork(() -> DistExecutor.unsafeRunWhenOn(Dist.CLIENT, () -> () -> { if (client != null) r.run(); }));
		ctx.setPacketHandled(true);
	}

	// ------------------------------------------------------------------ sending
	public static void particle(ServerLevel level, String id, Vec3 at) {
		Particle p = new Particle(id, at.x, at.y, at.z);
		for (ServerPlayer sp : level.players()) if (sp.distanceToSqr(at) < 192 * 192) CHANNEL.send(PacketDistributor.PLAYER.with(() -> sp), p);
	}

	public static void bar(ServerPlayer p, Items.Bar b) { CHANNEL.send(PacketDistributor.PLAYER.with(() -> p), new Bar(new ArrayList<>(b.items), b.selected, b.on)); }

	public static void title(ServerPlayer p, String mode, String text) { CHANNEL.send(PacketDistributor.PLAYER.with(() -> p), new Title(mode, text, 0, 0, 0)); }

	public static void titleTimes(ServerPlayer p, int in, int stay, int out) { CHANNEL.send(PacketDistributor.PLAYER.with(() -> p), new Title("times", "", in, stay, out)); }

	public static void fx(ServerPlayer p, Fx fx) { CHANNEL.send(PacketDistributor.PLAYER.with(() -> p), fx); }

	public static void animation(Entity e, Anim a) { CHANNEL.send(PacketDistributor.TRACKING_ENTITY_AND_SELF.with(() -> e), a); }

	public static void actor(Entity e, ServerPlayer only) {
		Actor a = Actor.of(e);
		List<String[]> props = new ArrayList<>();
		for (var p : a.properties.entrySet()) {
			EntityDef.Property def = a.def == null ? null : a.def.properties.get(p.getKey());
			if (def != null && !def.sync && !(e instanceof net.minecraft.world.entity.player.Player)) continue;
			props.add(new String[] { p.getKey(), String.valueOf(p.getValue()) });
		}
		ActorSync m = new ActorSync(e.getId(), new ArrayList<>(a.groups), props, a.variant, a.markVariant, a.skinId);
		if (only != null) CHANNEL.send(PacketDistributor.PLAYER.with(() -> only), m);
		else CHANNEL.send(PacketDistributor.TRACKING_ENTITY_AND_SELF.with(() -> e), m);
	}

	public static void sidebar(MinecraftServer server) { }

	// ------------------------------------------------------------------ messages
	public record Particle(String id, double x, double y, double z) {
		Particle(FriendlyByteBuf b) { this(b.readUtf(), b.readDouble(), b.readDouble(), b.readDouble()); }
		void write(FriendlyByteBuf b) { b.writeUtf(id); b.writeDouble(x); b.writeDouble(y); b.writeDouble(z); }
		void handle(Supplier<NetworkEvent.Context> c) { onClient(c.get(), () -> client.particle(id, x, y, z)); }
	}

	public record Bar(List<String> items, int selected, boolean on) {
		Bar(FriendlyByteBuf b) { this(b.readList(FriendlyByteBuf::readUtf), b.readVarInt(), b.readBoolean()); }
		void write(FriendlyByteBuf b) { b.writeCollection(items, FriendlyByteBuf::writeUtf); b.writeVarInt(selected); b.writeBoolean(on); }
		void handle(Supplier<NetworkEvent.Context> c) {
			NetworkEvent.Context ctx = c.get();
			if (ctx.getDirection() == NetworkDirection.PLAY_TO_SERVER) {
				// the client picked a slot / switched technique mode
				ServerPlayer p = ctx.getSender();
				ctx.enqueueWork(() -> { if (p != null) Server.barChoice(p, selected, on); });
				ctx.setPacketHandled(true);
			} else onClient(ctx, () -> client.bar(items, selected, on));
		}
	}

	public record Title(String mode, String text, int in, int stay, int out) {
		Title(FriendlyByteBuf b) { this(b.readUtf(), b.readUtf(262144), b.readVarInt(), b.readVarInt(), b.readVarInt()); }
		void write(FriendlyByteBuf b) { b.writeUtf(mode); b.writeUtf(text, 262144); b.writeVarInt(in); b.writeVarInt(stay); b.writeVarInt(out); }
		void handle(Supplier<NetworkEvent.Context> c) {
			onClient(c.get(), () -> { if (mode.equals("times")) client.titleTimes(in, stay, out); else client.title(mode, text); });
		}
	}

	/** camera shake / fade / set / clear, fog, hud, input permission */
	public record Fx(String kind, String a, String b, String c, float[] f) {
		Fx(FriendlyByteBuf buf) { this(buf.readUtf(), buf.readUtf(), buf.readUtf(), buf.readUtf(), floats(buf)); }
		private static float[] floats(FriendlyByteBuf buf) { int n = buf.readVarInt(); float[] f = new float[n]; for (int i = 0; i < n; i++) f[i] = buf.readFloat(); return f; }
		void write(FriendlyByteBuf buf) { buf.writeUtf(kind); buf.writeUtf(a); buf.writeUtf(b); buf.writeUtf(c); buf.writeVarInt(f.length); for (float x : f) buf.writeFloat(x); }
		void handle(Supplier<NetworkEvent.Context> ctx) {
			onClient(ctx.get(), () -> {
				switch (kind) {
					case "shake" -> client.shake(a.equals("stop"), f[0], f[1], b.equals("rotational"));
					case "fade" -> client.cameraFade(f[0], f[1], f[2], f[3], f[4], f[5]);
					case "set" -> client.cameraSet(a, f[0], b, new Vec3(f[1], f[2], f[3]), f[4], f[5], f[6] > 0, f[7] > 0);
					case "clear" -> client.cameraClear();
					case "fog" -> client.fog(a, b, c);
					case "hud" -> client.hud(a, b);
					case "input" -> client.input(a, b.equals("enabled"));
					case "push" -> client.push(f[0], f[1], f[2]);
					default -> { }
				}
			});
		}
	}

	public record Anim(int entity, String anim, String next, float blendOut, String stop, String controller) {
		Anim(FriendlyByteBuf b) { this(b.readVarInt(), b.readUtf(), b.readUtf(), b.readFloat(), b.readUtf(), b.readUtf()); }
		void write(FriendlyByteBuf b) { b.writeVarInt(entity); b.writeUtf(anim); b.writeUtf(next); b.writeFloat(blendOut); b.writeUtf(stop); b.writeUtf(controller); }
		void handle(Supplier<NetworkEvent.Context> c) { onClient(c.get(), () -> client.animation(entity, anim, next, blendOut, stop, controller)); }
	}

	public record ActorSync(int entity, List<String> groups, List<String[]> props, int variant, int mark, int skin) {
		ActorSync(FriendlyByteBuf b) {
			this(b.readVarInt(), b.readList(FriendlyByteBuf::readUtf), b.readList(x -> new String[] { x.readUtf(), x.readUtf() }), b.readVarInt(), b.readVarInt(), b.readVarInt());
		}
		void write(FriendlyByteBuf b) {
			b.writeVarInt(entity);
			b.writeCollection(groups, FriendlyByteBuf::writeUtf);
			b.writeCollection(props, (x, p) -> { x.writeUtf(p[0]); x.writeUtf(p[1]); });
			b.writeVarInt(variant); b.writeVarInt(mark); b.writeVarInt(skin);
		}
		void handle(Supplier<NetworkEvent.Context> c) { onClient(c.get(), () -> client.actor(entity, groups, props, variant, mark, skin)); }
	}

	/**
	 * The add-on's start menu. Server -> client: which page it's on ("" = closed). Client -> server: a button was hovered
	 * (scroll = which option) or clicked / a key pressed (press = "select" or "next").
	 */
	public record Menu(String page, int scroll, String press) {
		Menu(FriendlyByteBuf b) { this(b.readUtf(), b.readVarInt(), b.readUtf()); }
		void write(FriendlyByteBuf b) { b.writeUtf(page); b.writeVarInt(scroll); b.writeUtf(press); }
		void handle(Supplier<NetworkEvent.Context> c) {
			NetworkEvent.Context ctx = c.get();
			if (ctx.getDirection() == NetworkDirection.PLAY_TO_SERVER) {
				ServerPlayer p = ctx.getSender();
				ctx.enqueueWork(() -> { if (p != null) Server.menu(p, scroll, press); });
				ctx.setPacketHandled(true);
			} else onClient(ctx, () -> client.menu(page));
		}
	}

	/** client -> server: a move key (the selected technique's move number) or the dash key */
	public record Press(String kind, int index) {
		Press(FriendlyByteBuf b) { this(b.readUtf(), b.readVarInt()); }
		void write(FriendlyByteBuf b) { b.writeUtf(kind); b.writeVarInt(index); }
		void handle(Supplier<NetworkEvent.Context> c) {
			NetworkEvent.Context ctx = c.get();
			ServerPlayer p = ctx.getSender();
			ctx.enqueueWork(() -> { if (p != null) Server.press(p, kind, index); });
			ctx.setPacketHandled(true);
		}
	}

	/** client -> server: keys Java's server can't see (jump held), and "use the selected technique" */
	public record Input(boolean jump, boolean use, boolean attack, boolean right) {
		Input(FriendlyByteBuf b) { this(b.readBoolean(), b.readBoolean(), b.readBoolean(), b.readBoolean()); }
		void write(FriendlyByteBuf b) { b.writeBoolean(jump); b.writeBoolean(use); b.writeBoolean(attack); b.writeBoolean(right); }
		void handle(Supplier<NetworkEvent.Context> c) {
			NetworkEvent.Context ctx = c.get();
			ServerPlayer p = ctx.getSender();
			ctx.enqueueWork(() -> { if (p != null) Server.input(p, jump, use, attack, right); });
			ctx.setPacketHandled(true);
		}
	}
}
