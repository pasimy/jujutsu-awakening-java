playanimation @s[scores={move=30}] animation.infinity_backhand
tp @s[scores={move=1..20}] ~~~

tag @s[scores={move=1..2},tag=wep1] remove wep1

tag @s[scores={move=24..,Stun=1..},tag=wep1] remove wep1
playanimation @s[scores={move=24..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=24..,Stun=1..}] move 0

scoreboard players set @s[scores={move=4..24}] Camera 4
scoreboard players set @s[scores={move=4..24}] Frames 4
scoreboard players set @s[scores={move=4..24}] Move 4

scoreboard players set @e[tag=BackhandTRG,r=85,c=1] Stun 25

execute as @s[scores={move=23}] at @s positioned ^^^7.05 run function limitless/flashstep

execute as @s[scores={move=24}] at @s run particle ds:evade1 ~~~
execute as @s[scores={move=24}] at @s run particle ds:evade2 ~~~
execute as @s[scores={move=24}] at @s run particle ds:evade3 ~~~
execute as @s[scores={move=24}] at @s run particle ds:evade ~~~
execute as @s[scores={move=24}] at @s run playsound mob.enderdragon.flap @a ~~~ 1 2

execute as @s[scores={move=22}] at @s run particle ds:evade1 ~~~
execute as @s[scores={move=22}] at @s run particle ds:evade2 ~~~
execute as @s[scores={move=22}] at @s run particle ds:evade3 ~~~
execute as @s[scores={move=22}] at @s run particle ds:evade ~~~
execute as @s[scores={move=22}] at @s run playsound mob.enderdragon.flap @a ~~~ 1 2

execute as @s[scores={move=21..22}] at @s positioned ^^^40 as @e[tag=BackhandTRG,r=46,c=1] at @s run tp @s @s
execute as @s[scores={move=21..22}] at @s positioned ^^^40 at @e[tag=BackhandTRG,r=46,c=1] run tp @s ^^^-1 facing @e[tag=BackhandTRG,r=0.15,c=1]
execute as @s[scores={move=14..20}] at @s run tp @s ~~~ facing @e[tag=BackhandTRG,r=5,c=1]
execute as @s[scores={move=14..20}] at @s run tp @e[tag=BackhandTRG,r=5,c=1] ^^^1.25



scoreboard players random @s[scores={move=19},tag=!heavenlyrestriction] blackflashchance 1 269
scoreboard players set @s[scores={move=19},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players set @s[scores={move=14..15}] atk 2
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run tag @e[r=2.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!filtered_target] add filtered_target
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run scoreboard players operation @e[r=2.2,tag=!Frames,tag=filtered_target,tag=!unselect] damage += @s damageadd
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run damage @e[r=2.2,tag=!Frames,tag=filtered_target,tag=!unselect] 8 override entity @s
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run scoreboard players set @e[r=2.2,tag=!Frames,tag=filtered_target,tag=!unselect] Hit 10
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run scoreboard players add @e[r=2.2,tag=!Frames,tag=filtered_target,tag=!unselect] Evade 8
execute as @s[scores={move=14}] at @s positioned ^^^2.25 as @e[r=2.2,tag=!Frames,tag=filtered_target,tag=!unselect,c=1] at @s run function limitless/fury_hit
execute as @s[scores={move=14}] at @s run function damages/blunt_damage
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 2 10000
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run playsound mob.wither.shoot @a ~~~ 10000 2 10000
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run playsound mob.wither.shoot @a ~~~ 10000 0.5 10000
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run playsound mob.wither.shoot @a ~~~ 10000 0.35 10000
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run playsound mob.shock1 @a ~~~ 10000 1.25 10000
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run particle ds:ground_slam2 ^^1^-1
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run particle ds:heavy_impact1 ^^1^-1
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run particle ds:heavy_impact2 ^^1^-1
execute as @s[scores={move=14}] at @s positioned ^^^2.25 run particle ds:heavy_impact3 ^^1^-1
execute as @s[scores={move=13..14}] at @s positioned ^^^1.05 run summon ds:knockback ~~~
execute as @s[scores={move=14}] at @s run tag @e[tag=BackhandTRG,r=100,c=1] remove BackhandTRG