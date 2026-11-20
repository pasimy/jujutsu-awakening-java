playanimation @s[scores={move=90}] animation.pointblank

tag @s[scores={move=1..2},tag=wep4] remove wep4

scoreboard players set @s[scores={move=1..70}] Camera 4
scoreboard players set @s[scores={move=1..90}] Frames 4
scoreboard players set @s[scores={move=1..}] Move 4
scoreboard players set @e[tag=pointblank2,r=5,c=1] Stun 25
scoreboard players set @e[tag=pointblank2,r=5,c=1] Camera 4

execute as @s[scores={move=83}] at @s run particle ds:ground_slam2
execute as @s[scores={move=83}] at @s run particle ds:leap
execute as @s[scores={move=83}] at @s run playsound mob.enderdragon.flap @a ~~~ 1 0.8
execute as @s[scores={move=80..83}] at @s run scriptevent ds:knockback 2
execute as @s[scores={move=79..83}] at @s run tag @e[tag=!Frames,r=2,c=1,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] add pointblank2
execute as @s[scores={move=79..83}] at @s if entity @e[tag=pointblank2,r=2,c=1] run scoreboard players set @s move 71
execute as @s[scores={move=72..77}] at @s unless entity @e[tag=pointblank2,r=2,c=1] run scoreboard players set @s Stun 12
execute as @s[scores={move=72..77}] at @s unless entity @e[tag=pointblank2,r=2,c=1] run scoreboard players set @s move 2

execute as @s[scores={move=21..70}] at @s run tp @s @s
execute as @s[scores={move=51..70}] at @s positioned ^^^0.75 run tp @e[tag=pointblank2,r=5,c=1] ~~~ facing @s
execute as @s[scores={move=21..50}] at @s positioned ^^^0.55 run tp @e[tag=pointblank2,r=5,c=1] ~~~ facing @s


camera @s[scores={move=21..70},type=player] set minecraft:free pos ^1.5 ^2.25 ^1 facing ~~1.4~

playanimation @s[scores={move=70}] animation.pointblank2 

execute as @s[scores={move=20}] at @s run camera @a[r=20] fade time 0 0 0.5 color 255 50 50
execute as @s[scores={move=46}] at @s run playsound mob.red3 @a[r=50] ~~~ 9999 0.8 9999
execute as @s[scores={move=20}] at @s run playsound mob.red2 @a[r=50] ~~~ 9999 1.2 9999
execute as @s[scores={move=20}] at @s run playsound mob.shock1 @a[r=50] ~~~ 9999 1.2 9999
execute as @s[scores={move=20}] at @s run particle ds:red_ex1 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:red_ex2 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:red_ex4 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:red_ex5 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:red_ex6 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:red_ex7 ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:impact ^^1^1
execute as @s[scores={move=20}] at @s run particle ds:dirt0
execute as @s[scores={move=20}] at @s run camerashake add @a[r=40] 4 0.25
execute as @s[scores={move=20}] at @s run damage @e[tag=pointblank2,r=5,c=1] 50 override entity @s
execute as @s[scores={move=20}] at @s run scoreboard players add @e[tag=pointblank2,r=5,c=1] knockdown 95
execute as @s[scores={move=20}] at @s run scoreboard players add @e[tag=pointblank2,r=5,c=1] Hit 3
execute as @s[scores={move=20}] at @s run scoreboard players set @e[tag=pointblank2,r=5,c=1] Stun 50
execute as @s[scores={move=20}] at @s run scoreboard players add @e[tag=pointblank2,r=5,c=1] Evade 25
execute as @s[scores={move=20}] at @s run tag @e[tag=pointblank2,c=1] remove pointblank2
execute as @s[scores={move=19}] at @s run summon ds:red_reverse ^^^0.25

execute as @s[scores={move=4..16}] at @s run scoreboard players set @s move 2


