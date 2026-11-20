playanimation @s[scores={move=120}] animation.fury_barrage

tag @s[scores={move=1..2},tag=wep2] remove wep2

tag @s[scores={move=114..,Stun=1..},tag=wep2] remove wep2
playanimation @s[scores={move=114..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=114..,Stun=1..}] move 0

execute as @s[scores={move=12..105}] at @s run scoreboard players set @e[tag=FuryBarrage2,r=5,c=1] Camera 4
scoreboard players set @s[scores={move=1..114}] Camera 4
scoreboard players set @s[scores={move=1..114}] Frames 4
scoreboard players set @s[scores={move=1..114}] Move 4

scoreboard players set @e[tag=FuryBarrage2,r=5,c=1] Stun 25

execute as @s[scores={move=1..111}] at @s facing entity @e[tag=FuryBarrage2,r=5,c=1] feet rotated ~ 0 run tp @s ~~~ facing ^^^1.25
execute as @s[scores={move=1..111}] at @s run tp @e[tag=FuryBarrage2,r=5,c=1] ^^^1.25 facing @s
tp @s[scores={move=1..}] @s

execute as @s[scores={move=81..105},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^1 ^1 ^1.25 rot ~38 ~110
execute as @s[scores={move=41..80},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^-1.85 ^-0.33 ^0.35 rot ~-9 ~280
execute as @s[scores={move=12..41},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^1.25 ^-0.35 ^0.75 rot ~-7 ~90
execute as @s[scores={move=81..105}] at @s anchored eyes run camera @a[tag=FuryBarrage2,r=5,c=1] set minecraft:free pos ^1 ^1 ^1.25 rot ~38 ~110
execute as @s[scores={move=41..80}] at @s anchored eyes run camera @a[tag=FuryBarrage2,r=5,c=1] set minecraft:free pos ^-1.85 ^-0.33 ^0.35 rot ~-9 ~280
execute as @s[scores={move=12..41}] at @s anchored eyes run camera @a[tag=FuryBarrage2,r=5,c=1] set minecraft:free pos ^1.25 ^-0.35 ^0.75 rot ~-7 ~90
camera @s[scores={move=1..11},type=player] clear

execute as @s[scores={move=111}] at @s positioned ^^^2.25 run tag @e[tag=!Frames,r=2.2,c=1,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] add FuryBarrage2
execute as @s[scores={move=111}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 1 override entity @s
execute as @s[scores={move=111}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=111}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=111}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=111}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 1.5 10000
execute as @s[scores={move=111}] at @s positioned ^^^2.25 run playsound mob.wither.break_block @a ~~~ 10000 0.45 10000

execute as @s[scores={move=106..107},tag=wep2] at @s positioned ^^^2.25 unless entity @e[tag=FuryBarrage2,r=2.2,c=1] run tag @s remove wep2
execute as @s[scores={move=106..107}] at @s positioned ^^^2.25 unless entity @e[tag=FuryBarrage2,r=2.2,c=1] run playanimation @s animation.stunned
execute as @s[scores={move=106..107}] at @s positioned ^^^2.25 unless entity @e[tag=FuryBarrage2,r=2.2,c=1] run scoreboard players set @s move 0

execute as @s[scores={move=41..70}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 1 override entity @s


execute as @s[scores={move=104}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 1 override entity @s
execute as @s[scores={move=104}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=104}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=104}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=104}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 1.35 10000

execute as @s[scores={move=99}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 1 override entity @s
execute as @s[scores={move=99}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=99}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=99}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=93}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=93}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=93}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=93}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 1.15 10000

execute as @s[scores={move=87}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=87}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=87}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=81}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=81}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=81}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=80}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=80}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=80}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=80}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=80}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=80}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=78}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=78}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=78}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=78}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=78}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=78}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=76}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=76}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=76}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=75}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=75}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=75}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=76}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=76}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=76}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=75}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=75}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=75}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=74}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=74}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=74}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=73}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=73}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=73}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=72}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=72}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=72}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=71}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=71}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=71}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=40..70}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=40..70}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=40..70}] at @s positioned ^^^1.25 run function limitless/fury_hit

execute as @s[scores={move=35}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=35}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=35}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=35}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 1.6 10000

execute as @s[scores={move=30}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 1 override entity @s
execute as @s[scores={move=30}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] Hit 3
execute as @s[scores={move=30}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 1
execute as @s[scores={move=30}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=30}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 1.3 10000


scoreboard players random @s[scores={move=24}] blackflashchance 1 69
scoreboard players set @s[scores={move=24},tag=blackflashrig] blackflashchance 7

execute as @s[scores={move=20..21}] at @s positioned ^^^2.25 run scoreboard players set @s atk 2
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run scoreboard players operation @e[tag=FuryBarrage2,r=2.2,c=1] damage += @s damageadd
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run damage @e[tag=FuryBarrage2,r=2.2,c=1] 25 override entity @s
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Hit 15
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run scoreboard players add @e[tag=FuryBarrage2,r=2.2,c=1] Evade 7
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run scoreboard players set @e[tag=FuryBarrage2,r=2.2,c=1] knockdown 95
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run effect @e[tag=FuryBarrage2,r=2.2,c=1] levitation 1 13 true
execute as @s[scores={move=19..20}] at @s positioned ^^^1.5 run summon ds:knockback ^-1.5^^
execute as @s[scores={move=20}] at @s positioned ^^^1.25 run function limitless/fury_hit
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run playsound mob.wither.shoot @a ~~~ 10000 0.5 10000
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run playsound mob.wither.shoot @a ~~~ 10000 2 10000
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 0.5 10000
execute as @s[scores={move=20}] at @s positioned ^^^2.25 run playsound random.explode @a ~~~ 10000 0.75 10000
execute as @s[scores={move=20}] at @s run tag @e[tag=FuryBarrage2,r=100,c=1] remove FuryBarrage2

#title @s[tag=!impactframesoff,scores={move=20}] title 
#title @s[tag=!impactframesoff,scores={move=19}] title 
#title @s[tag=!impactframesoff,scores={move=18}] title 
#title @s[tag=!impactframesoff,scores={move=17}] title 
#title @s[tag=!impactframesoff,scores={move=16}] title 
#title @s[tag=!impactframesoff,scores={move=15}] title §l
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact1 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact1 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact2 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact2 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact3 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:heavy_impact3 ~~1~
execute as @s[scores={move=21}] at @s positioned ^^^2.25 as @e[tag=FuryBarrage2,r=5,c=1] at @s run particle ds:ground_slam2 ~~1~
