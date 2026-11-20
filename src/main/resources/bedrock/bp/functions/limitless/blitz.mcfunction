execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run particle ds:spatial_blitz2
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run particle ds:spatial_blitz3
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run particle ds:spatial_blitz4
execute as @p if entity @e[tag=limitless,scores={move=5},r=3,c=1] run particle ds:impact
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run tag @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!filtered_target] add filtered_target
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] at @e[tag=!Frames,r=2.5,c=1,tag=filtered_target,tag=!unselect] positioned ~~0.5~ run function damages/fire_damage
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run damage @e[tag=!Frames,r=2.5,tag=filtered_target,tag=!unselect] 8 fire_tick
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run damage @e[tag=!Frames,r=2.5,tag=filtered_target,tag=!unselect] 8 projectile
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run scoreboard players set @e[tag=!Frames,r=2.5,tag=filtered_target,tag=!unselect] Stun 15
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run scoreboard players set @e[tag=!Frames,r=2.5,tag=filtered_target,tag=!unselect] Hit 3
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] as @e[tag=!Frames,r=2.5,tag=filtered_target,tag=!unselect] at @s run particle ds:heavy_impact1 ~~1~
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run fill ~~~~~~ air replace fire
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] run fill ~~~~~~ air replace soul_fire
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] if block ~~~ air positioned ^^^0.33 run function limitless/blitz
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] if block ~~~ fire positioned ^^^0.33 run function limitless/blitz
execute as @p if entity @e[tag=limitless,scores={move=5},r=25,c=1] if block ~~~ soul_fire positioned ^^^0.33 run function limitless/blitz