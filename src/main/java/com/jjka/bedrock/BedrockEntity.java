package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.syncher.EntityDataAccessor;
import net.minecraft.network.syncher.EntityDataSerializers;
import net.minecraft.network.syncher.SynchedEntityData;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityDimensions;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.MobCategory;
import net.minecraft.world.entity.PathfinderMob;
import net.minecraft.world.entity.Pose;
import net.minecraft.world.entity.ai.attributes.AttributeInstance;
import net.minecraft.world.entity.ai.attributes.AttributeSupplier;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.entity.ai.goal.FloatGoal;
import net.minecraft.world.entity.ai.goal.LookAtPlayerGoal;
import net.minecraft.world.entity.ai.goal.MeleeAttackGoal;
import net.minecraft.world.entity.ai.goal.MoveTowardsTargetGoal;
import net.minecraft.world.entity.ai.goal.RandomLookAroundGoal;
import net.minecraft.world.entity.ai.goal.WaterAvoidingRandomStrollGoal;
import net.minecraft.world.entity.ai.goal.target.HurtByTargetGoal;
import net.minecraft.world.entity.ai.goal.target.NearestAttackableTargetGoal;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.level.Level;
import net.minecraft.world.phys.Vec3;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

/**
 * Every entity in the behaviour pack (ds:projectile, ds:lapse_explode, curses, shikigami ...) is one of these, driven by its
 * definition: health, size, physics, explode, timers, sensors, damage sensor, events and a set of AI behaviours.
 */
public class BedrockEntity extends PathfinderMob {
	public record Kind(EntityDef def, RegistryObject<EntityType<BedrockEntity>> type) {}

	private static final Map<String, Kind> KINDS = new HashMap<>();
	private static final Map<EntityType<?>, Kind> BY_TYPE = new HashMap<>();
	private static final EntityDataAccessor<String> SPAWN_EVENT = SynchedEntityData.defineId(BedrockEntity.class, EntityDataSerializers.STRING);

	public static void register(DeferredRegister<EntityType<?>> reg) {
		for (EntityDef d : EntityDef.all().values()) {
			if (d.id.startsWith("minecraft:")) continue;
			JsonObject box = d.components.has("minecraft:collision_box") ? d.components.getAsJsonObject("minecraft:collision_box") : null;
			float w = box != null && box.has("width") ? box.get("width").getAsFloat() : 0.6f, h = box != null && box.has("height") ? box.get("height").getAsFloat() : 1.8f;
			MobCategory cat = MobCategory.MISC;
			Kind[] holder = new Kind[1];
			RegistryObject<EntityType<BedrockEntity>> ro = reg.register(Bedrock.path(d.id), () -> EntityType.Builder
					.<BedrockEntity>of((t, l) -> new BedrockEntity(t, l), cat)
					.sized(Math.max(0.01f, w), Math.max(0.01f, h)).clientTrackingRange(10).updateInterval(1)
					.build(Bedrock.MODID + ":" + Bedrock.path(d.id)));
			holder[0] = new Kind(d, ro);
			KINDS.put(d.id, holder[0]);
		}
	}

	public static Iterable<Kind> kinds() { return KINDS.values(); }

	public static Kind kindOf(EntityType<?> t) {
		if (BY_TYPE.isEmpty()) for (Kind k : KINDS.values()) if (k.type.isPresent()) BY_TYPE.put(k.type.get(), k);
		return BY_TYPE.get(t);
	}

	public static EntityType<BedrockEntity> typeOf(String id) {
		Kind k = KINDS.get(Bedrock.id(id));
		return k == null || !k.type.isPresent() ? null : k.type.get();
	}

	public static AttributeSupplier attributes() {
		return PathfinderMob.createMobAttributes().add(Attributes.ATTACK_DAMAGE, 2).add(Attributes.FOLLOW_RANGE, 32)
				.add(Attributes.MOVEMENT_SPEED, 0.25).add(Attributes.KNOCKBACK_RESISTANCE, 0).add(Attributes.MAX_HEALTH, 20)
				.add(Attributes.FLYING_SPEED, 0.4).build();
	}

	// ------------------------------------------------------------------ instance
	private EntityDef def;
	private boolean healthSet;
	private int fuse = -1;
	private float explodePower;
	private boolean explodeBreaks, explodeFire;
	private float scale = 1;
	private EntityDimensions dims;

	protected BedrockEntity(EntityType<? extends PathfinderMob> type, Level level) {
		super(type, level);
		setPersistenceRequired();
	}

	public EntityDef def() {
		if (def == null) { Kind k = kindOf(getType()); def = k == null ? null : k.def; }
		return def;
	}

	public Actor actor() { return Actor.of(this); }

	@Override
	protected void defineSynchedData() {
		super.defineSynchedData();
		entityData.define(SPAWN_EVENT, "");
	}

	/** summon ... <spawnEvent> */
	public void spawnEvent(String event) { entityData.set(SPAWN_EVENT, event == null ? "" : event); }

	public float scale() { return scale; }

	// ------------------------------------------------------------------ components -> Java
	void applyComponents() {
		Actor a = actor();
		JsonObject c = a.components();
		if (c.has("minecraft:instant_despawn")) { discard(); return; }
		JsonObject health = a.component("minecraft:health");
		if (health != null) {
			double max = health.has("max") ? health.get("max").getAsDouble() : range(health.get("value"));
			set(Attributes.MAX_HEALTH, Math.max(1, max));
			if (!healthSet && !getPersistentData().getBoolean("jjka_health")) { setHealth((float) Math.max(1, range(health.get("value")))); getPersistentData().putBoolean("jjka_health", true); }
			healthSet = true;
		}
		JsonObject move = a.component("minecraft:movement");
		if (move != null) set(Attributes.MOVEMENT_SPEED, range(move.get("value")));
		JsonObject attack = a.component("minecraft:attack");
		if (attack != null) set(Attributes.ATTACK_DAMAGE, range(attack.get("damage")));
		JsonObject kb = a.component("minecraft:knockback_resistance");
		if (kb != null) set(Attributes.KNOCKBACK_RESISTANCE, range(kb.get("value")));
		JsonObject follow = a.component("minecraft:follow_range");
		if (follow != null) set(Attributes.FOLLOW_RANGE, range(follow.get("value")));
		JsonObject physics = a.component("minecraft:physics");
		boolean gravity = physics == null || !physics.has("has_gravity") || physics.get("has_gravity").getAsBoolean();
		boolean collide = physics == null || !physics.has("has_collision") || physics.get("has_collision").getAsBoolean();
		setNoGravity(!gravity || c.has("minecraft:can_fly") || c.has("minecraft:navigation.fly") || c.has("minecraft:navigation.hover"));
		noPhysics = !collide;
		JsonObject sc = a.component("minecraft:scale");
		scale = sc != null && sc.has("value") ? (float) range(sc.get("value")) : 1f;
		JsonObject box = a.component("minecraft:collision_box");
		float w = box != null && box.has("width") ? box.get("width").getAsFloat() : 0.6f, h = box != null && box.has("height") ? box.get("height").getAsFloat() : 1.8f;
		EntityDimensions nd = EntityDimensions.scalable(Math.max(0.01f, w), Math.max(0.01f, h));
		if (dims == null || dims.width != nd.width || dims.height != nd.height) { dims = nd; refreshDimensions(); }
		JsonObject ex = a.component("minecraft:explode");
		if (ex != null && fuse < 0) {
			double len = ex.has("fuse_length") ? range(ex.get("fuse_length")) : 0;
			boolean lit = !ex.has("fuse_lit") || ex.get("fuse_lit").getAsBoolean();
			if (lit) {
				fuse = (int) Math.round(len * 20);
				explodePower = ex.has("power") ? (float) ex.get("power").getAsDouble() : 3;
				explodeBreaks = (!ex.has("breaks_blocks") || ex.get("breaks_blocks").getAsBoolean());
				explodeFire = ex.has("causes_fire") && ex.get("causes_fire").getAsBoolean();
			}
		}
		if (c.has("minecraft:fire_immune")) clearFire();
		goals(a);
	}

	@Override
	public boolean fireImmune() { return def() != null && Actor.of(this).has("minecraft:fire_immune") || super.fireImmune(); }

	private void set(net.minecraft.world.entity.ai.attributes.Attribute attr, double v) {
		AttributeInstance i = getAttribute(attr);
		if (i != null && i.getBaseValue() != v) i.setBaseValue(v);
	}

	static double range(JsonElement j) {
		if (j == null) return 0;
		if (j.isJsonArray()) { JsonArray a = j.getAsJsonArray(); return a.size() == 0 ? 0 : a.get(0).getAsDouble() + Math.random() * (a.get(a.size() - 1).getAsDouble() - a.get(0).getAsDouble()); }
		if (j.isJsonObject()) {
			JsonObject o = j.getAsJsonObject();
			if (o.has("range_min")) return o.get("range_min").getAsDouble() + Math.random() * (o.get("range_max").getAsDouble() - o.get("range_min").getAsDouble());
			if (o.has("value")) return range(o.get("value"));
			return 0;
		}
		try { return j.getAsDouble(); } catch (RuntimeException e) { return 0; }
	}

	@Override
	public EntityDimensions getDimensions(Pose pose) {
		return dims == null ? super.getDimensions(pose) : dims;
	}

	// ------------------------------------------------------------------ AI
	private String goalsFor;

	private void goals(Actor a) {
		if (level().isClientSide) return;
		JsonObject c = a.components();
		StringBuilder key = new StringBuilder();
		for (String k : c.keySet()) if (k.startsWith("minecraft:behavior.")) key.append(k).append(';');
		if (key.toString().equals(goalsFor)) return;
		goalsFor = key.toString();
		goalSelector.removeAllGoals(g -> true);
		targetSelector.removeAllGoals(g -> true);
		for (var e : c.entrySet()) {
			if (!e.getKey().startsWith("minecraft:behavior.") || !e.getValue().isJsonObject()) continue;
			JsonObject b = e.getValue().getAsJsonObject();
			int pri = b.has("priority") ? b.get("priority").getAsInt() : 5;
			double speed = b.has("speed_multiplier") ? b.get("speed_multiplier").getAsDouble() : 1;
			switch (e.getKey().substring("minecraft:behavior.".length())) {
				case "float" -> goalSelector.addGoal(pri, new FloatGoal(this));
				case "melee_attack", "melee_box_attack", "delayed_attack" -> goalSelector.addGoal(pri, new MeleeAttackGoal(this, speed, !b.has("track_target") || b.get("track_target").getAsBoolean()));
				case "random_stroll", "random_hover" -> goalSelector.addGoal(pri, new WaterAvoidingRandomStrollGoal(this, speed));
				case "look_at_player", "look_at_entity" -> goalSelector.addGoal(pri, new LookAtPlayerGoal(this, Player.class, b.has("look_distance") ? b.get("look_distance").getAsFloat() : 8f));
				case "random_look_around" -> goalSelector.addGoal(pri, new RandomLookAroundGoal(this));
				case "move_towards_target" -> goalSelector.addGoal(pri, new MoveTowardsTargetGoal(this, speed, b.has("within_radius") ? b.get("within_radius").getAsFloat() : 16f));
				case "hurt_by_target" -> targetSelector.addGoal(pri, new HurtByTargetGoal(this));
				case "nearest_attackable_target", "nearest_prioritized_attackable_target" -> targetSelector.addGoal(pri, target(b));
				default -> { }
			}
		}
	}

	private NearestAttackableTargetGoal<LivingEntity> target(JsonObject b) {
		boolean mustSee = b.has("must_see") && b.get("must_see").getAsBoolean();
		List<JsonObject> types = new ArrayList<>();
		if (b.has("entity_types")) {
			JsonElement t = b.get("entity_types");
			if (t.isJsonArray()) for (JsonElement x : t.getAsJsonArray()) types.add(x.getAsJsonObject());
			else if (t.isJsonObject()) types.add(t.getAsJsonObject());
		}
		Predicate<LivingEntity> pick = target -> {
			if (types.isEmpty()) return target instanceof Player;
			for (JsonObject t : types) {
				double max = t.has("max_dist") ? t.get("max_dist").getAsDouble() : 32;
				if (target.distanceTo(this) > max) continue;
				if (Filters.test(t.get("filters"), new Filters.Ctx(this, target, null, null, null))) return true;
			}
			return false;
		};
		return new NearestAttackableTargetGoal<>(this, LivingEntity.class, 10, mustSee, false, pick);
	}

	// ------------------------------------------------------------------ ticking
	@Override
	public void tick() {
		super.tick();
		if (level() instanceof ServerLevel sl) {
			Actor a = actor();
			if (tickCount == 1 || !a.groupsChangedOnce) { a.groupsChanged = true; a.apply(); a.groupsChangedOnce = true; }
			String ev = entityData.get(SPAWN_EVENT);
			a.spawnedOnce(ev.isEmpty() ? null : ev);
			a.tick();
			if (flying != null && isAlive()) fly(sl);
			if (fuse >= 0 && isAlive()) {
				if (fuse-- <= 0) {
					fuse = -1;
					boolean griefing = sl.getGameRules().getBoolean(net.minecraft.world.level.GameRules.RULE_MOBGRIEFING);
					sl.explode(this, getX(), getY(), getZ(), explodePower, explodeFire,
							explodeBreaks && griefing ? Level.ExplosionInteraction.MOB : Level.ExplosionInteraction.NONE);
					discard();
				}
			}
		}
	}

	@Override
	protected void customServerAiStep() {
		super.customServerAiStep();
	}

	// ------------------------------------------------------------------ minecraft:projectile
	private Vec3 flying;
	private Entity shooter;

	/** projectileComponent.shoot(velocity) */
	public void shoot(Entity owner, Vec3 velocity) {
		shooter = owner;
		flying = velocity;
		setDeltaMovement(velocity);
	}

	private void fly(ServerLevel sl) {
		JsonObject p = actor().component("minecraft:projectile");
		if (p == null) { flying = null; return; }
		double gravity = p.has("gravity") ? p.get("gravity").getAsDouble() : 0.05;
		double inertia = p.has("inertia") ? p.get("inertia").getAsDouble() : 0.99;
		Vec3 from = position(), to = from.add(flying);
		net.minecraft.world.phys.BlockHitResult block = sl.clip(new net.minecraft.world.level.ClipContext(from, to,
				net.minecraft.world.level.ClipContext.Block.COLLIDER, net.minecraft.world.level.ClipContext.Fluid.NONE, this));
		if (block.getType() != net.minecraft.world.phys.HitResult.Type.MISS) to = block.getLocation();
		net.minecraft.world.phys.EntityHitResult hit = net.minecraft.world.entity.projectile.ProjectileUtil.getEntityHitResult(sl, this, from, to,
				getBoundingBox().expandTowards(flying).inflate(1), e -> e != this && e != shooter && e.isPickable() && !(e instanceof BedrockEntity b && b.def() == def()));
		float yaw = (float) Math.toDegrees(Math.atan2(-flying.x, flying.z)), pitch = (float) Math.toDegrees(Math.asin(-flying.y / Math.max(1e-6, flying.length())));
		if (hit != null) { moveTo(hit.getLocation().x, hit.getLocation().y, hit.getLocation().z, yaw, pitch); hit(p, hit.getEntity()); return; }
		moveTo(to.x, to.y, to.z, yaw, pitch);
		if (block.getType() != net.minecraft.world.phys.HitResult.Type.MISS) { hit(p, null); return; }
		flying = flying.scale(inertia).subtract(0, gravity, 0);
		setDeltaMovement(flying);
	}

	private void hit(JsonObject p, Entity target) {
		JsonObject on = p.has("on_hit") ? p.getAsJsonObject("on_hit") : new JsonObject();
		Filters.Ctx ctx = new Filters.Ctx(this, target, target, shooter, shooter instanceof Player ? shooter : null);
		if (target instanceof LivingEntity l && on.has("impact_damage")) {
			JsonObject d = on.getAsJsonObject("impact_damage");
			float dmg = d.has("damage") ? (float) range(d.get("damage")) : 1;
			String filter = d.has("filter") ? d.get("filter").getAsString() : null;
			if (filter == null || Actor.typeId(target).equals(Bedrock.id(filter))) {
				DamageSource src = shooter instanceof Player pl ? damageSources().playerAttack(pl) : shooter instanceof LivingEntity le ? damageSources().mobAttack(le) : damageSources().generic();
				l.hurt(src, dmg);
			}
		}
		if (on.has("definition_event")) {
			JsonObject de = on.getAsJsonObject("definition_event");
			JsonObject trig = de.has("event_trigger") ? de.getAsJsonObject("event_trigger") : null;
			if (trig != null && trig.has("event")) {
				String target2 = trig.has("target") ? trig.get("target").getAsString() : "self";
				Entity who = ctx.subject(target2);
				if (who != null) Actor.of(who).event(trig.get("event").getAsString(), ctx);
			}
		}
		boolean stick = on.has("stick_in_ground");
		if (on.has("remove_on_hit") || !stick) { if (on.has("remove_on_hit")) discard(); }
		flying = null;
		setDeltaMovement(Vec3.ZERO);
	}

	// ------------------------------------------------------------------ damage
	@Override
	public boolean hurt(DamageSource source, float amount) {
		if (level().isClientSide || def() == null) return super.hurt(source, amount);
		Server.Sensed s = Server.damageSensor(actor(), source, amount);
		if (!s.deals()) return false;
		return super.hurt(source, s.amount());
	}

	@Override
	public boolean isPushable() {
		JsonObject p = def() == null ? null : actor().component("minecraft:pushable");
		return (p == null || !p.has("is_pushable") || p.get("is_pushable").getAsBoolean()) && super.isPushable();
	}

	@Override
	protected void doPush(Entity e) {
		if (isPushable()) super.doPush(e);
	}

	@Override
	public boolean removeWhenFarAway(double distance) { return false; }

	@Override
	public boolean canBeLeashed(Player player) { return false; }

	@Override
	protected boolean shouldDespawnInPeaceful() { return false; }

	@Override
	public boolean isPersistenceRequired() { return true; }

	@Override
	public boolean canBeCollidedWith() { return !noPhysics && super.canBeCollidedWith(); }

	@Override
	public boolean isPickable() {
		JsonObject box = def() == null ? null : actor().component("minecraft:collision_box");
		return super.isPickable() && !(box != null && box.has("width") && box.get("width").getAsDouble() < 0.11);
	}

	@Override
	public void addAdditionalSaveData(CompoundTag tag) {
		super.addAdditionalSaveData(tag);
		tag.putString("SpawnEvent", entityData.get(SPAWN_EVENT));
	}

	@Override
	public void readAdditionalSaveData(CompoundTag tag) {
		super.readAdditionalSaveData(tag);
		entityData.set(SPAWN_EVENT, tag.getString("SpawnEvent"));
	}

	// ------------------------------------------------------------------ riding (minecraft:rideable)
	@Override
	protected boolean canAddPassenger(Entity passenger) {
		JsonObject r = def() == null ? null : actor().component("minecraft:rideable");
		if (r == null) return false;
		int seats = r.has("seat_count") ? r.get("seat_count").getAsInt() : 1;
		return getPassengers().size() < seats;
	}

	@Override
	protected void positionRider(Entity passenger, MoveFunction move) {
		JsonObject r = def() == null ? null : actor().component("minecraft:rideable");
		Vec3 off = Vec3.ZERO;
		if (r != null && r.has("seats")) {
			JsonElement seats = r.get("seats");
			JsonObject seat = seats.isJsonArray() ? seats.getAsJsonArray().get(Math.min(getPassengers().indexOf(passenger), seats.getAsJsonArray().size() - 1)).getAsJsonObject() : seats.getAsJsonObject();
			if (seat.has("position")) { JsonArray p = seat.getAsJsonArray("position"); off = new Vec3(p.get(0).getAsDouble(), p.get(1).getAsDouble(), p.get(2).getAsDouble()); }
		}
		Vec3 rot = off.yRot((float) Math.toRadians(-getYRot()));
		move.accept(passenger, getX() + rot.x, getY() + rot.y, getZ() + rot.z);
	}

	@Override
	public double getPassengersRidingOffset() { return 0; }
}
