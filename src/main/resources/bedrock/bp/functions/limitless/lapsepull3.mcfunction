tag @s[scores={knockdown=40},tag=!collided] add collided

execute if entity @s[tag=!collided] run playsound mob.witch.throw @a ~~~ 1 0.5
execute if entity @s[tag=!collided] run playsound random.explode @a ~~~ 99999 1.95 99999
execute if entity @s[tag=!collided] run playsound random.explode @a ~~~ 99999 1.95 99999
execute if entity @s[tag=!collided] run playsound random.explode @a ~~~ 99999 1.95 99999
execute if entity @s[tag=!collided] run playsound random.explode @a ~~~ 99999 1.95 99999
execute if entity @s[tag=!collided] run playsound random.explode @a ~~~ 99999 1.95 99999
scoreboard players set @s[tag=!collided] knockdown 40
scoreboard players add @s[tag=!collided] Hit 3
effect @s[tag=!collided] slowness 1 3 true
tp @s[tag=!collided,tag=!selfentity] ~~~ facing @e[tag=selfentity,r=1,c=1]
execute as @s[tag=!collided] at @s run scriptevent ds:knockback -5
execute if entity @s[tag=!collided] at @e[tag=selfentity,r=1,c=1] facing entity @s feet positioned ^^^0.1 run particle ds:heavy_impact1 ~~1~
execute if entity @s[tag=!collided] at @e[tag=selfentity,r=1,c=1] facing entity @s feet positioned ^^^0.1 run particle ds:heavy_impact3 ~~1~
execute if entity @s[tag=!collided] at @e[tag=selfentity,r=1,c=1] facing entity @s feet positioned ^^^0.1 run particle ds:heavy_impact5 ~~1~
execute if entity @s[tag=!collided] at @e[tag=selfentity,r=1,c=1] facing entity @s feet positioned ^^^0.1 run particle ds:punch4 ~~1~

damage @s[tag=!collided,tag=Big] 12 override entity @e[scores={move=7},r=31,c=1]
scoreboard players add @s[tag=!collided,tag=Big] Evade 12
damage @s[tag=!collided,family=!small,tag=!Big] 9 override entity @e[scores={move=7},r=31,c=1]
scoreboard players add @s[tag=!collided,family=!small,tag=!Big] Evade 9
damage @s[tag=!collided,family=small,tag=!Big] 6 override entity @e[scores={move=7},r=31,c=1]
scoreboard players add @s[tag=!collided,family=small,tag=!Big] Evade 6

execute if entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] run damage @s[tag=!collided] 18 override entity @e[scores={move=7},r=31,c=1]
execute if entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] run scoreboard players add @s[tag=!collided] Evade 18
execute unless entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] if entity @e[tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,r=0.5,tag=!Big,family=!small] run damage @s[tag=!collided] 12 override entity @e[scores={move=7},r=31,c=1]
execute unless entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] if entity @e[tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,r=0.5,tag=!Big,family=!small] run scoreboard players add @s[tag=!collided] Evade 12
execute unless entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] unless entity @e[tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,r=0.5,tag=!Big,family=!small] if entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,family=!flyhead,type=!ds:leech_curse,type=!ds:kiss_fish,type=!ds:ember_insect,type=!ds:centipede_curse,r=0.5,family=small] run damage @s[tag=!collided] 6 override entity @e[scores={move=7},r=31,c=1]
execute unless entity @e[tag=collided,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,r=0.5,tag=Big] unless entity @e[tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,r=0.5,tag=!Big,family=!small] if entity @e[tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,family=!flyhead,type=!ds:leech_curse,type=!ds:kiss_fish,type=!ds:ember_insect,type=!ds:centipede_curse,r=0.5,family=small] run scoreboard players add @s[tag=!collided] Evade 6