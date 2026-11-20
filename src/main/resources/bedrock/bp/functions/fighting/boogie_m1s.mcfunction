
tag @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=0,punch=1},tag=120percent] add plusultra
tag @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=0,punch=1},tag=delusional_trait] add plusultra
#execute as @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=0,punch=1}] at @s run playsound note.pling @s ~~~ 0.05 0.87
execute as @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=1..,punch=1}] unless entity @s[tag=!120percent,tag=!delusional_trait] at @s run playsound note.pling @a ~~~ 0.05 0.4
execute as @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=1..,punch=1}] unless entity @s[tag=!120percent,tag=!delusional_trait] at @s run tellraw @s {"rawtext":[{"text":"§cPlus Ultra is on cooldown: §e"},{"score":{"name": "@s","objective": "ability11"}},{"text":"§c."}]}
scoreboard players set @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=0,punch=1},tag=plusultra] move 91
scoreboard players set @s[scores={Stun=0,Disabled2=0,Sneaking=1..,ability11=0,punch=1},tag=plusultra] ability11 6000





scoreboard players set @s[scores={BasicM1=1..,Stun=0}] M1Reset 25
scoreboard players set @s[scores={BasicM1=1..,BasicM1s=1}] Disabled 3
scoreboard players set @s[scores={BasicM1=1..,BasicM1s=2..3}] Disabled 7
scoreboard players set @s[scores={BasicM1=1..,BasicM1s=4..5}] Disabled 5

scoreboard players set @s[scores={BasicM1=1..,BasicM1s=1..5}] AfterAnim 20
scoreboard players set @s[scores={BasicM1s=5..}] Disabled 22
scoreboard players set @s[scores={BasicM1=1..2,BasicM1s=5..,Stun=0}] BasicM1s 0
scoreboard players set @s[scores={BasicM1s=6..}] BasicM1s 0
scoreboard players set @s[scores={BasicM1s=1..,Stun=1..}] BasicM1s 0

effect @s weakness 1 99 true

scoreboard players random @s[scores={BasicM1=6,BasicM1s=1..,Stun=0},tag=!heavenlyrestriction] blackflashchance 1 269
scoreboard players set @s[scores={BasicM1=6,BasicM1s=1..,Stun=0},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players add @s[scores={detect_left=1,BasicM1=0,BasicM1s=0..5,Disabled=0,detect_sneak=0}] BasicM1s 1


execute as @s[scores={BasicM1=8..}] at @s run function stance_animate_boogie
scoreboard players add @s[scores={detect_left=1,BasicM1=0,Disabled=0,detect_sneak=0,BasicM1s=1,Stun=0}] BasicM1 9
scoreboard players add @s[scores={detect_left=1,BasicM1=0,Disabled=0,detect_sneak=0,BasicM1s=2,Stun=0}] BasicM1 9
scoreboard players add @s[scores={detect_left=1,BasicM1=0,Disabled=0,detect_sneak=0,BasicM1s=3,Stun=0}] BasicM1 9
scoreboard players add @s[scores={detect_left=1,BasicM1=0,Disabled=0,detect_sneak=0,BasicM1s=4,Stun=0}] BasicM1 9
scoreboard players add @s[scores={detect_left=1,BasicM1=0,Disabled=0,detect_sneak=0,BasicM1s=5,Stun=0}] BasicM1 11


scoreboard players set @s[scores={BasicM1=4,BasicM1s=1..4}] atk 2
scoreboard players set @s[scores={BasicM1=4..5,BasicM1s=5}] atk 2

execute as @s[scores={BasicM1=3..5,BasicM1s=1..4}] at @s[scores={BasicM1=!4}] positioned ^^^1.85 run tag @e[tag=!Frames,r=1.8,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=!Big,tag=!filtered_target] add filtered_target
execute as @s[scores={BasicM1=5,BasicM1s=1..4}] at @s positioned ^^^1.85 if entity @e[tag=!Frames,r=1.8,tag=filtered_target,tag=!unselect,tag=!Big] run playsound mob.punch @a[r=80] ~~~ 10000 1.15 10000
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players operation @e[tag=!Frames,r=1.8,tag=filtered_target,tag=!unselect,tag=!Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^0.5 run playsound mob.witch.throw @a[r=80] ~~~ 1 0.75
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run damage @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] 5 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=1..2}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] Stun 20
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] Evade 9
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] Stun 20
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^1.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=1.8,tag=!Big] Evade 6


execute as @s[scores={BasicM1=3..5,BasicM1s=1..4}] at @s[scores={BasicM1=!4}] positioned ^^^3.85 run tag @e[tag=!Frames,r=4.849,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=Big,tag=!filtered_target] add filtered_target
execute as @s[scores={BasicM1=5,BasicM1s=1..4}] at @s positioned ^^^3.85 if entity @e[tag=!Frames,r=4.849,tag=filtered_target,tag=!unselect,tag=Big] run playsound mob.punch @a[r=80] ~~~ 10000 1.15 10000
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players operation @e[tag=!Frames,r=4.849,tag=filtered_target,tag=!unselect,tag=Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run damage @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] 5 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=1..2}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] Stun 22
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] Evade 9
execute as @s[scores={BasicM1=3,BasicM1s=3}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] Stun 22
execute as @s[scores={BasicM1=3,BasicM1s=1..4}] at @s positioned ^^^3.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=4.849,tag=Big] Evade 6


execute as @s[scores={BasicM1=3..7,BasicM1s=5}] at @s positioned ^^^2.85 run tag @e[tag=!Frames,r=2.8,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=!Big,tag=!filtered_target] add filtered_target
execute as @s[scores={BasicM1=3..7,BasicM1s=5}] at @s positioned ^^^2.85 as @e[tag=!Frames,r=2.8,tag=filtered_target,tag=!unselect,tag=!Big] at @s run tp @s ~~~ facing @e[scores={BasicM1=3..7,BasicM1s=5},r=8,c=1]
execute as @s[scores={BasicM1=5,BasicM1s=5}] at @s positioned ^^^2.85 if entity @e[tag=!Frames,r=2.8,tag=filtered_target,tag=!unselect,tag=!Big] run playsound mob.punch @a[r=80] ~~~ 10000 1 10000
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run scoreboard players operation @e[tag=!Frames,r=2.8,tag=filtered_target,tag=!unselect,tag=!Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run playsound mob.wither.shoot @a[r=80] ~~~ 10000 1.85 10000
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=2.8,tag=!Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run damage @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=2.8,tag=!Big] 8 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=2.8,tag=!Big] Stun 22
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=2.8,tag=!Big] Evade 15
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^2.85 run scoreboard players set @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=2.8,tag=!Big] Flourish 9

execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s run tp @s ~~~
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^0.5 run playsound mob.witch.throw @a[r=80] ~~~ 1 0.5
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^1^2.85 run particle ds:ground_slam2 
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^1^2.85 run particle ds:ground_slam3

execute as @s[scores={BasicM1=3..7,BasicM1s=5}] at @s positioned ^^^4.85 run tag @e[tag=!Frames,r=5.849,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=!Big,tag=!filtered_target] add filtered_target
execute as @s[scores={BasicM1=3..7,BasicM1s=5}] at @s positioned ^^^4.85 as @e[tag=!Frames,r=5.849,tag=filtered_target,tag=!unselect,tag=Big] at @s run tp @s ~~~ facing @e[scores={BasicM1=3..7,BasicM1s=5},r=12,c=1]
execute as @s[scores={BasicM1=5,BasicM1s=5}] at @s positioned ^^^4.85 if entity @e[tag=!Frames,r=5.849,tag=filtered_target,tag=!unselect,tag=Big] run playsound mob.punch @a[r=80] ~~~ 10000 1 10000
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run scoreboard players operation @e[tag=!Frames,r=5.849,tag=filtered_target,tag=!unselect,tag=Big] damage += @s damageadd
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run playsound mob.wither.shoot @a[r=80] ~~~ 10000 0.85 10000
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=5.849,tag=Big] Hit 2
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run damage @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=5.849,tag=Big] 8 override entity @s
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=5.849,tag=Big] Stun 22
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=5.849,tag=Big] Evade 15
execute as @s[scores={BasicM1=3,BasicM1s=5}] at @s positioned ^^^4.85 run scoreboard players set @e[tag=!Frames,tag=filtered_target,tag=!unselect,r=5.849,tag=Big] Flourish 9

execute as @s[scores={BasicM1=3,BasicM1s=1..5}] at @s run function damages/blunt_damage

scoreboard players set @s[scores={BasicM1=1..3,BasicM1s=1..4}] BasicM1 0