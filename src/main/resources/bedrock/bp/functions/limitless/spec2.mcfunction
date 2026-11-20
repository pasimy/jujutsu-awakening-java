playanimation @s[scores={move=100}] animation.shootup
execute as @s[scores={move=100}] at @s run playsound mob.shootup @a[r=100] ~~~ 99999 1 99999

tag @s[scores={move=1..3},tag=glocks] remove glocks

effect @s[scores={move=21..}] slow_falling 1 1 true
scoreboard players set @s[scores={move=3..}] Frames 5
scoreboard players set @s[scores={move=3..}] Move 5
execute as @s[scores={move=65..98}] at @s run scoreboard players set @a[r=50] Camera 5
execute as @s[scores={move=5..50}] at @s run scoreboard players set @a[r=50,tag=!unselect] Camera 5
execute as @s[scores={move=75..}] at @s run scoreboard players set @e[r=50,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 15
execute as @s[scores={move=5..74}] at @s run scoreboard players set @e[r=50,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 15
tp @s[scores={move=15..45}] @s
tp @s[scores={move=1..50}] ~~~
execute as @s[scores={move=1..}] at @s run fill ~4 ~4 ~4 ~-4 ~-4 ~-4 air [] replace barrier
execute as @s[scores={move=6..}] at @s run fill ~ ~-1 ~ ~ ~-1 ~ barrier [] replace air

execute as @s[scores={move=100}] at @s run camera @a[r=50] fade time 0 0.25 0.15 
execute as @s[scores={move=98}] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^^-1^3 facing ~~~
execute as @s[scores={move=81..97}] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_sine pos ^^-0.75^3 facing ~~0.15~

execute as @s[scores={move=66..80}] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.3 in_out_circ pos ^^-0.15^1.25 facing ~~~

execute as @s[scores={move=70}] at @s anchored eyes run camera @a[r=20] fade time 0 0 0.5 color 255 50 50
execute as @s[scores={move=70}] at @s anchored eyes run summon ds:glocks ~~-7~
execute as @s[scores={move=68..70}] at @s anchored eyes run playanimation @e[type=ds:glocks,r=10,c=1] animation.glocks
execute as @s[scores={move=16..}] at @s anchored eyes run scoreboard players set @e[type=ds:glocks,r=10,c=1] Deleter 20
execute as @s[scores={move=16..66}] at @s anchored eyes run tp @e[type=ds:glocks,r=10,c=1] ~~-0.5~ facing ^^^40
execute as @s[scores={move=1..14}] at @s anchored eyes run tp @e[type=ds:glocks,r=10,c=1] ~~-200~

execute as @s[scores={move=15..45}] at @s anchored eyes positioned ^^^1 run playsound mob.bullet @a ~~~ 0.05 2
execute as @s[scores={move=15..45}] at @s anchored eyes positioned ^^^1 run playsound mob.shock1 @a ~~~ 0.05 2
execute as @s[scores={move=15..45}] at @s anchored eyes positioned ^^^1 run camerashake add @a[r=100] 4 0.15
execute as @s[scores={move=15..45}] at @s anchored eyes positioned ^^^1 run effect @a[r=100] night_vision 1 1 true
execute as @s[scores={move=15..45}] at @s anchored eyes positioned ^^^1 run function limitless/glocks
