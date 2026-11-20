import { world, system } from "@minecraft/server";

/* ========== Domain Clash Damage System ========== */

// Track health to detect damage (WeakMap auto-cleans when entities despawn)
const healthTracker = new WeakMap();

// Cache nearby clasher checks to avoid repeated distance calculations
const nearbyClasherCache = new WeakMap();
let cacheUpdateTick = 0;
const CACHE_INTERVAL = 5; // Update cache every 5 ticks (0.25 seconds)

/**
 * Get entity's current health
 */
function getHealth(entity) {
  try {
    const healthComp = entity.getComponent("minecraft:health");
    return healthComp?.currentValue ?? healthComp?.current ?? healthComp?.value ?? 0;
  } catch {
    return 0;
  }
}

/**
 * Remove from scoreboard (optimized)
 */
function removeScore(entity, objective, value) {
  try {
    const obj = world.scoreboard.getObjective(objective);
    if (!obj) return;
    const current = obj.getScore(entity.scoreboardIdentity) ?? 0;
    obj.setScore(entity.scoreboardIdentity, Math.max(0, current - value));
  } catch {}
}

/**
 * Distance squared calculation (avoids expensive sqrt)
 */
function distanceSquared(loc1, loc2) {
  const dx = loc1.x - loc2.x;
  const dy = loc1.y - loc2.y;
  const dz = loc1.z - loc2.z;
  return dx * dx + dy * dy + dz * dz;
}

/**
 * Check if another clasher is within 50 blocks (cached)
 */
function hasNearbyClasher(entity, allClashers) {
  try {
    // Check cache first
    const cached = nearbyClasherCache.get(entity);
    if (cached !== undefined) return cached;
    
    const location = entity.location;
    const maxDistSq = 50 * 50; // 2500
    
    // Check distance to all other clashers
    for (const clasher of allClashers) {
      if (clasher.id === entity.id) continue; // Skip self
      
      try {
        const distSq = distanceSquared(location, clasher.location);
        if (distSq <= maxDistSq) {
          nearbyClasherCache.set(entity, true);
          return true;
        }
      } catch {
        continue;
      }
    }
    
    nearbyClasherCache.set(entity, false);
    return false;
  } catch {
    return false;
  }
}

/**
 * Main damage detection loop - optimized for performance
 */
system.runInterval(() => {
  const now = system.currentTick;
  
  // Update cache periodically
  if (now - cacheUpdateTick >= CACHE_INTERVAL) {
    cacheUpdateTick = now;
    // Clear cache to force recalculation
    // WeakMap doesn't have clear(), but values will be recalculated
  }
  
  // Get all dimensions (supports entities in any dimension)
  const dimensions = [
    world.getDimension("overworld"),
    world.getDimension("nether"),
    world.getDimension("the_end")
  ];
  
  // Collect all clashers from all dimensions
  const allClashers = [];
  for (const dim of dimensions) {
    try {
      const clashers = dim.getEntities({ tags: ["domainclashing"] });
      if (clashers && clashers.length > 0) {
        allClashers.push(...clashers);
      }
    } catch {}
  }
  
  if (allClashers.length === 0) return;
  
  // Process each clasher
  for (const entity of allClashers) {
    try {
      if (!entity || !entity.isValid()) continue;
      
      const currentHealth = getHealth(entity);
      if (currentHealth === 0) continue; // Skip dead entities
      
      // Get tracked health from previous tick
      let tracked = healthTracker.get(entity);
      
      if (!tracked) {
        // First time seeing this entity, initialize tracking
        healthTracker.set(entity, { health: currentHealth });
        continue;
      }
      
      // Check if health decreased (took damage)
      if (currentHealth < tracked.health) {
        const damageAmount = Math.floor(tracked.health - currentHealth);
        
        // Only check for nearby clashers if damage was taken
        if (damageAmount > 0 && hasNearbyClasher(entity, allClashers)) {
          // Remove domain_resistance equal to damage taken
          removeScore(entity, "domain_resistance", damageAmount);
        }
      }
      
      // Update tracked health
      tracked.health = currentHealth;
      
    } catch (e) {
      // Entity might have become invalid
      continue;
    }
  }
}, 1); // Run every tick for instant damage detection

/* ========== Initialization ========== */
system.runTimeout(() => {
  console.log("[DomainClash] Domain clash damage system initialized");
  console.log("[DomainClash] Supports all entities across all dimensions");
  
  // Create domain_resistance objective if it doesn't exist
  try {
    world.getDimension("overworld").runCommand(`scoreboard objectives add domain_resistance dummy`);
  } catch {
    // Objective already exists
  }
}, 20);






// Track last notified milestone for each player
const lastMilestone = new Map();
// Track sneaking time for barrier strengthening
const sneakingTime = new Map();
const isStrengthening = new Map();

/**
 * Gets a scoreboard value for an entity
 */
function getScore(entity, objectiveName) {
  try {
    const objective = world.scoreboard.getObjective(objectiveName);
    if (!objective) return null;
    
    const participant = objective.getParticipants().find(p => {
      try {
        return p.getEntity()?.id === entity.id;
      } catch {
        return false;
      }
    });
    
    if (!participant) return null;
    
    return objective.getScore(participant);
  } catch {
    return null;
  }
}

/**
 * Sets a scoreboard value for an entity
 */
function setScore(entity, objectiveName, value) {
  try {
    entity.runCommand(`scoreboard players set @s ${objectiveName} ${value}`);
    return true;
  } catch {
    return false;
  }
}

/**
 * Adds to a scoreboard value for an entity
 */
function addScore(entity, objectiveName, amount) {
  try {
    entity.runCommand(`scoreboard players add @s ${objectiveName} ${amount}`);
    return true;
  } catch {
    return false;
  }
}

system.runInterval(() => {
  const overworld = world.getDimension("overworld");
  
  // Check if domain_clash_main with domain_clashing_commence tag exists
  let clashCommenced = false;
  try {
    const clashMains = overworld.getEntities({ 
      type: "ds:domain_clash_main",
      tags: ["domain_clashing_commence"]
    });
    clashCommenced = clashMains.length > 0;
  } catch {}
  
  if (!clashCommenced) {
    lastMilestone.clear();
    sneakingTime.clear();
    isStrengthening.clear();
    return;
  }
  
  // Check all players
  for (const player of world.getPlayers()) {
    try {
      // Get player's domain_resistance and domain_resistancecap scores
      const resistance = getScore(player, "domain_resistance");
      const resistanceCap = getScore(player, "domain_resistancecap");
      
      // Skip if player doesn't have both scores
      if (resistance === null || resistanceCap === null) continue;
      
      // Ensure resistance doesn't exceed cap
      if (resistance > resistanceCap) {
        setScore(player, "domain_resistance", resistanceCap);
        continue; // Skip this tick since we just corrected it
      }
      
      // Calculate percentage (resistance / cap * 100)
      let percentage = 0;
      if (resistanceCap > 0) {
        percentage = Math.floor((resistance / resistanceCap) * 100);
      }
      
      // Calculate milestone (round down to nearest 10)
      const milestone = Math.floor(percentage / 10) * 10;
      
      // Get last notified milestone (default to -1 to ensure first notification works)
      const lastNotified = lastMilestone.get(player.id);
      
      // Only notify if this is a NEW milestone that we haven't notified for yet
      // Use strict inequality to prevent spam at same milestone
      if (lastNotified === undefined || milestone < lastNotified) {
        // Update to current milestone BEFORE sending message
        lastMilestone.set(player.id, milestone);
        
        // Color based on percentage
        let color = "§a"; // Green
        if (percentage <= 20) {
          color = "§c"; // Red (critical)
        } else if (percentage <= 50) {
          color = "§6"; // Gold (warning)
        } else if (percentage <= 70) {
          color = "§e"; // Yellow
        }
        
        // Send message to player with actual values
        player.sendMessage(`${color}Your Domain Resistance: ${percentage}% §7(${resistance}/${resistanceCap})`);
        
        // Play note sound
        player.runCommand("playsound note.pling @s");
      }
    } catch (e) {
      // Silently continue
    }
    
    // Check if player is sneaking for barrier strengthening
    try {
      const isSneaking = player.isSneaking;
      
      if (isSneaking) {
        // Increment sneak time
        const currentSneakTime = sneakingTime.get(player.id) || 0;
        sneakingTime.set(player.id, currentSneakTime + 1);
        
        // Check if player has been sneaking for 5 seconds (100 ticks)
        if (currentSneakTime === 100 && !isStrengthening.get(player.id)) {
          // Start strengthening
          isStrengthening.set(player.id, true);
          player.sendMessage("§b§lStrengthening Barrier...");
          player.runCommand("playsound random.levelup @s");
        }
        
        // If strengthening and enough time has passed, increase resistance
        if (isStrengthening.get(player.id) && currentSneakTime % 5 === 0) {
          // Get current values
          const currentResistance = getScore(player, "domain_resistance");
          const cap = getScore(player, "domain_resistancecap");
          
          // Only increase if below cap
          if (currentResistance !== null && cap !== null && currentResistance < cap) {
            addScore(player, "domain_resistance", 1);
          } else if (currentResistance >= cap) {
            // Hit the cap - notify player
            player.sendMessage("§e§lBarrier at maximum strength!");
            player.runCommand("playsound random.orb @s ~ ~ ~ 0.5");
            isStrengthening.set(player.id, false);
          }
        }
      } else {
        // Player stopped sneaking - reset
        if (isStrengthening.get(player.id)) {
          player.sendMessage("§7Barrier strengthening stopped.");
          player.runCommand("playsound random.break @s ~ ~ ~ 0.5");
        }
        sneakingTime.delete(player.id);
        isStrengthening.delete(player.id);
      }
    } catch {}
  }
}, 1);

console.warn("[Domain Resistance] Percentage-based milestone notifier loaded!");

// Find domain clash winner
function findClashWinner() {
  try {
    // Find all domain_clash_main entities with the tag
    const dimensions = ["overworld", "nether", "the_end"];
    let clashEntity = null;
    
    for (const dimName of dimensions) {
      const dim = world.getDimension(dimName);
      const entities = dim.getEntities({
        type: "ds:domain_clash_main"
      });
      
      for (const entity of entities) {
        if (entity.hasTag("domain_clashing_commence")) {
          clashEntity = entity;
          break;
        }
      }
      
      if (clashEntity) break;
    }
    
    // If no clash entity found, return
    if (!clashEntity) {
      return { success: false };
    }
    
    // Get all players AND entities within 60 blocks
    const clashLoc = clashEntity.location;
    const dimension = clashEntity.dimension;
    
    // Get all entities with domainclashing tag (includes players and mobs)
    const nearbyClashers = dimension.getEntities({
      location: clashLoc,
      maxDistance: 60,
      tags: ["domainclashing"]
    });
    
    if (nearbyClashers.length === 0) {
      return { success: false };
    }
    
    // Get domain_resistance objective
    const objective = world.scoreboard.getObjective("domain_resistance");
    
    if (!objective) {
      return { success: false };
    }
    
    // Find clasher(s) with highest domain_resistance
    let highestScore = -999999;
    let winners = [];
    
    for (const clasher of nearbyClashers) {
      try {
        const score = objective.getScore(clasher);
        
        // Only consider clashers with resistance ABOVE 0
        // If resistance is 0 or below, they've lost
        if (score <= 0) {
          continue;
        }
        
        if (score > highestScore) {
          highestScore = score;
          winners = [clasher];
        } else if (score === highestScore) {
          winners.push(clasher);
        }
      } catch (e) {
        // Clasher doesn't have a score, skip
        continue;
      }
    }
    
    // If no clashers have resistance above 0, no one wins
    if (winners.length === 0 || highestScore <= 0) {
      return { success: false };
    }
    
    // Handle ties by checking detect_health score
    if (winners.length > 1) {
      const healthObjective = world.scoreboard.getObjective("detect_health");
      
      if (healthObjective) {
        let highestHealth = -999999;
        let finalWinner = null;
        
        for (const player of winners) {
          try {
            const health = healthObjective.getScore(player);
            
            if (health > highestHealth) {
              highestHealth = health;
              finalWinner = player;
            }
          } catch (e) {
            // If player doesn't have health score, skip
            continue;
          }
        }
        
        // If we found a winner with health score, use only them
        if (finalWinner) {
          winners = [finalWinner];
        } else {
          // If no one has health scores, just pick the first one
          winners = [winners[0]];
        }
      } else {
        // If detect_health objective doesn't exist, just pick the first player
        winners = [winners[0]];
      }
    }
    
    // Give the single winner the domain_winner tag
    winners[0].addTag("domain_winner");
    
    return { 
      success: true,
      count: winners.length
    };
    
  } catch (e) {
    console.warn("Clash winner error:", e);
    return { success: false };
  }
}

// Listen for scriptevent commands
system.afterEvents.scriptEventReceive.subscribe((event) => {
  const { id, sourceEntity } = event;
  
  if (id === "ds:clash_winner") {
    findClashWinner();
  }
});

console.warn("Domain Clash Winner System loaded!");