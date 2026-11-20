playanimation @s[scores={move=20}] animation.shockwave_punch

tag @s[scores={move=1..2},tag=wep3] remove wep3

tag @s[scores={move=14..,Stun=1..},tag=wep3] remove wep3
playanimation @s[scores={move=14..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=14..,Stun=1..}] move 0

tp @s[scores={move=1..20}] ~~~
scoreboard players set @s[scores={move=13..14}] Camera 4
scoreboard players set @s[scores={move=13..14}] Frames 4

scoreboard players random @s[scores={move=14}] blackflashchance 1 269
scoreboard players set @s[scores={move=14},tag=blackflashrig] blackflashchance 7

execute as @s[scores={move=13}] at @s positioned ^^^6.25 run camerashake add @a[r=30] 4 0.25
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run scoreboard players operation @e[r=6.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] damage += @s damageadd
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run damage @e[r=6.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 7 override entity @s
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run scoreboard players set @e[r=6.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Hit 10
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run scoreboard players add @e[r=6.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Evade 7
execute as @s[scores={move=13}] at @s positioned ^^^6.25 as @e[r=6.2,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s run function limitless/fury_hit
execute as @s[scores={move=13}] at @s run function damages/blunt_damage
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound random.explode @a ~~~ 10000 1.5 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound random.explode @a ~~~ 10000 0.6 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound mob.wither.break_block @a ~~~ 10000 0.5 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound mob.wither.break_block @a ~~~ 10000 0.35 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound mob.wither.shoot @a ~~~ 10000 2 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound mob.wither.shoot @a ~~~ 10000 0.5 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run playsound mob.wither.shoot @a ~~~ 10000 0.35 10000
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:ground_slam2 ^^1^1
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:ground_slam2 ^^1^-2
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:ground_slam2 ^^1^-4
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:heavy_impact1 ^^1^-1
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:heavy_impact2 ^^1^-1
execute as @s[scores={move=13}] at @s positioned ^^^6.25 run particle ds:heavy_impact3 ^^1^-1
execute as @s[scores={move=12..13}] at @s positioned ^^^3 run summon ds:red_reverse
