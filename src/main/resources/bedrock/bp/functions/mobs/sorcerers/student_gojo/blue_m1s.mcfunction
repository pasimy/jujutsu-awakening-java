scoreboard players set @s[scores={move=1..}] Move 4
scoreboard players set @s[scores={BasicM1=1..,Stun=0}] M1Reset 25
scoreboard players set @s[scores={BasicM1=1..,BasicM1s=1..4}] AfterAnim 10
scoreboard players set @s[scores={BasicM1=1..2,BasicM1s=4..,Stun=0}] BasicM1s 0
scoreboard players set @s[scores={BasicM1s=5..}] BasicM1s 0
scoreboard players set @s[scores={BasicM1s=1..,Stun=1..}] BasicM1s 0
scoreboard players set @s[scores={BasicM1=1..,Stun=1..}] BasicM1 0
scoreboard players set @s[scores={move=3..,Stun=1..}] move 2

scoreboard players set @s[scores={BasicM1=1..2}] BasicM1 0

scoreboard players random @s[scores={BasicM1=6,BasicM1s=1..,Stun=0},tag=!heavenlyrestriction] blackflashchance 1 269
scoreboard players set @s[scores={BasicM1=6,BasicM1s=1..,Stun=0},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players add @s[scores={move=3..22,BasicM1=0,BasicM1s=0..4,Stun=0}] BasicM1s 1


scoreboard players add @s[scores={move=3..22,BasicM1=0,BasicM1s=1,Stun=0}] BasicM1 6
scoreboard players add @s[scores={move=3..22,BasicM1=0,BasicM1s=2,Stun=0}] BasicM1 8
scoreboard players add @s[scores={move=3..22,BasicM1=0,BasicM1s=3,Stun=0}] BasicM1 6
scoreboard players add @s[scores={move=3..22,BasicM1=0,BasicM1s=4,Stun=0}] BasicM1 8
execute as @s[scores={BasicM1=6..8}] run function mobs/sorcerers/student_gojo/stance_animate_blue


scoreboard players set @s[scores={BasicM1=4,BasicM1s=1..4}] atk 2

execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run tag @e[type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!Frames,r=1.8,tag=!Big,tag=!filtered_target] add filtered_target
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players operation @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^0.5 run playsound mob.witch.throw @a ~~~ 1 0.75
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 if entity @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] run playsound mob.punch @a ~~~ 10000 1.95 10000
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run damage @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] 6 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=1..2}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] Stun 16
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] Evade 9
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] Stun 6
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=filtered_target,tag=!unselect,tag=!Frames,r=1.8,tag=!Big] Evade 6


execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players operation @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 if entity @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] run playsound mob.punch @a ~~~ 10000 1.95 10000
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run damage @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] 6 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=1..2}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] Stun 16
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] Evade 9
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] Stun 6
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!unselect,tag=!Frames,r=4.849,tag=Big] Evade 6


execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s run function damages/blunt_damage

scoreboard players set @s[scores={BasicM1=1..3,BasicM1s=1..3}] BasicM1 0