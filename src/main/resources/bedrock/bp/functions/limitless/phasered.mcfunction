tp @s ^^^2 facing @e[name=phaseredTRG,type=ds:projectile,r=100,c=1]
execute as @e[name=phaseredTRG,type=ds:projectile,r=100,c=1] at @s positioned ^^-1.5^-60 at @e[tag=limitless,r=60,c=1] if entity @e[tag=limitless,r=0.15,c=1,scores={Sneaking=0}] positioned ^^1.5^60 run tp @s ~~~ facing ^^^100
execute as @e[name=phaseredTRG,type=ds:projectile,r=100,c=1] at @s positioned ^^-1.5^5 at @e[tag=limitless,r=10,c=1] if entity @e[tag=limitless,r=0.15,c=1,scores={Sneaking=1..},type=player] positioned ^^1.5^-5 run tp @s ~~~ facing ^^^100
execute as @e[name=phaseredTRG,type=ds:projectile,r=100,c=1] at @s positioned ^^-1.5^5 unless entity @e[tag=limitless,r=10,c=1] positioned ^^^-65 at @e[tag=limitless,r=60,c=1] if entity @e[tag=limitless,r=0.15,c=1,scores={Sneaking=1..},type=player] positioned ^^1.5^-5 run tp @s ~~~ facing ^^^100

playanimation @s animation.phase_red

execute as @s[scores={Deleter=3..}] at @s unless block ~~~ air run scoreboard players set @s Deleter 2
execute as @s[scores={Deleter=3..}] at @s if entity @e[tag=!Frames,r=6,tag=!limitless,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame] run scoreboard players set @s Deleter 2


execute as @s[scores={Deleter=2}] at @s if entity @e[tag=griefable] run summon ds:lapse_explode
execute as @s[scores={Deleter=2}] at @s if entity @e[tag=griefable] run function 4x4sphere
execute as @s[scores={Deleter=2}] at @s if entity @e[tag=griefable] run summon ds:red_reverse
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex1 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex2 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex1 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex2 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex3 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex4 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex5 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex6 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex7 ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:red_ex ~~~
execute as @s[scores={Deleter=2}] at @s run particle ds:dirt2
execute as @s[scores={Deleter=2}] at @s run particle ds:dirt0
execute as @s[scores={Deleter=2}] at @s run particle ds:ground_slam2
execute as @s[scores={Deleter=2}] at @s run particle ds:ground_slam3
execute as @s[scores={Deleter=2}] at @s run particle ds:large_slam2
execute as @s[scores={Deleter=2}] at @s run particle ds:impact
execute as @s[scores={Deleter=2}] at @s run playsound random.explode @a[r=100] ~~~ 99999 0.5 99999
execute as @s[scores={Deleter=2}] at @s run playsound mob.shock1 @a[r=100] ~~~ 99999 1.5 99999
execute as @s[scores={Deleter=2}] at @s run camerashake add @a[r=100] 2 0.15
execute as @s[scores={Deleter=2}] at @s run damage @e[tag=!Frames,tag=!limitless,r=6,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 30 override
execute as @s[scores={Deleter=2}] at @s run scoreboard players set @e[tag=!Frames,tag=!limitless,r=6,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 30
execute as @s[scores={Deleter=2}] at @s run scoreboard players add @e[tag=!Frames,tag=!limitless,r=6,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] knockdown 25
execute as @s[scores={Deleter=2}] at @s run scoreboard players add @e[tag=!Frames,tag=!limitless,r=6,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Evade 12
execute as @s[scores={Deleter=2}] at @s run function damages/explosion_damage