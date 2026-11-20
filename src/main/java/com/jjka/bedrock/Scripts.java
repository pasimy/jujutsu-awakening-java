package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.decoration.ArmorStand;
import net.minecraft.world.level.ClipContext;
import net.minecraft.world.phys.AABB;
import net.minecraft.world.phys.BlockHitResult;
import net.minecraft.world.phys.HitResult;
import net.minecraft.world.phys.Vec3;

/**
 * The add-on's JavaScript (scripts/index.js), ported: scriptevent handlers (knockback, leaps, projectiles, raycast ...)
 * and its per-tick systems (cursed energy regeneration, agility speed/jump, moveAngle, item-use tags).
 */
public final class Scripts {
	private Scripts() {}

	/** Bedrock's applyKnockback(dirX, dirZ, horizontal, vertical): halve the current velocity, then push */
	public static void knockback(Entity e, double dx, double dz, double h, double v) {
		Vec3 old = e.getDeltaMovement();
		double len = Math.sqrt(dx * dx + dz * dz);
		double nx = len < 1e-6 ? 0 : dx / len * h, nz = len < 1e-6 ? 0 : dz / len * h;
		push(e, new Vec3(old.x / 2 + nx, old.y / 2 + v, old.z / 2 + nz));
	}

	public static void push(Entity e, Vec3 vel) {
		if (Bedrock.DEBUG != null) Bedrock.DEBUG.accept(e, "push " + vel + " <- " + Commands.LINE);
		e.setDeltaMovement(vel);
		e.hasImpulse = true;
		if (e instanceof ServerPlayer p) Net.CHANNEL.send(net.minecraftforge.network.PacketDistributor.PLAYER.with(() -> p), new Net.Fx("push", "", "", "", new float[] { (float) vel.x, (float) vel.y, (float) vel.z }));
		else e.hurtMarked = true;
	}

	static Vec3 view(Entity e) { return e.getViewVector(1f); }

	public static int event(String id, String message, Commands.Ctx c) {
		Entity src = c.self;
		String[] args = message == null ? new String[0] : message.trim().split("\\s+");
		if (src == null) return 0;
		Vec3 di = view(src);
		switch (id) {
			case "ds:knockback" -> knockback(src, di.x, di.z, f(args, 0), f(args, 1));
			case "sl:knockback" -> knockback(src, di.x, di.z, f(args, 0), f(args, 1));
			case "ds:dashEast" -> knockback(src, di.z, -di.x, -9, 0);
			case "ds:dashWest" -> knockback(src, di.z, -di.x, 9, 0);
			case "ds:upslightly2" -> knockback(src, 0, 0, 0, 0.25);
			case "ds:antiair" -> knockback(src, 0, 0, 0, 0.04);
			case "ds:downfall" -> knockback(src, 0, 0, 0, src.getDeltaMovement().y < 0 ? -3 : -1);
			case "ds:leapforwards" -> knockback(src, di.x, di.z, 7, 2);
			case "ds:leapforwards2" -> knockback(src, di.x, di.z, 3, 0.85);
			case "ds:leapforwards3" -> knockback(src, di.x, di.z, 3, 0.8);
			case "ds:leapbackwards" -> knockback(src, -di.x, -di.z, 3, 0.8);
			case "ds:backward2" -> knockback(src, -di.x, -di.z, 2, 0.3);
			case "ds:backward5" -> knockback(src, -di.x, -di.z, 5, 0.3);
			case "ds:fly" -> knockback(src, di.x, di.z, 1.5, di.y * 1.5);
			case "ds:autoJump2", "ds:auto", "ds:dash" -> autoJump(src, di);
			case "ds:regeneration" -> { if (src instanceof LivingEntity l) l.addEffect(new net.minecraft.world.effect.MobEffectInstance(net.minecraft.world.effect.MobEffects.REGENERATION, 20, 6, false, false)); }
			case "ds:raycast" -> raycast(src, args);
			case "ds:shootprojectile" -> shoot(src, args);
			case "ds:dismantle" -> launch(src, "ds:dismantle", 4.5);
			case "ds:dismantle_small" -> launch(src, "ds:dismantle_small", 7);
			case "ds:dismantle_quick" -> launch(src, "ds:dismantle_quick", 5);
			case "ds:dismantle_quick2" -> launch(src, "ds:dismantle_quick2", 5);
			case "ds:pebble" -> launch(src, "ds:pebble", 2.5);
			case "ds:transfigured_bullet" -> launch(src, "ds:transfigured_human_bullet", 3);
			case "ds:transfigured_worm1" -> launch(src, "ds:transfigured_human_worm", 2);
			default -> Bedrock.warnOnce("script", "Script event not ported yet: " + id);
		}
		return 1;
	}

	private static double f(String[] a, int i) {
		try { return i < a.length ? Double.parseDouble(a[i]) : 0; } catch (NumberFormatException e) { return 0; }
	}

	private static void autoJump(Entity e, Vec3 view) {
		Vec3 start = e.position().add(0, 0.5, 0);
		Vec3 fwd = new Vec3(view.x, 0, view.z);
		double vertical = 0;
		BlockHitResult hit = e.level().clip(new ClipContext(start, start.add(fwd.normalize().scale(4.5)), ClipContext.Block.COLLIDER, ClipContext.Fluid.NONE, e));
		if (hit.getType() == HitResult.Type.BLOCK) {
			int top = e.level().getHeight(net.minecraft.world.level.levelgen.Heightmap.Types.MOTION_BLOCKING, hit.getBlockPos().getX(), hit.getBlockPos().getZ());
			vertical = Math.min(10, top + 1.5 - e.getY());
		}
		knockback(e, view.x, view.z, 6, vertical);
	}

	// ------------------------------------------------------------------ projectiles
	/** spawnEntity in front + minecraft:projectile.shoot(view * speed) */
	private static void launch(Entity shooter, String type, double speed) {
		EntityType<?> t = Types.javaType(type);
		if (t == null) return;
		Vec3 v = view(shooter);
		Entity e = t.create(shooter.level());
		if (e == null) return;
		e.moveTo(shooter.getX() + v.x * 2, shooter.getY() + 1.5 + v.y * 2, shooter.getZ() + v.z * 2, shooter.getYRot(), shooter.getXRot());
		shooter.level().addFreshEntity(e);
		if (e instanceof BedrockEntity b) b.shoot(shooter, v.scale(speed));
		else e.setDeltaMovement(v.scale(speed));
	}

	private record Flight(Entity projectile, Vec3 velocity, int[] age) {}

	private static final List<Flight> FLIGHTS = new ArrayList<>();

	private static void shoot(Entity shooter, String[] args) {
		if (args.length < 2) return;
		String type = args[0], name = args[1];
		double velocity = 3;
		String score = null;
		Integer value = null;
		boolean nearest = false;
		for (int i = 2; i < args.length; i++) {
			if (args[i].startsWith("velocity:")) velocity = f(new String[] { args[i].substring(9) }, 0);
			else if (args[i].equals("scores:") && i + 2 < args.length) { score = args[i + 1]; try { value = Integer.parseInt(args[i + 2]); } catch (NumberFormatException ignored) { } i += 2; }
			else if (args[i].equals("nearestTypeApply")) nearest = true;
		}
		Vec3 view = view(shooter);
		Entity p = null;
		if (nearest) {
			EntityType<?> t = Types.javaType(type);
			double best = 50 * 50;
			for (Entity e : shooter.level().getEntities((Entity) null, shooter.getBoundingBox().inflate(50), x -> x.getType() == t)) {
				if (!name.equals("null") && !name.equals("none") && !(e.hasCustomName() && e.getCustomName().getString().equals(name))) continue;
				double d = e.distanceToSqr(shooter);
				if (d < best) { best = d; p = e; }
			}
			if (p == null) { if (shooter instanceof ServerPlayer sp) sp.sendSystemMessage(Component.literal("§cNo matching entity found nearby!")); return; }
		} else {
			EntityType<?> t = Types.javaType(type);
			if (t == null) return;
			p = t.create(shooter.level());
			if (p == null) return;
			float yaw = (float) Math.toDegrees(Math.atan2(-view.x, view.z)), pitch = (float) Math.toDegrees(Math.asin(-view.y));
			p.moveTo(shooter.getX() + view.x * 0.1, shooter.getY() + 0.1 + view.y * 0.1, shooter.getZ() + view.z * 0.1, yaw, pitch);
			if (!name.equals("null") && !name.equals("none")) p.setCustomName(Component.literal(name));
			shooter.level().addFreshEntity(p);
		}
		if (score != null && value != null && Scores.current() != null) Scores.current().set(p, score, value);
		FLIGHTS.add(new Flight(p, view.scale(velocity), new int[1]));
	}

	private static void raycast(Entity player, String[] args) {
		if (args.length < 3) return;
		double max = f(args, 0), thick = f(args, 1);
		String fn = args[2];
		Vec3 view = view(player);
		Vec3 eye = player.getEyePosition();
		Entity best = null;
		AABB box = player.getBoundingBox().expandTowards(view.scale(max)).inflate(thick + 1);
		outer:
		for (Entity e : player.level().getEntities(player, box, x -> !(x instanceof ServerPlayer sp && sp == player))) {
			for (double d = 0; d <= max; d += 1) {
				Vec3 pt = player.position().add(view.scale(d));
				if (e.position().distanceToSqr(pt) <= thick * thick) { best = e; break outer; }
			}
		}
		Commands.Ctx c = Commands.Ctx.of(player);
		if (best != null) { c.pos = best.position(); Functions.run(fn, c); return; }
		BlockHitResult hit = player.level().clip(new ClipContext(eye, eye.add(view.scale(max)), ClipContext.Block.COLLIDER, ClipContext.Fluid.NONE, player));
		if (hit.getType() == HitResult.Type.BLOCK) {
			Vec3 at = Vec3.atLowerCornerOf(hit.getBlockPos()).subtract(view.scale(0.8)).add(0.5, 1.5, 0.5);
			c.pos = at;
			Functions.run(fn, c);
		}
	}

	// ------------------------------------------------------------------ every tick
	private static int counter;
	private static final Map<ServerPlayer, String> AGILITY = new HashMap<>();

	public static void tick(MinecraftServer server) {
		Scores s = Scores.get(server);
		counter++;
		List<ServerPlayer> players = server.getPlayerList().getPlayers();
		// moveAngle (every tick)
		for (ServerPlayer p : players) {
			Vec3 v = p.getDeltaMovement(), di = view(p);
			double a = Math.atan2(v.z, v.x) - Math.atan2(di.z, di.x);
			int ang = (int) Math.round(((Math.toDegrees(a) + 360) % 360 + 360) % 360);
			s.set(p, "moveAngle", ang);
		}
		// managed projectiles
		for (Iterator<Flight> it = FLIGHTS.iterator(); it.hasNext();) {
			Flight f = it.next();
			Entity p = f.projectile;
			if (p.isRemoved() || ++f.age[0] > 200) { if (!p.isRemoved() && f.age[0] > 200) p.discard(); it.remove(); continue; }
			Vec3 v = f.velocity;
			float yaw = (float) Math.toDegrees(Math.atan2(-v.x, v.z)), pitch = (float) Math.toDegrees(Math.asin(-v.y / Math.max(1e-6, v.length())));
			p.moveTo(p.getX() + v.x, p.getY() + v.y, p.getZ() + v.z, yaw, pitch);
		}
		if (counter % 2 == 0) dynamicEffects(players, s);
		if (counter % 20 == 0) { infiniteEffects(players, s); entityEffects(server, s); }
		if (counter % 20 == 0) regen(players, s);
		if (counter % 4 == 0) for (ServerPlayer p : players) {
			int combat = s.getOr(p, "combat", 0), fuga = s.getOr(p, "fuga", 0);
			if (combat >= 0 && combat <= 350) { if (fuga >= 4) s.set(p, "fuga", fuga - 4); else if (fuga > 0) s.set(p, "fuga", 0); }
		}
		if (counter % 200 == 0) for (ServerPlayer p : players) {
			if (s.getOr(p, "Stun", 0) > 0) continue;
			if (p.getTags().contains("curse") || p.getTags().contains("heavenlyrestriction")) Commands.runAs(p, "effect @s regeneration 5 0 true");
		}
	}

	private static void regen(List<ServerPlayer> players, Scores s) {
		for (ServerPlayer p : players) {
			if (p.getTags().contains("heavenlyrestriction") || p.getTags().contains("domainclashing")) continue;
			int energy = s.getOr(p, "Energy", 0), cap = s.getOr(p, "EnergyCap", 0), move = s.getOr(p, "move", 0), dom = s.getOr(p, "domainactive", 0);
			if (move >= 1 || dom >= 1 || cap <= 0 || energy >= cap) continue;
			int per = (int) Math.ceil(cap / 90.0);
			s.set(p, "Energy", Math.min(energy + per, cap));
		}
	}

	private static void dynamicEffects(List<ServerPlayer> players, Scores s) {
		for (ServerPlayer p : players) {
			if (p.isSpectator()) continue;
			int agility = s.getOr(p, "agility", 0), sprint = s.getOr(p, "detect_sprint", 0);
			if (sprint >= 1) {
				int amp = p.getTags().contains("heian_era") ? 15 : agility >= 50 ? 4 : agility >= 40 ? 3 : agility >= 30 ? 2 : agility >= 20 ? 1 : agility >= 10 ? 0 : -1;
				if (amp >= 0) Commands.runAs(p, "effect @s speed 2 " + amp + " true");
			}
			int move = s.getOr(p, "move", 0);
			if (move >= 0 && move <= 5) {
				if (p.getTags().contains("satiated")) Commands.runAs(p, "effect @s saturation 3 3 true");
				else if (p.getTags().contains("curse")) Commands.runAs(p, "effect @s saturation 3 1 true");
			}
			if (p.getTags().contains("exoskeleton") && s.getOr(p, "Stun", 0) >= 1) Commands.runAs(p, "effect @s resistance 2 0 true");
		}
	}

	private static void infiniteEffects(List<ServerPlayer> players, Scores s) {
		for (ServerPlayer p : players) {
			int agility = s.getOr(p, "agility", 0);
			String key = String.valueOf(agility);
			if (key.equals(AGILITY.get(p))) continue;
			AGILITY.put(p, key);
			if (agility >= 45) Commands.runAs(p, "effect @s jump_boost infinite 2 true");
			else if (agility >= 30) Commands.runAs(p, "effect @s jump_boost infinite 1 true");
			else if (agility >= 15) Commands.runAs(p, "effect @s jump_boost infinite 0 true");
			else Commands.runAs(p, "effect @s clear jump_boost");
		}
		AGILITY.keySet().removeIf(Entity::isRemoved);
	}

	private static void entityEffects(MinecraftServer server, Scores s) {
		for (Entity e : server.overworld().getAllEntities()) {
			if (e instanceof ArmorStand a && s.getOr(a, "Deleter", 0) >= 1 && !a.isInvisible()) a.setInvisible(true);
			if (e instanceof LivingEntity l && (s.getOr(e, "BasicM1s", 0) >= 1 || s.getOr(e, "AfterAnim", 0) >= 1)) l.removeEffect(net.minecraft.world.effect.MobEffects.MOVEMENT_SPEED);
		}
	}

	/** A player respawned: the agility effects go back on */
	public static void respawned(ServerPlayer p) { AGILITY.remove(p); }

	public static void reset() { counter = 0; FLIGHTS.clear(); AGILITY.clear(); }
}
