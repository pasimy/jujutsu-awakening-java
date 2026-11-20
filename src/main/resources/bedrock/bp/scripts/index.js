
//imports
import "./domain_clashing.js";

import { system, BlockPermutation, world } from "@minecraft/server";
import { ActionFormData } from "@minecraft/server-ui";

const ui = new ActionFormData()
ui.title("Settings")
ui.body("")
ui.button("Impact frames (Fixes Crashes)")
ui.button("Block Destruction/Griefing")
ui.button("Toggle Custom Mob Event Spawning")
ui.button("Toggle Cooldowns")
ui.button("Toggle Menu Screen")
ui.button("Toggle Mission Cooldowns")
ui.button("Only allow one Sukuna Vessel")
ui.button("button8")
ui.button("button9")
ui.button("button10");

world.afterEvents.itemUse.subscribe(event => {
  const { source, itemStack } = event;

  if (itemStack.typeId === 'ds:settings') {
    ui.show(source).then(result => {
      if (result.selection === 0) source.runCommand('function setting_impactframes');
      if (result.selection === 1) source.runCommand('function setting_griefing');
      if (result.selection === 2) source.runCommand('function setting_mobevents');
      if (result.selection === 3) source.runCommand('function setting_nocds');
      if (result.selection === 4) source.runCommand('function setting_menu');
      if (result.selection === 5) source.runCommand('function setting_nomissioncds');
      if (result.selection === 6) source.runCommand('function setting_only_one_sukuna');
      if (result.selection === 7) source.runCommand('function button8_setting');
      if (result.selection === 8) source.runCommand('function button9_setting');
      if (result.selection === 9) source.runCommand('function button10_setting');
    }).catch(error => {
      console.error("Error showing UI: ", error);
    });
  }
});


const processedThisTick = new Set();

world.beforeEvents.itemUse.subscribe(({ itemStack, source }) => {
  const itemId = `itemUse:${itemStack.typeId}`;
  if (!processedThisTick.has(itemId)) {
    system.run(() => {
      source.addTag(itemId);
    });
    system.runTimeout(() => {
      source.removeTag(itemId);
      processedThisTick.delete(itemId);
    }, 1); // Adjusted timeout to 1 tick
    processedThisTick.add(itemId);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:dismantle":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:dismantle', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 4.5;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:dismantle_small":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:dismantle_small', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 7;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:dismantle_quick":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:dismantle_quick', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 5;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:dismantle_quick2":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:dismantle_quick2', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 5;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

var circleGen1ID = null;
var circleGen2ID = null;

// Subscribe to events
system.afterEvents.scriptEventReceive.subscribe((event) => {
  const { id, message, sourceEntity } = event;

  const di = sourceEntity.getViewDirection();
  const args = message.split(" ");

  switch (id) {
    case "ds:knockback":
      sourceEntity.applyKnockback(di.x, di.z, parseFloat(args[0] || "0"), parseFloat(args[1] || "0"));
      break;
    case "ds:dashEast":
      sourceEntity.applyKnockback(di.z, -di.x, -9, 0);
      break;
    case "ds:dashWest":
      sourceEntity.applyKnockback(di.z, -di.x, 9, 0);
      break;
    case "ds:dashWest":
      sourceEntity.applyKnockback(di.z, -di.x, 9, 0);
      break;
      case "ds:upslightly2":
        const upwardForce2 = 0.25;
        sourceEntity.applyKnockback(0, 0, 0, upwardForce2); 
        break;
    case "ds:shockwave":
      const { x, y, z } = sourceEntity.location;
      const dimension = sourceEntity.dimension;
      const blockPerm = BlockPermutation.resolve('minecraft:air');
      const startingLocation = { dimension, x, y: y, z }; // 10 blocks above the button
 
      circleGen1ID = system.runJob(circleGenerator(blockPerm, startingLocation, 64, 64));
      circleGen2ID = system.runJob(circleGenerator2(blockPerm, startingLocation, 64, 64));
      circleGen1ID = system.runJob(circleGenerator(blockPerm, startingLocation, 128, 128));
      circleGen2ID = system.runJob(circleGenerator2(blockPerm, startingLocation, 128, 128));
      break;
    case "ds:shockwave_stop":
      system.clearJob(circleGen1ID);
      system.clearJob(circleGen2ID);

      circleGen1ID = null;
      circleGen2ID = null;
      break;
    case "ds:antiair":
      // Apply upward knockback to cancel out falling
      const upwardForce = 0.04; // Adjust this value to match gravity or slightly higher
      sourceEntity.applyKnockback(0, 0, 0, upwardForce); // No horizontal movement, only apply upward force
      break;
    case "ds:downfall":
      // Get the player's current velocity
      const anti_velo2 = sourceEntity.getVelocity();

      // Define an initial downward boost
      const initialBoost = 3; // Adjust this value for the desired initial boost amount
      const fallSpeed = 1;     // Desired consistent downward speed after boost

      // Check if the player is falling (negative Y velocity)
      if (anti_velo2.y < 0) {
        // Apply a large downward boost only if already falling
        sourceEntity.applyKnockback(0, 0, 0, -initialBoost);
      } else {
        // If not falling, apply a constant downward speed
        sourceEntity.applyKnockback(0, 0, 0, -fallSpeed); // Apply a consistent downward velocity
      }
        break;

    case "ds:leapforwards":
      const dir1 = sourceEntity.getViewDirection();
      sourceEntity.applyKnockback(dir1.x, dir1.z, 7, 2);
      break;
    case "ds:leapforwards2":
      const dir2 = sourceEntity.getViewDirection();
      sourceEntity.applyKnockback(dir2.x, dir2.z, 3, 0.85);
      break;
    case "ds:leapforwards3":
      const dir3 = sourceEntity.getViewDirection();
      sourceEntity.applyKnockback(dir3.x, dir3.z, 3, 0.8);
      break;


      case "ds:autoJump2":
          const MAX_STEP_HEIGHT = 10;
          const MAX_SEARCH_FORWARD = 4.5;
          const MAX_SEARCH_DOWN = 5;
      
          let verticalVelocity = 0;
      
          // Player's current location and velocity
          const playerPos = sourceEntity.location
          const view = sourceEntity.getViewDirection();
      
          // Calculate the ray starting position (0.5 blocks above the player's leg position)
          const rayStartPos = { x: playerPos.x, y: playerPos.y + 0.5, z: playerPos.z };
          const forwardRay = { x: view.x, y: 0, z: view.z };
      
          try {
              const raycastResult = sourceEntity.dimension.getBlockFromRay(rayStartPos, forwardRay, { maxDistance: MAX_SEARCH_FORWARD });
              const downResult = sourceEntity.dimension.getTopmostBlock({ x: playerPos.x, z: playerPos.z }, playerPos.y);
              if (raycastResult && raycastResult.block) {
                  const blockHeight = sourceEntity.dimension.getTopmostBlock({ x: raycastResult.block.x, z: raycastResult.block.z }, raycastResult.block.y + MAX_STEP_HEIGHT);
                  const distance = blockHeight.y + 1.5 - playerPos.y;
                  verticalVelocity = distance;
              } else if (downResult && Math.abs(downResult.y - playerPos.y) < MAX_SEARCH_DOWN) {
                  const distance = downResult.y - playerPos.y;
                  verticalVelocity = distance;
              }
          } catch (error) {
              console.error("Raycast failed:", error);
          }
      
          sourceEntity.applyKnockback(view.x, view.z, 6, verticalVelocity);
    }
  });

function moveAngleDetect() {
  system.runInterval(() => {
    for (const player of world.getPlayers()) {
      const velocity = player.getVelocity();
      const di = player.getViewDirection();
      let moveAngle = Math.atan2(velocity.z, velocity.x) - Math.atan2(di.z, di.x);
      moveAngle = (moveAngle * (180 / Math.PI) + 360) % 360;
      moveAngle = Math.round(moveAngle)
      player.runCommand(`scoreboard players set @s moveAngle ${moveAngle}`);
    }
  });
}
moveAngleDetect();

function* circleGenerator(blockPerm, startingLocation, maxRadius, height) {
  const { dimension, x: centerX, y: startY, z: centerZ } = startingLocation;

  for (let steps = 0; steps < 60; steps++) {
    const currentRadius = Math.min(maxRadius, 45 * (steps + 1));

    for (let dx = -currentRadius; dx <= currentRadius; dx++) {
      for (let dz = -currentRadius; dz <= currentRadius; dz++) {
        const distanceSquared = dx * dx + dz * dz;
        const currentRadiusSquared = currentRadius * currentRadius;

        for (let y = startY; y < startY + height; y++) {
          if (distanceSquared <= currentRadiusSquared) {
            const block = dimension.getBlock({ x: centerX + dx, y: y + steps, z: centerZ + dz });
            if (block) {
              block.setPermutation(blockPerm);
            }
            yield;
          }
        }
      }
    }
  }
}

function* circleGenerator2(blockPerm, startingLocation, maxRadius, height) {
  const { dimension, x: centerX, y: startY, z: centerZ } = startingLocation;
  for (let y = startY; y < startY + height; y++) {
    const currentRadius = Math.min(maxRadius, 45 * (y - startY + 1));
    const currentRadiusSquared = currentRadius * currentRadius;

    for (let dx = -currentRadius; dx <= currentRadius; dx++) {
      for (let dz = -currentRadius; dz <= currentRadius; dz++) {
        const distanceSquared = dx * dx + dz * dz;
        if (distanceSquared <= currentRadiusSquared) {
          const block = dimension.getBlock({ x: centerX + dx, y, z: centerZ + dz });
          if (block) {
            block.setPermutation(blockPerm);
          }
          yield;
        }
      }
    }
  }
}
/**
 * Gets a players score.
 * @param {string} objective Scoreboard objective.
 * @param {Player} target The player object.
 * @returns {number} The score for the player.
 */
export function getScore(objective, target) {
  try {
      const oB = world.scoreboard.getObjective(objective);
      return oB.getScore(target.scoreboardIdentity);
  } catch (error) {
      return 0;
  }
};
let currentTick = 0;
system.run(function runnable() { 
    system.run(runnable);

    // This counts the ticks and then resets them after 180 ticks
    currentTick++;
    if (currentTick > 180) currentTick = 0;

    for (const player of world.getPlayers()) {
        // This is called a guard clause
        if (player.hasTag("abilitying") ||  !player.hasTag("sukuna") || getScore('finger', player) < 15) continue;
        
        // Get the fuga score
        const fuga = Math.min(500, Math.max(getScore("fuga", player), 0));

        // Map the fuga score (0-500) to the web bar (0-29)
        if (fuga < 500) {
            // If the fuga score is not 500, map it normally
            const fugaNorm = Math.round((fuga / 500) * 29);
            player.onScreenDisplay.setTitle(`a:fuga_bar${fugaNorm}`);
        } else {
            // If the fuga score is 500, map it to the web bars last values to animate (with cos)
            const fugaNorm = Math.round(30 + Math.cos(currentTick / 3) * 1);
            player.onScreenDisplay.setTitle(`a:fuga_bar${fugaNorm}`);
        }
    }
});


import { MolangVariableMap } from "@minecraft/server";


/**
 * Calculates the magnitude of a Vector3.
 * @param {Vector3} entityPosition - The Vector3 input.
 * @returns {number} The magnitude of the vector.
 */
export function magnitude(vector) {
  return Math.sqrt(vector.x * vector.x + vector.y * vector.y + vector.z * vector.z);
};
/**
 * Calculates the distance between an position and another position.
 * @param {Vector3} entityPosition - The position of the entity as a Vector3.
 * @param {Vector3} forceSourcePosition - The position of the force source as a Vector3.
 * @param {Vector3} forceMagnitude - The magnitude of the force to be applied.
 * @returns {Vector3} The knockback vector as a Vector3.
 */
export function calculateDistance(posA, posB) {
  let direction = {
      x: posA.x - posB.x,
      y: posA.y - posB.y,
      z: posA.z - posB.z
  };
  return magnitude(direction);
}
/**
 * Normalizes the given vector and scales it by the factor `s`.
 * @param {Vector3} vector - The 3D vector to normalize.
 * @param {number} s - The scale factor to apply to the normalized vector.
 * @returns {Vector3} The normalized and scaled vector.
 */
function normalizeVector (vector,s) {
  let l = Math.hypot(vector.x,vector.y,vector.z)
  return {
      x: s * (vector.x/l),
      y: s * (vector.y/l),
      z: s * (vector.z/l)
  }
}

/**
* Finds a location based on their view direction and the scaling factors from the players current position, the same as ^^^ in commands.
* @param {object} player - The player object to base the view direction and starting position on.
* @param {number} xf - The scaling factor for the x direction.
* @param {number} yf - The scaling factor for the y direction.
* @param {number} zf - The scaling factor for the z direction.
* @returns {{x: number, y: number, z: number}} The transformed location.
*/
function calcVectorOffset (player, xf, yf, zf, d = player.getViewDirection(), l = player.location) {
  let m = Math.hypot(d.x, d.z);
  let xx = normalizeVector({
      x: d.z,
      y: 0,
      z: -d.x
  }, xf);
  let yy = normalizeVector({
      x: (d.x / m) * -d.y,
      y: m,
      z: (d.z / m) * -d.y
  }, yf);
  let zz = normalizeVector(d, zf);

  return {
      x: l.x + xx.x + yy.x + zz.x,
      y: l.y + xx.y + yy.y + zz.y,
      z: l.z + xx.z + yy.z + zz.z
  };
}



const customMap = new MolangVariableMap();
const traceLine = (player, pStart, pEnd, color1, color2, color3, widthMultiplier1, widthMultiplier2, widthMultiplier3) => {
    try {
        const point1 = pStart;
        const point2 = pEnd;
        const distance = calculateDistance(point1, point2);
        const vectorDir = { x: point1.x - point2.x, y: point1.y - point2.y, z: point1.z - point2.z };
    
        const midPoint = { x: (point1.x + point2.x) / 2, y: (point1.y + point2.y) / 2, z: (point1.z + point2.z) / 2 };
    
        customMap.setVector3("variable.plane", color1);
        customMap.setVector3("variable.direction", vectorDir);
        customMap.setFloat("variable.width", 0.04 * widthMultiplier1);
        customMap.setFloat("variable.length", distance/2);
        player.dimension.spawnParticle("a:lightning_line", midPoint, customMap);

        customMap.setVector3("variable.plane", color2);
        customMap.setFloat("variable.width", 0.04 * widthMultiplier2);
        player.dimension.spawnParticle("a:lightning_line", midPoint, customMap);

        customMap.setVector3("variable.plane", color3);
        customMap.setFloat("variable.width", 0.03 * widthMultiplier3);
        player.dimension.spawnParticle("a:lightning_line_black", midPoint, customMap);
    } catch (error) {
        console.warn(error);
    };
}




system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:lightning") return;

  const player = event.sourceEntity;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  let currentTick = 0;
  const sched_ID = system.runInterval(function tick() {
      // In case of errors
      currentTick++;
      if (currentTick > 4) {
          return system.clearRun(sched_ID);
      }
  
      for (let i = 0; i < 1; i++) {
          const numLocations = 6;
          const locations = [];
          
          for (let i = 0; i < numLocations; i++) {
              const xOffset = i === numLocations - 1 ? 0 : i === 0 ? 0 : Math.random() * 6 - 3;
              const yOffset = i === numLocations - 1 ? 0 : i === 0 ? 0.6 : Math.random() * 6 - 2;
              const zOffset = i === numLocations - 1 ? 8 : 2 * i + Math.random() * 2;
              const location = calcVectorOffset(player, xOffset * offsets[0], yOffset * offsets[1] + 1, zOffset * offsets[2]);

              const scaleFactor = 5/Math.max(0.25, 0.5 * calculateDistance(player.location, location));
          
              locations.push(location);
          
              if (i > 0) {
                  traceLine(
                      player,
                      locations[i - 1],
                      locations[i],
                      { x: offsets[3], y: offsets[4], z: offsets[5] },
                      { x: offsets[6], y: offsets[7], z: offsets[8] },
                      { x: offsets[9], y: offsets[10], z: offsets[11] },
                      offsets[12] * scaleFactor,
                      offsets[13] * scaleFactor,
                      offsets[14] * scaleFactor
                  );
              }
          }
      }
  }, 1);
});


system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_hit") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_hit1", offset);
      player.spawnParticle("ds:delusional_hit2", offset);
      player.spawnParticle("ds:delusional_hit3", offset);
      player.spawnParticle("ds:delusional_hit4", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  // Get player groups
  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  const normalPlayers = world.getPlayers({ excludeTags: ["delusional"] });

  // Original effects for delusional players
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      player.spawnParticle("ds:delusional1", offset);
      player.spawnParticle("ds:delusional2", offset);
      player.spawnParticle("ds:delusional3", offset);
      player.spawnParticle("ds:delusional4", offset);
  }

  // Proper rotating blood effect for normal players
  for (const player of normalPlayers) {
      // Base eye position
      const eyeHeight = player.isSneaking ? 1.27 : 1.52;
      const eyePos = {
          x: player.location.x,
          y: player.location.y + eyeHeight,
          z: player.location.z
      };

      // Get view direction
      const rotation = player.getRotation();
      const yaw = rotation.y * (Math.PI / 180);
      const pitch = rotation.x * (Math.PI / 180);

      // Calculate forward vector (normalized)
      const forwardX = -Math.sin(yaw) * Math.cos(pitch);
      const forwardY = -Math.sin(pitch);
      const forwardZ = Math.cos(yaw) * Math.cos(pitch);

      // Apply fixed offset (0.25 forward, 0.15 down from eyes)
      const bloodPos = {
          x: eyePos.x + forwardX * 0.25,
          y: eyePos.y + forwardY * 0.25 - 0.15,
          z: eyePos.z + forwardZ * 0.25
      };

      player.spawnParticle("ds:delusional_bloo", bloodPos);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_small") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_small1", offset);
      player.spawnParticle("ds:delusional_small2", offset);
      player.spawnParticle("ds:delusional_small3", offset);
      player.spawnParticle("ds:delusional_small4", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_climax") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_climax1", offset);
      player.spawnParticle("ds:delusional_climax2", offset);
      player.spawnParticle("ds:delusional_climax3", offset);
      player.spawnParticle("ds:delusional_climax4", offset);
      player.spawnParticle("ds:delusional_climax5", offset);
      player.spawnParticle("ds:delusional_climax6", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_hearts") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_hearts", offset);

  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_hearts2") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_hearts2", offset);

  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_glitter") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_glitter", offset);

  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:delusional_end") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["delusional"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:delusional_end1", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:styleswap") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["styleswap_tag"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:styleswap", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:plusultra_brother_background1") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["cutscene_vision"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:plusultra_brother_background1", offset);
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:mahito_blackflash_background1") return;

  const message = event.message;
  const offsets = message.split(",").map(Number);

  const delusionalPlayers = world.getPlayers({ tags: ["cutscene_vision"] });
  for (const player of delusionalPlayers) {
      const offset = calcVectorOffset(player, offsets[0], offsets[1], offsets[2]);
      
      player.spawnParticle("ds:mahito_blackflash_background1", offset);
  }
});



system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:pebble":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:pebble', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 2.5;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:transfigured_bullet":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:transfigured_human_bullet', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 3;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();
  switch (event.id) {
    case "ds:transfigured_worm1":
      const playerView = player.getViewDirection();
      const spawnPosition = {
        x: player.location.x + playerView.x * 2,
        y: player.location.y + 1.5 + playerView.y * 2,
        z: player.location.z + playerView.z * 2
      };

      const projectileEntity = player.dimension.spawnEntity('ds:transfigured_human_worm', spawnPosition);

      const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
      if (projectileComponent) {
        projectileComponent.owner = player;

        const velocityMultiplier = 2;
        projectileComponent.shoot({
          x: playerView.x * velocityMultiplier,
          y: playerView.y * velocityMultiplier,
          z: playerView.z * velocityMultiplier
        });
      }
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();

  switch (event.id) {
    case "ds:transfigured_worm2":
      const playerView = player.getViewDirection();

      // Helper to spawn and shoot the projectile
      function spawnProjectile(direction) {
        const spawnPosition = {
          x: player.location.x + direction.x * 2,
          y: player.location.y + 1.5 + direction.y * 2,
          z: player.location.z + direction.z * 2
        };

        const projectileEntity = player.dimension.spawnEntity('ds:transfigured_human_worm', spawnPosition);

        const projectileComponent = projectileEntity.getComponent('minecraft:projectile');
        if (projectileComponent) {
          projectileComponent.owner = player;
          const velocityMultiplier = 2;
          projectileComponent.shoot({
            x: direction.x * velocityMultiplier,
            y: direction.y * velocityMultiplier,
            z: direction.z * velocityMultiplier
          });
        }
      }

      // Function to normalize a vector
      function normalize(v) {
        const len = Math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
        return { x: v.x / len, y: v.y / len, z: v.z / len };
      }

      // Function to compute cross product
      function cross(a, b) {
        return {
          x: a.y * b.z - a.z * b.y,
          y: a.z * b.x - a.x * b.z,
          z: a.x * b.y - a.y * b.x
        };
      }

      // Get perpendicular vector to player's view (horizontal)
      const up = { x: 0, y: 1, z: 0 };
      let right = cross(playerView, up);
      right = normalize(right);

      const spread = 0.2; // Adjust for wider/narrower spread

      // Middle shot
      spawnProjectile(playerView);

      // Left shot (view + slight left offset)
      spawnProjectile(normalize({
        x: playerView.x - right.x * spread,
        y: playerView.y,
        z: playerView.z - right.z * spread
      }));

      // Right shot (view + slight right offset)
      spawnProjectile(normalize({
        x: playerView.x + right.x * spread,
        y: playerView.y,
        z: playerView.z + right.z * spread
      }));
  }
});


system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;
  const di = player.getViewDirection();

  switch (event.id) {
    case "ds:body_repel_max":
      // Entities to shoot out
      const entities = ["ds:body_repel_max1", "ds:body_repel_max2", "ds:transfigured_human_worm"];

      for (const entityId of entities) {
        // Spawn a little in front of the player
        const spawnPosition = {
          x: player.location.x + di.x * 2,
          y: player.location.y + 1.5,
          z: player.location.z + di.z * 2
        };

        const projectileEntity = player.dimension.spawnEntity(entityId, spawnPosition);

        const projectileComponent = projectileEntity.getComponent("minecraft:projectile");
        if (projectileComponent) {
          projectileComponent.owner = player;

          // Base velocity in the direction the player is looking
          const baseVel = {
            x: di.x,
            y: di.y,
            z: di.z
          };

          // Add random spray offset
          const spread = 0.5; // increase for wider spray
          const randomVel = {
            x: baseVel.x + (Math.random() - 0.5) * spread,
            y: baseVel.y + (Math.random() - 0.5) * spread,
            z: baseVel.z + (Math.random() - 0.5) * spread
          };

          // Normalize + scale speed
          const velocityMultiplier = 2.5;
          const mag = Math.sqrt(randomVel.x ** 2 + randomVel.y ** 2 + randomVel.z ** 2);
          const finalVel = {
            x: (randomVel.x / mag) * velocityMultiplier,
            y: (randomVel.y / mag) * velocityMultiplier,
            z: (randomVel.z / mag) * velocityMultiplier
          };

          projectileComponent.shoot(finalVel);
        }
      }
      break;
  }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
  var player = event.sourceEntity;

  switch (event.id) {
    case "ds:body_repel_fountain":
      // Entities to shoot out
      const entities = ["ds:body_repel_max1", "ds:transfigured_human_worm"];

      for (const entityId of entities) {
        // Spawn at player's position + offset
        const spawnPosition = {
          x: player.location.x,
          y: player.location.y + 1,
          z: player.location.z
        };

        const projectileEntity = player.dimension.spawnEntity(entityId, spawnPosition);

        const projectileComponent = projectileEntity.getComponent("minecraft:projectile");
        if (projectileComponent) {
          projectileComponent.owner = player;

          // Random horizontal spread
          const spread = 1.0; // increase for wider spray
          const randX = (Math.random() - 0.5) * spread;
          const randZ = (Math.random() - 0.5) * spread;

          // Always strong upward force
          const upwardVelocity = Math.random() * 1 + 2; // between 3 and 5

          // Final velocity vector
          const finalVel = {
            x: randX,
            y: upwardVelocity,
            z: randZ
          };

          projectileComponent.shoot(finalVel);
        }
      }
      break;
  }
});





/**
 * Finds all entities within a given radius of any point along a ray cast from a player’s view direction.
 * @param {Entity} player - The player entity casting the ray.
 * @param {Vector3} viewDirection - The normalized vector representing the player's view direction.
 * @param {number} proximityRadius - Radius around the ray within which entities are considered "near."
 * @param {number} rayLength - Total length of the ray.
 * @param {number} [step=1] - Step size for sampling along the ray (smaller = more precise, larger = faster).
 * @returns {Entity[]} Array of unique entities near the ray.
 */
const findEntitiesNearRay = (player, viewDirection, proximityRadius, rayLength, step = 1) => {
    const nearbyEntities = [];

    // Calculate the center point of the ray to optimize the entity query
    const halfRay = rayLength / 2;
    const rayMidpoint = calcVectorOffset(player, 0, 0, halfRay, viewDirection);

    // Single query for all entities in the max range
    const potentialTargets = player.dimension.getEntities({
        location: rayMidpoint,
        maxDistance: halfRay + proximityRadius,
        excludeNames: [player.name]
    });

    // Sample points along the ray to check against
    const sampledRayPoints = [];
    for (let i = 0; i <= rayLength; i += step) {
        sampledRayPoints.push(calcVectorOffset(player, 0, 0, i, viewDirection));
    }

    // Check if any candidate entity is near any ray point
    for (const entity of potentialTargets) {
        const { x: ex, y: ey, z: ez } = entity.location;

        for (const point of sampledRayPoints) {
            const dx = ex - point.x;
            const dy = ey - point.y;
            const dz = ez - point.z;
            const distanceSq = dx * dx + dy * dy + dz * dz;

            if (distanceSq <= proximityRadius * proximityRadius) {
                if (!nearbyEntities.find(e => e.id === entity.id)) {
                    nearbyEntities.push(entity);
                }
                break;
            }
        }
    }

    return nearbyEntities;
};

export const rayCast = (player, args) => {
    const viewDir = player.getViewDirection();

    const maxDistance = parseFloat(args[0]);
    const rayThickness = parseFloat(args[1]);
    const functionAtDest = args[2];

    const entities = findEntitiesNearRay(player, viewDir, rayThickness, maxDistance);

    if (entities.length > 0) {
        const { x, y, z } = entities[0].location;
        return player.runCommand(`execute positioned ${x} ${y} ${z} run function ${functionAtDest}`);
    }

    const rayCast = player.dimension.getBlockFromRay(player.getHeadLocation(), viewDir, {
        includePassableBlocks: false,
        includeLiquidBlocks: false,
        maxDistance: maxDistance
    });
    
    if (rayCast) {
        const movedBack = calcVectorOffset(player, 0, 1, -0.8, viewDir, rayCast.block);
        const { x, y, z } = movedBack;

        return player.runCommand(`execute positioned ${x + 0.5} ${y + 0.5} ${z + 0.5} run function ${functionAtDest}`);
    }
}


const PREFIX = "ds:";

const scriptEvent = (eventData) => {
    const { id, message, sourceEntity, sourceType } = eventData;
    const player = sourceEntity;

    if (!player || !player.isValid()) return;

    const args = message.split(" ");

    switch (id.replace(PREFIX, "")) {
        case "raycast":
            rayCast(player, args);
        default:
            break;
    }
};
system.afterEvents.scriptEventReceive.subscribe(v => scriptEvent(v));

system.afterEvents.scriptEventReceive.subscribe((event) => {
    const player = event.sourceEntity;
    if (!player || player.typeId !== "minecraft:player") return;

    if (event.id === "ds:human_count") {
        let total = 0;

        // Get player's inventory container
        const inventoryComp = player.getComponent("minecraft:inventory");
        if (inventoryComp) {
            const container = inventoryComp.container;
            for (let i = 0; i < container.size; i++) {
                const item = container.getItem(i);
                if (!item) continue;

                if (item.typeId === "ds:unstable_transfigured_human" || item.typeId === "ds:stable_transfigured_human") {
                    total += item.amount;
                }
            }
        }

        // Ensure scoreboard exists
        try {
            player.runCommand(`scoreboard objectives add transfigured_human_count dummy`);
        } catch (e) {
            // ignore if already exists
        }

        // Set the score to the total count
        player.runCommand(`scoreboard players set @s transfigured_human_count ${total}`);
    }
});

system.afterEvents.scriptEventReceive.subscribe((event) => {
    const player = event.sourceEntity;
    if (!player || player.typeId !== "minecraft:player") return;

    const args = event.message?.split(" ") || [];
    const amountToRemove = parseInt(args[0]);
    if (event.id !== "ds:remove_humans" || isNaN(amountToRemove) || amountToRemove <= 0) return;

    const inventoryComp = player.getComponent("minecraft:inventory");
    if (!inventoryComp) return;

    const container = inventoryComp.container;
    let remainingToRemove = amountToRemove;

    // Loop through inventory slots in order (hotbar first)
    for (let i = 0; i < container.size; i++) {
        const item = container.getItem(i);
        if (!item) continue;

        if (item.typeId === "ds:unstable_transfigured_human" || item.typeId === "ds:stable_transfigured_human") {
            if (item.amount <= remainingToRemove) {
                // Remove the whole stack
                container.setItem(i, undefined);
                remainingToRemove -= item.amount;
            } else {
                // Remove part of the stack
                item.amount -= remainingToRemove;
                container.setItem(i, item);
                remainingToRemove = 0;
            }
        }

        if (remainingToRemove <= 0) break;
    }
});




/* ========== Spawn Middle System ========== */

// Configuration
const MAX_RADIUS = 33; // Maximum distance entities can be apart

// Track recent spawns to prevent duplicates in same tick
const spawnCooldowns = new Map(); // key: nametag, value: tick when spawned
const COOLDOWN_TICKS = 2; // Prevent duplicate spawns for 2 ticks

/**
 * Calculates distance between two points
 */
function distance(pos1, pos2) {
  const dx = pos1.x - pos2.x;
  const dy = pos1.y - pos2.y;
  const dz = pos1.z - pos2.z;
  return Math.sqrt(dx * dx + dy * dy + dz * dz);
}

/**
 * Checks if all entities are within MAX_RADIUS of each other
 */
function areEntitiesWithinRadius(entities, radius) {
  if (entities.length < 2) return true;
  
  // Check every pair of entities
  for (let i = 0; i < entities.length; i++) {
    for (let j = i + 1; j < entities.length; j++) {
      try {
        const dist = distance(entities[i].location, entities[j].location);
        if (dist > radius) {
          console.warn(`[SpawnMiddle] ERROR: Entities too far apart (${dist.toFixed(2)} blocks, max ${radius})`);
          return false;
        }
      } catch (e) {
        console.warn(`[SpawnMiddle] ERROR: Could not check distance between entities`);
        return false;
      }
    }
  }
  
  return true;
}

/**
 * Calculates the center point (mean position) of all entities with a given tag
 */
function calculateCenterPoint(entities) {
  if (!entities || entities.length === 0) return null;
  
  let sumX = 0, sumY = 0, sumZ = 0;
  let count = 0;
  
  for (const entity of entities) {
    try {
      const loc = entity.location;
      sumX += loc.x;
      sumY += loc.y;
      sumZ += loc.z;
      count++;
    } catch (e) {
      // Entity might be invalid
      continue;
    }
  }
  
  if (count === 0) return null;
  
  return {
    x: sumX / count,
    y: sumY / count,
    z: sumZ / count
  };
}

/**
 * Checks if a mob with the given nametag already exists
 */
function mobWithNameExists(dimension, nametag) {
  try {
    const allEntities = dimension.getEntities();
    
    for (const entity of allEntities) {
      try {
        const nameComponent = entity.nameTag;
        if (nameComponent === nametag) {
          return true;
        }
      } catch (e) {
        // Entity doesn't have nameTag or is invalid
        continue;
      }
    }
    
    return false;
  } catch (e) {
    console.warn("Error checking for existing mob:", e);
    return false;
  }
}

/**
 * Gets all entities with a specific tag
 */
function getEntitiesWithTag(dimension, tag) {
  try {
    return dimension.getEntities({ tags: [tag] });
  } catch (e) {
    console.warn(`Error getting entities with tag "${tag}":`, e);
    return [];
  }
}

/**
 * Spawns a mob at the center of all entities with a given tag
 */
function spawnMiddle(dimension, tag, mobType, nametag) {
  const now = system.currentTick;
  
  // Check cooldown to prevent duplicate spawns in same tick
  const lastSpawn = spawnCooldowns.get(nametag);
  if (lastSpawn && (now - lastSpawn) < COOLDOWN_TICKS) {
    return {
      success: false,
      reason: "cooldown"
    };
  }
  
  // Check if mob with this nametag already exists
  if (mobWithNameExists(dimension, nametag)) {
    return {
      success: false,
      reason: "already_exists"
    };
  }
  
  // Get all entities with the tag
  const taggedEntities = getEntitiesWithTag(dimension, tag);
  
  if (taggedEntities.length === 0) {
    console.warn(`[SpawnMiddle] ERROR: No entities found with tag "${tag}"`);
    return {
      success: false,
      reason: "no_entities"
    };
  }
  
  // Check if all entities are within radius of each other
  if (!areEntitiesWithinRadius(taggedEntities, MAX_RADIUS)) {
    return {
      success: false,
      reason: "entities_too_far"
    };
  }
  
  // Calculate center point
  const centerPoint = calculateCenterPoint(taggedEntities);
  
  if (!centerPoint) {
    console.warn(`[SpawnMiddle] ERROR: Could not calculate center point for tag "${tag}"`);
    return {
      success: false,
      reason: "calculation_failed"
    };
  }
  
  // Spawn the mob at the center point
  try {
    const { x, y, z } = centerPoint;
    
    // Spawn mob
    const spawnResult = dimension.spawnEntity(mobType, centerPoint);
    
    // Set nametag
    if (spawnResult) {
      spawnResult.nameTag = nametag;
      
      // Mark cooldown
      spawnCooldowns.set(nametag, now);
      
      console.log(`[SpawnMiddle] Spawned ${mobType} with nametag "${nametag}" at (${x.toFixed(2)}, ${y.toFixed(2)}, ${z.toFixed(2)})`);
      console.log(`[SpawnMiddle] Center of ${taggedEntities.length} entities with tag "${tag}"`);
      
      return {
        success: true,
        entity: spawnResult,
        location: centerPoint,
        entityCount: taggedEntities.length
      };
    } else {
      console.warn(`[SpawnMiddle] ERROR: Spawn command succeeded but entity is null`);
      return {
        success: false,
        reason: "spawn_returned_null"
      };
    }
  } catch (e) {
    console.error(`[SpawnMiddle] ERROR: Failed to spawn mob -`, e);
    return {
      success: false,
      reason: "spawn_error",
      error: e
    };
  }
}

/* ========== Script Event Handler ========== */
system.afterEvents.scriptEventReceive.subscribe((event) => {
  const { id, message, sourceEntity } = event;
  
  if (id !== "ds:spawn_middle") return;
  
  // Parse arguments: "tag" "mob_type" "nametag"
  const args = message.match(/(?:[^\s"]+|"[^"]*")+/g);
  
  if (!args || args.length < 3) {
    console.warn(`[SpawnMiddle] ERROR: Invalid arguments. Expected: "tag" "mob_type" "nametag"`);
    return;
  }
  
  // Remove quotes from arguments
  const tag = args[0].replace(/"/g, '');
  const mobType = args[1].replace(/"/g, '');
  const nametag = args[2].replace(/"/g, '');
  
  // Determine dimension (use source entity's dimension or default to overworld)
  const dimension = sourceEntity?.dimension || world.getDimension("overworld");
  
  // Attempt spawn (no feedback messages)
  spawnMiddle(dimension, tag, mobType, nametag);
});

/* ========== Cooldown Cleanup ========== */
// Periodically clean up old cooldowns to prevent memory leaks
system.runInterval(() => {
  const now = system.currentTick;
  const toDelete = [];
  
  for (const [nametag, tick] of spawnCooldowns.entries()) {
    if (now - tick > 100) { // Remove cooldowns older than 5 seconds
      toDelete.push(nametag);
    }
  }
  
  for (const nametag of toDelete) {
    spawnCooldowns.delete(nametag);
  }
}, 100); // Every 5 seconds

/* ========== Initialization ========== */
system.runTimeout(() => {
  console.log("[SpawnMiddle] System initialized");
}, 20);




world.beforeEvents.itemUse.subscribe(({ itemStack, source }) => {
    system.run(() => {
      source.addTag("itemUse");
    });
    system.runTimeout(() => {
      source.removeTag("itemUse");
    }, 1);
});


system.afterEvents.scriptEventReceive.subscribe((event) => {
  var entity = event.sourceEntity;
  switch (event.id) {
    case 'ds:regeneration':
      entity.addEffect(`regeneration`,1,{amplifier:6, showParticles:false});
  }
});











/* ========== Wall Climb System ========== */

const CLIMB_SPEED = 15; // Blocks per second
const MAX_CLIMB_TIME = 5; // Maximum 5 seconds
const SEARCH_RADIUS = 64; // Search for walls within 64 blocks
const WALL_CHECK_DISTANCE = 32; // How far to check for walls
const STEP_SIZE = 0.5; // Check every 0.5 blocks for better accuracy

const activeClimbers = new Map(); // Track active climbers

/**
 * Check if a block is solid (isSolid property is unreliable, so check if it's not air)
 */
function isBlockSolid(block) {
  if (!block) return false;
  
  const typeId = block.typeId;
  
  // Check if it's air or known non-solid blocks
  if (typeId === "minecraft:air" || 
      typeId === "minecraft:cave_air" ||
      typeId === "minecraft:void_air" ||
      typeId.includes("water") ||
      typeId.includes("lava") ||
      typeId.includes("fire") ||
      typeId.includes("torch") ||
      typeId.includes("flower") ||
      typeId.includes("grass") ||
      typeId.includes("sapling") ||
      typeId.includes("vine")) {
    return false;
  }
  
  // If block has a typeId and isn't air, assume it's solid
  return typeId !== undefined && typeId !== "minecraft:air";
}

/**
 * Finds the closest wall from the entity's position
 */
function findClosestWall(entity) {
  const startLoc = entity.location;
  const dimension = entity.dimension;
  
  let closestWall = null;
  let closestDistance = SEARCH_RADIUS;
  
  console.log(`[WallClimb] ===== STARTING WALL SEARCH =====`);
  console.log(`[WallClimb] Player location: (${startLoc.x.toFixed(1)}, ${startLoc.y.toFixed(1)}, ${startLoc.z.toFixed(1)})`);
  console.log(`[WallClimb] Search radius: ${SEARCH_RADIUS} blocks`);
  
  let solidBlocksFound = 0;
  let blocksChecked = 0;
  
  // Check in a circular pattern around the player
  for (let angle = 0; angle < 360; angle += 10) { // Check every 10 degrees for more coverage
    const radians = (angle * Math.PI) / 180;
    const dirX = Math.cos(radians);
    const dirZ = Math.sin(radians);
    
    // Cast ray in this direction
    for (let dist = 1; dist <= SEARCH_RADIUS; dist += 1) { // Check every block
      const checkX = Math.floor(startLoc.x + dirX * dist);
      const checkY = Math.floor(startLoc.y);
      const checkZ = Math.floor(startLoc.z + dirZ * dist);
      
      blocksChecked++;
      
      try {
        const block = dimension.getBlock({ x: checkX, y: checkY, z: checkZ });
        
        // Debug: Log what we found
        if (block) {
          const blockType = block.typeId;
          const isSolid = isBlockSolid(block);
          
          // Check if block is solid
          if (isSolid) {
            solidBlocksFound++;
            
            if (solidBlocksFound <= 5) { // Log first 5 solid blocks found
              console.log(`[WallClimb] Solid block #${solidBlocksFound}: ${blockType} at (${checkX}, ${checkY}, ${checkZ}), distance: ${dist.toFixed(1)}`);
            }
            
            // Found a potential wall! Check if it's tall enough
            const wallHeight = getWallHeight(dimension, checkX, checkY, checkZ);
            
            if (wallHeight >= 3) { // Must be at least 3 blocks tall
              const distance = Math.sqrt(
                Math.pow(checkX - startLoc.x, 2) + 
                Math.pow(checkZ - startLoc.z, 2)
              );
              
              console.log(`[WallClimb] VALID WALL FOUND at (${checkX}, ${checkY}, ${checkZ}), height: ${wallHeight}, distance: ${distance.toFixed(2)}`);
              
              if (distance < closestDistance) {
                closestDistance = distance;
                closestWall = {
                  x: checkX,
                  y: checkY,
                  z: checkZ,
                  height: wallHeight,
                  dirX: dirX,
                  dirZ: dirZ
                };
              }
            }
            break; // Found wall in this direction, check next angle
          }
        }
      } catch (e) {
        // Block might be unloaded, skip
        continue;
      }
    }
  }
  
  console.log(`[WallClimb] Blocks checked: ${blocksChecked}`);
  console.log(`[WallClimb] Solid blocks found: ${solidBlocksFound}`);
  
  if (closestWall) {
    console.log(`[WallClimb] ✓ FINAL RESULT: Wall at (${closestWall.x}, ${closestWall.y}, ${closestWall.z}), height: ${closestWall.height}, distance: ${closestDistance.toFixed(2)}`);
  } else {
    console.warn(`[WallClimb] ✗ NO VALID WALL FOUND within ${SEARCH_RADIUS} blocks (found ${solidBlocksFound} solid blocks, but none were tall enough)`);
  }
  
  return closestWall;
}

/**
 * Gets the height of a wall starting from a position
 */
function getWallHeight(dimension, x, y, z) {
  let height = 0;
  
  // Check upward until we find air or reach max height
  for (let checkY = y; checkY < y + WALL_CHECK_DISTANCE; checkY++) {
    try {
      const block = dimension.getBlock({ x, y: checkY, z });
      
      if (block && isBlockSolid(block)) {
        height++;
      } else {
        break; // Reached top of wall
      }
    } catch (e) {
      break;
    }
  }
  
  if (height > 0) {
    console.log(`[WallClimb] Height check at (${x}, ${y}, ${z}): ${height} blocks`);
  }
  return height;
}

/**
 * Finds the edge of the wall (closest air block adjacent to wall)
 */
function findWallEdge(dimension, wall, entityLoc) {
  const wallX = wall.x;
  const wallZ = wall.z;
  const y = Math.floor(entityLoc.y);
  
  // Calculate the opposite direction from where we found the wall
  // We want to position the entity AWAY from the wall
  const offsetX = entityLoc.x - wallX;
  const offsetZ = entityLoc.z - wallZ;
  
  // Normalize and position entity 1.2 blocks away from wall (prevent clipping)
  const length = Math.sqrt(offsetX * offsetX + offsetZ * offsetZ);
  if (length > 0) {
    const normalX = offsetX / length;
    const normalZ = offsetZ / length;
    
    const edgeX = wallX + normalX * 1.2; // 1.2 blocks from wall center
    const edgeZ = wallZ + normalZ * 1.2;
    
    console.log(`[WallClimb] Positioning at edge (${edgeX.toFixed(2)}, ${y}, ${edgeZ.toFixed(2)})`);
    
    return { x: edgeX, y, z: edgeZ };
  }
  
  // Fallback
  return { x: wallX + 1.5, y, z: wallZ + 0.5 };
}

/**
 * Starts climbing a wall
 */
function startClimb(entity, horizontalForce, verticalForce, direction) {
  // Check if already climbing
  if (activeClimbers.has(entity.id)) {
    console.warn("[WallClimb] Entity already climbing");
    return;
  }
  
  // Find closest wall
  const wall = findClosestWall(entity);
  
  if (!wall) {
    console.warn("[WallClimb] No wall found within range");
    return;
  }
  
  // Find edge position
  const edgePos = findWallEdge(entity.dimension, wall, entity.location);
  
  // Teleport to wall edge
  try {
    entity.teleport(edgePos, { dimension: entity.dimension });
  } catch (e) {
    console.error("[WallClimb] Failed to teleport to wall:", e);
    return;
  }
  
  // Start climb state
  const climbState = {
    entityId: entity.id,
    startY: edgePos.y,
    currentY: edgePos.y,
    targetY: edgePos.y + wall.height,
    wallX: wall.x,
    wallZ: wall.z,
    edgeX: edgePos.x,
    edgeZ: edgePos.z,
    startTime: system.currentTick,
    maxTicks: MAX_CLIMB_TIME * 20, // 5 seconds = 100 ticks
    horizontalForce: horizontalForce || 0,
    verticalForce: verticalForce || 0,
    direction: direction || null
  };
  
  activeClimbers.set(entity.id, climbState);
  
  console.log(`[WallClimb] Started climbing wall at (${wall.x}, ${wall.z}), height: ${wall.height}`);
}

/**
 * Update climbing entities (runs every tick)
 */
system.runInterval(() => {
  const now = system.currentTick;
  const toRemove = [];
  
  for (const [entityId, state] of activeClimbers.entries()) {
    // Get entity
    const entity = [...world.getDimension("overworld").getEntities(), 
                    ...world.getDimension("nether").getEntities(),
                    ...world.getDimension("the_end").getEntities()]
                   .find(e => e.id === entityId);
    
    if (!entity) {
      toRemove.push(entityId);
      continue;
    }
    
    // Check if max time exceeded
    if (now - state.startTime > state.maxTicks) {
      console.log("[WallClimb] Max climb time reached");
      toRemove.push(entityId);
      continue;
    }
    
    // Calculate climb progress
    const ticksPassed = now - state.startTime;
    const blocksClimbed = (ticksPassed / 20) * CLIMB_SPEED;
    const newY = state.startY + blocksClimbed;
    
    // Check if reached top
    if (newY >= state.targetY) {
      console.log("[WallClimb] Reached top of wall");
      
      // Calculate final position (away from wall to prevent clipping)
      const offsetX = state.edgeX - state.wallX;
      const offsetZ = state.edgeZ - state.wallZ;
      const length = Math.sqrt(offsetX * offsetX + offsetZ * offsetZ);
      
      let finalX = state.edgeX;
      let finalZ = state.edgeZ;
      
      if (length > 0) {
        const normalX = offsetX / length;
        const normalZ = offsetZ / length;
        
        // Position 1.5 blocks away from wall at top
        finalX = state.wallX + normalX * 1.5;
        finalZ = state.wallZ + normalZ * 1.5;
      }
      
      // Teleport to top WITHOUT keepVelocity
      try {
        entity.teleport(
          { x: finalX, y: state.targetY + 0.5, z: finalZ },
          { dimension: entity.dimension, keepVelocity: false }
        );
        
        // Apply burst AFTER teleport with longer delay to prevent rubberband
        if (state.horizontalForce > 0 || state.verticalForce > 0) {
          system.runTimeout(() => {
            try {
              // Check if entity still exists
              if (!entity || !entity.isValid()) return;
              
              let knockbackX = 0;
              let knockbackZ = 0;
              
              if (state.direction === "random") {
                // Random horizontal direction
                const randomAngle = Math.random() * Math.PI * 2;
                knockbackX = Math.cos(randomAngle);
                knockbackZ = Math.sin(randomAngle);
              } else if (state.direction) {
                // Parse custom direction (e.g., "~1~~", "~-1~~", "~~1~", etc.)
                const dirStr = state.direction.toLowerCase().replace(/~/g, " ").trim();
                const parts = dirStr.split(/\s+/);
                
                if (parts.length >= 1 && parts[0] !== "") {
                  knockbackX = parseFloat(parts[0]) || 0;
                }
                if (parts.length >= 3 && parts[2] !== "") {
                  knockbackZ = parseFloat(parts[2]) || 0;
                }
                
                // Normalize direction
                const dirLength = Math.sqrt(knockbackX * knockbackX + knockbackZ * knockbackZ);
                if (dirLength > 0) {
                  knockbackX /= dirLength;
                  knockbackZ /= dirLength;
                }
              }
              
              // Apply knockback
              entity.applyKnockback(
                knockbackX,
                knockbackZ,
                state.horizontalForce,
                state.verticalForce
              );
              
              console.log(`[WallClimb] Applied burst: dirX=${knockbackX.toFixed(2)}, dirZ=${knockbackZ.toFixed(2)}, H=${state.horizontalForce}, V=${state.verticalForce}`);
            } catch (e) {
              console.error("[WallClimb] Failed to apply knockback:", e);
            }
          }, 5); // 5 tick delay (0.25 seconds) to prevent rubberband
        }
      } catch (e) {
        console.error("[WallClimb] Failed to teleport to top:", e);
      }
      
      toRemove.push(entityId);
      continue;
    }
    
    // Check if wall still exists at current position
    try {
      const wallBlock = entity.dimension.getBlock({
        x: state.wallX,
        y: Math.floor(newY),
        z: state.wallZ
      });
      
      if (!wallBlock || !isBlockSolid(wallBlock)) {
        console.log("[WallClimb] Wall ended, stopping climb");
        toRemove.push(entityId);
        continue;
      }
    } catch (e) {
      console.warn("[WallClimb] Could not check wall block:", e);
      toRemove.push(entityId);
      continue;
    }
    
    // Update position (stick to wall, but not inside it)
    try {
      entity.teleport(
        { x: state.edgeX, y: newY, z: state.edgeZ },
        { dimension: entity.dimension, keepVelocity: false }
      );
      
      // Optional: Add particles for visual feedback
      entity.dimension.spawnParticle("minecraft:dust_plume_particle", {
        x: state.edgeX,
        y: newY,
        z: state.edgeZ
      });
    } catch (e) {
      console.error("[WallClimb] Failed to update position:", e);
      toRemove.push(entityId);
    }
  }
  
  // Clean up finished climbers
  for (const entityId of toRemove) {
    activeClimbers.delete(entityId);
  }
}, 1); // Run every tick

/**
 * Script event handler
 */
system.afterEvents.scriptEventReceive.subscribe((event) => {
  const { id, message, sourceEntity } = event;
  
  if (id === "ds:wall_climb") {
    if (!sourceEntity) {
      console.warn("[WallClimb] No source entity provided");
      return;
    }
    
    // Parse arguments: horizontal_force vertical_force direction
    const args = message.trim().split(" ");
    
    let horizontalForce = 0;
    let verticalForce = 0;
    let direction = null;
    
    if (args.length >= 1 && args[0] !== "") {
      horizontalForce = parseFloat(args[0]) || 0;
    }
    
    if (args.length >= 2 && args[1] !== "") {
      verticalForce = parseFloat(args[1]) || 0;
    }
    
    if (args.length >= 3 && args[2] !== "") {
      direction = args[2]; // "random" or "~X~Y~Z" format
    }
    
    console.log(`[WallClimb] Command: horizontal=${horizontalForce}, vertical=${verticalForce}, direction=${direction || "none"}`);
    
    startClimb(sourceEntity, horizontalForce, verticalForce, direction);
  }
});

/* ========== Initialization ========== */
system.runTimeout(() => {
  console.log("[WallClimb] System initialized");
}, 20);





//* ========== Efficient Effect Management System ========== */

// Track which players have received infinite effects
const infiniteEffectsApplied = new Set();
const entityEffectsApplied = new WeakSet();

// Get scoreboard value for entity
function getScoreValue(entity, objective) {
  try {
    const obj = world.scoreboard.getObjective(objective);
    return obj?.getScore(entity.scoreboardIdentity) ?? 0;
  } catch {
    return 0;
  }
}

function setScore(entity, objective, value) {
  try {
    const obj = world.scoreboard.getObjective(objective);
    if (!obj) return false;
    obj.setScore(entity.scoreboardIdentity, value);
    return true;
  } catch {
    return false;
  }
}

function addScore(entity, objective, value) {
  try {
    const obj = world.scoreboard.getObjective(objective);
    if (!obj) return false;
    const current = obj.getScore(entity.scoreboardIdentity) ?? 0;
    obj.setScore(entity.scoreboardIdentity, current + value);
    return true;
  } catch {
    return false;
  }
}

function removeScore(entity, objective, value) {
  try {
    const obj = world.scoreboard.getObjective(objective);
    if (!obj) return false;
    const current = obj.getScore(entity.scoreboardIdentity) ?? 0;
    obj.setScore(entity.scoreboardIdentity, current - value);
    return true;
  } catch {
    return false;
  }
}

function hasTag(entity, tag) {
  try {
    return entity.hasTag(tag);
  } catch {
    return false;
  }
}

/**
 * Apply infinite effects only when needed (on spawn, score change, etc)
 */
function applyInfiniteEffects() {
  for (const player of world.getPlayers()) {
    try {
      const playerKey = player.id;
      const agility = getScoreValue(player, "agility");
      
      // Check if effects need to be applied/reapplied
      const currentEffectKey = `${playerKey}_${agility}`;
      
      if (!infiniteEffectsApplied.has(currentEffectKey)) {
        // Clear old effect keys for this player
        for (const key of infiniteEffectsApplied) {
          if (key.startsWith(playerKey)) {
            infiniteEffectsApplied.delete(key);
          }
        }
        
        // Apply jump boost based on agility (infinite duration)
        if (agility >= 45) {
          player.runCommand(`effect @s jump_boost infinite 2 true`);
        } else if (agility >= 30) {
          player.runCommand(`effect @s jump_boost infinite 1 true`);
        } else if (agility >= 15) {
          player.runCommand(`effect @s jump_boost infinite 0 true`);
        } else {
          player.runCommand(`effect @s clear jump_boost`);
        }
        
        infiniteEffectsApplied.add(currentEffectKey);
      }
      
    } catch (e) {
      continue;
    }
  }
}

/**
 * Apply short-duration effects that need frequent updates
 */
function applyDynamicEffects() {
  for (const player of world.getPlayers()) {
    try {
      const gameMode = player.getGameMode();
      if (gameMode === "spectator") continue;
      
      const agility = getScoreValue(player, "agility");
      const detectSprint = getScoreValue(player, "detect_sprint");
      const isHeianEra = hasTag(player, "heian_era");
      
      // Speed effects (only when sprinting)
      if (detectSprint >= 1) {
        if (isHeianEra) {
          player.runCommand(`effect @s speed 2 15 true`);
        } else if (agility >= 50) {
          player.runCommand(`effect @s speed 2 4 true`);
        } else if (agility >= 40) {
          player.runCommand(`effect @s speed 2 3 true`);
        } else if (agility >= 30) {
          player.runCommand(`effect @s speed 2 2 true`);
        } else if (agility >= 20) {
          player.runCommand(`effect @s speed 2 1 true`);
        } else if (agility >= 10) {
          player.runCommand(`effect @s speed 2 0 true`);
        }
      }
      
      // Saturation (only when move score is 0-5)
      const move = getScoreValue(player, "move");
      if (move >= 0 && move <= 5) {
        const isSatiated = hasTag(player, "satiated");
        const hasCurse = hasTag(player, "curse");
        
        if (isSatiated) {
          player.runCommand(`effect @s saturation 3 3 true`);
        } else if (hasCurse) {
          player.runCommand(`effect @s saturation 3 1 true`);
        }
      }
      
      // Exoskeleton resistance (only when stunned)
      const stun = getScoreValue(player, "Stun");
      if (hasTag(player, "exoskeleton") && stun >= 1) {
        player.runCommand(`effect @s resistance 2 0 true`);
      }
      
    } catch (e) {
      continue;
    }
  }
}

/**
 * Apply infinite effects to entities on spawn
 */
function applyEntityInfiniteEffects() {
  const overworld = world.getDimension("overworld");
  
  // Armor stands with Deleter score
  const armorStands = overworld.getEntities({ type: "minecraft:armor_stand" });
  for (const stand of armorStands) {
    try {
      if (entityEffectsApplied.has(stand)) continue;
      
      const deleter = getScoreValue(stand, "Deleter");
      if (deleter >= 1) {
        stand.runCommand(`effect @s invisibility infinite 10 true`);
        entityEffectsApplied.add(stand);
      }
    } catch (e) {
      continue;
    }
  }
  
  // Entities with BasicM1s or AfterAnim - CLEAR their speed
  const allEntities = overworld.getEntities();
  for (const entity of allEntities) {
    try {
      const basicM1s = getScoreValue(entity, "BasicM1s");
      const afterAnim = getScoreValue(entity, "AfterAnim");
      
      if (basicM1s >= 1 || afterAnim >= 1) {
        entity.runCommand(`effect @s clear speed`);
      }
    } catch (e) {
      continue;
    }
  }
}

/**
 * Timer system for energy regeneration and other cycles
 */
let tickCounter = 0;
const REGEN_INTERVAL = 20; // Every 1 second (20 ticks)
const FUGA_DRAIN_INTERVAL = 4; // Every 0.2 seconds (4 ticks) for fast fuga drain
const FULL_REGEN_TIME = 90; // 90 seconds for full regen

function handleTimerCycle() {
  tickCounter++;
  
  // Energy regeneration every second
  if (tickCounter % REGEN_INTERVAL === 0) {
    for (const player of world.getPlayers()) {
      try {
        if (hasTag(player, "heavenlyrestriction")) continue;
        if (hasTag(player, "domainclashing")) continue; // No regen during domain clash
        
        const energy = getScoreValue(player, "Energy");
        const energyCap = getScoreValue(player, "EnergyCap");
        const move = getScoreValue(player, "move");
        const domainActive = getScoreValue(player, "domainactive");
        
        // Stop regen if moving or domain is active
        if (move >= 1) continue;
        if (domainActive >= 1) continue;
        
        if (energyCap <= 0) continue; // No cap set
        if (energy >= energyCap) continue; // Already at cap
        
        // Calculate regen per second to reach full cap in 90 seconds
        // Formula: energyCap / 90 = amount to regen per second
        const regenPerSecond = Math.ceil(energyCap / FULL_REGEN_TIME);
        
        // Add energy but don't exceed cap
        const newEnergy = Math.min(energy + regenPerSecond, energyCap);
        setScore(player, "Energy", newEnergy);
        
      } catch (e) {
        continue;
      }
    }
  }
  
  // Fast fuga drain every 0.2 seconds when out of combat
  if (tickCounter % FUGA_DRAIN_INTERVAL === 0) {
    for (const player of world.getPlayers()) {
      try {
        const combat = getScoreValue(player, "combat");
        const fuga = getScoreValue(player, "fuga");
        
        // Drain fuga fast when out of combat (combat score 0-350)
        // 560 / 30 seconds = ~18.67 per second
        // Per 0.2 seconds = 18.67 / 5 = ~4 per tick
        if (combat >= 0 && combat <= 350) {
          if (fuga >= 4) {
            removeScore(player, "fuga", 4);
          } else if (fuga > 0) {
            // Drain remaining fuga if less than 4
            setScore(player, "fuga", 0);
          }
        }
      } catch (e) {
        continue;
      }
    }
  }
  
  // Regeneration every 10 seconds (200 ticks)
  if (tickCounter >= 200) {
    tickCounter = 0;
    
    // Apply regeneration to curse/heavenlyrestriction
    for (const player of world.getPlayers()) {
      try {
        const stun = getScoreValue(player, "Stun");
        if (stun > 0) continue;
        
        const hasCurse = hasTag(player, "curse");
        const hasHR = hasTag(player, "heavenlyrestriction");
        
        if (hasCurse || hasHR) {
          player.runCommand(`effect @s regeneration 5 0 true`);
        }
      } catch (e) {
        continue;
      }
    }
  }
}

/**
 * Main loop - runs every 2 ticks for dynamic effects
 */
system.runInterval(() => {
  applyDynamicEffects();
  handleTimerCycle();
}, 2);

/**
 * Slower loop - runs every 20 ticks for infinite effects and entity checks
 */
system.runInterval(() => {
  applyInfiniteEffects();
  applyEntityInfiniteEffects();
}, 20);

/**
 * Handle player spawn/respawn - reapply infinite effects
 */
world.afterEvents.playerSpawn.subscribe((event) => {
  const player = event.player;
  
  // Clear effect tracking for this player to force reapply
  for (const key of infiniteEffectsApplied) {
    if (key.startsWith(player.id)) {
      infiniteEffectsApplied.delete(key);
    }
  }
  
  // Reapply will happen on next cycle
});

/* ========== Initialization ========== */
system.runTimeout(() => {
  console.log("[EffectSystem] Efficient effect system initialized");
  console.log("[EffectSystem] Using infinite duration effects to minimize performance impact");
}, 20);



// Track all active projectiles
const activeProjectiles = new Map();

// Listen for the shoot projectile event
system.afterEvents.scriptEventReceive.subscribe((event) => {
  if (event.id !== "ds:shootprojectile") return;
  
  try {
    const shooter = event.sourceEntity;
    if (!shooter) return;
    
    // Parse the message: "entityType projectileName velocity:X scores:ScoreName ScoreValue [nearestTypeApply]"
    const args = event.message.split(" ");
    if (args.length < 2) return;
    
    const entityType = args[0]; // e.g., "ds:projectileentityname"
    const projectileName = args[1]; // e.g., "ProjectileNamedName"
    
    // Parse velocity (default to 3 blocks per tick if not specified)
    let velocity = 3;
    let scoreboardName = null;
    let scoreboardValue = null;
    let useNearest = false;
    
    for (let i = 2; i < args.length; i++) {
      const arg = args[i];
      
      if (arg.startsWith("velocity:")) {
        velocity = parseFloat(arg.split(":")[1]) || 3;
      } else if (arg === "scores:") {
        // Next two args should be scoreboard name and value
        if (i + 2 < args.length) {
          scoreboardName = args[i + 1];
          scoreboardValue = parseInt(args[i + 2]);
          i += 2; // Skip the next two args
        }
      } else if (arg === "nearestTypeApply") {
        useNearest = true;
      }
    }
    
    // Get shooter's view direction
    const viewDirection = shooter.getViewDirection();
    
    let projectile;
    
    if (useNearest) {
      // Find nearest entity matching type and name
      try {
        const nearbyEntities = shooter.dimension.getEntities({
          type: entityType,
          location: shooter.location,
          maxDistance: 50,
          closest: 1
        });
        
        // Filter by name if specified
        if (projectileName && projectileName !== "null" && projectileName !== "none") {
          const matchingEntities = nearbyEntities.filter(e => e.nameTag === projectileName);
          if (matchingEntities.length > 0) {
            projectile = matchingEntities[0];
          }
        } else if (nearbyEntities.length > 0) {
          projectile = nearbyEntities[0];
        }
        
        if (!projectile) {
          shooter.sendMessage("§cNo matching entity found nearby!");
          return;
        }
        
        console.warn(`Applied velocity to existing entity: ${projectile.id}`);
      } catch (e) {
        console.warn("Failed to find nearest entity:", e);
        return;
      }
    } else {
      // Spawn new projectile (original behavior)
      const spawnOffset = 0.1;
      const spawnLocation = {
        x: shooter.location.x + viewDirection.x * spawnOffset,
        y: shooter.location.y + 0.1 + viewDirection.y * spawnOffset,
        z: shooter.location.z + viewDirection.z * spawnOffset
      };
      
      projectile = shooter.dimension.spawnEntity(entityType, spawnLocation);
      
      // Set name tag if provided
      if (projectileName && projectileName !== "null" && projectileName !== "none") {
        projectile.nameTag = projectileName;
      }
      
      // Calculate rotation from view direction
      const yaw = Math.atan2(-viewDirection.x, viewDirection.z) * (180 / Math.PI);
      const pitch = Math.asin(-viewDirection.y) * (180 / Math.PI);
      
      // Set initial rotation immediately
      projectile.setRotation({ x: pitch, y: yaw });
    }
    
    // Set scoreboard if provided
    if (scoreboardName && !isNaN(scoreboardValue) && scoreboardValue !== null) {
      try {
        projectile.runCommand(`scoreboard players set @s ${scoreboardName} ${scoreboardValue}`);
        console.warn(`Set ${scoreboardName} to ${scoreboardValue} on projectile`);
      } catch (e) {
        console.warn("Failed to set scoreboard:", e);
      }
    }
    
    // Store projectile data
    activeProjectiles.set(projectile.id, {
      projectile: projectile,
      velocity: {
        x: viewDirection.x * velocity,
        y: viewDirection.y * velocity,
        z: viewDirection.z * velocity
      },
      shooter: shooter,
      age: 0
    });
    
    console.warn(`Projectile ${entityType} fired with velocity ${velocity}`);
    
  } catch (e) {
    console.warn("Projectile shoot error:", e);
  }
});

// Update all active projectiles every tick
system.runInterval(() => {
  const toRemove = [];
  
  for (const [projectileId, data] of activeProjectiles.entries()) {
    try {
      const projectile = data.projectile;
      
      // Check if projectile is still valid
      if (!projectile.isValid()) {
        toRemove.push(projectileId);
        continue;
      }
      
      // Move projectile based on velocity
      const currentLoc = projectile.location;
      const newLocation = {
        x: currentLoc.x + data.velocity.x,
        y: currentLoc.y + data.velocity.y,
        z: currentLoc.z + data.velocity.z
      };
      
      // Calculate rotation to face movement direction
      const velX = data.velocity.x;
      const velY = data.velocity.y;
      const velZ = data.velocity.z;
      
      const yaw = Math.atan2(-velX, velZ) * (180 / Math.PI);
      const pitch = Math.asin(-velY / Math.sqrt(velX*velX + velY*velY + velZ*velZ)) * (180 / Math.PI);
      
      // Teleport projectile to new location with correct rotation
      projectile.teleport(newLocation, {
        dimension: projectile.dimension,
        rotation: { x: pitch, y: yaw }
      });
      
      // Increment age
      data.age++;
      
      // Remove projectile after 200 ticks (10 seconds) as safety
      if (data.age > 200) {
        try {
          projectile.remove();
        } catch {}
        toRemove.push(projectileId);
      }
      
    } catch (e) {
      toRemove.push(projectileId);
    }
  }
  
  // Clean up removed projectiles
  for (const id of toRemove) {
    activeProjectiles.delete(id);
  }
}, 1);

console.warn("[Projectile Shooter] Loaded - Usage: /scriptevent ds:shootprojectile <entityType> <name> velocity:<speed>");