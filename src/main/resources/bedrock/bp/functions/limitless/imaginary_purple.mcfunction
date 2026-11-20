

execute if entity @e[type=ds:projectile,name=fuga_arrow1,r=15,c=1] run function hollow_nuked

scoreboard players random @s[scores={Deleter=0..62}] chance 1 5
execute as @s[scores={Deleter=0..62,chance=1}] at @s run particle ds:imaginary_purple7 ~~~



playanimation @s[name=ImaginaryP] animation.imaginaryp

execute as @s[scores={Deleter=0..}] at @s run function damages/deletion_damage

execute as @s[scores={Deleter=0..62}] at @s as @e[type=ds:toji,r=5] at @s run function mobs/toji_apple
execute as @s[scores={Deleter=0..62}] at @s as @e[type=ds:toji_boss,r=5] at @s run function mobs/toji_apple


execute as @s[scores={Deleter=0..62}] at @s unless block ~~~ air unless block ~~~ barrier run camerashake add @a[r=50] 4 0.1
execute as @s[scores={Deleter=0..62}] at @s unless block ~~~ air unless block ~~~ barrier run particle ds:imaginary_impact ~~1.84~
execute as @s[scores={Deleter=0..62}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble3
execute as @s[scores={Deleter=0..62}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble3

execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~~1~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~~3~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~~2~1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~~2~-1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ~-1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~~1~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~~3~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~~2~1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~~2~-1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-3 positioned ~-1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~~1~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~~3~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~~2~1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~~2~-1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-6 positioned ~-1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~~1~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~~3~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~~2~1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~~2~-1 run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~1~2~ run function 2x2sphere
execute as @s[scores={Deleter=0..62}] at @s if entity @e[tag=griefable] positioned ^^^-9 positioned ~-1~2~ run function 2x2sphere



execute as @s[scores={Deleter=0..62}] at @s as @e[tag=!Frames,r=5,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!player] unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand] run kill @s

execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple1 ~~~
execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple2 ~~~
execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple3 ~~~
execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple4 ~~~
execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple5 ~~~
execute as @s[scores={Deleter=0..62}] at @s unless entity @a[r=70] run particle ds:imaginary_purple6 ~~~



execute as @s[scores={Deleter=0..62}] at @s run particle ds:imaginary_purple_air2 ~~3~
execute as @s[scores={Deleter=0..62}] at @s run particle ds:imaginary_purple_air ~~3~
execute as @s[scores={Deleter=0..62}] at @s run camerashake add @a[r=50] 2.5 0.1
execute as @s[scores={Deleter=0..62}] at @s as @e[tag=!Frames,r=7,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s run particle ds:ashes ~~~

execute as @s[scores={Deleter=0..62}] at @s run scoreboard players set @e[r=64,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 20
execute as @s[scores={Deleter=0..62}] at @s run scoreboard players set @e[r=64,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Camera 20
execute as @s[scores={Deleter=0..62}] at @s run scoreboard players set @e[r=64,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,scores={move=0..,cutscene=0..}] Move 20
execute as @s[scores={Deleter=0..62}] at @s run tag @e[r=64,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,type=!player,scores={Move=1..,move=0..,cutscene=0..},tag=!unlimited_hit] add unlimited_hit
execute as @s[scores={Deleter=0..62}] at @s run effect @e[r=64,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,type=!player] slowness 1 30 true
execute as @s[scores={Deleter=0..62}] at @s run effect @e[r=64,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!lightning_bolt,type=!area_effect_cloud,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame] slow_falling 1 30 true

execute as @s[scores={Deleter=0..62}] at @s run effect @e[tag=!Frames,r=10,scores={domainamp=1..},tag=!unselect] resistance 1 5 true
execute as @s[scores={Deleter=0..62}] at @s run damage @e[tag=!Frames,r=4,scores={domainamp=1..},tag=!unselect] 15
execute as @s[scores={Deleter=0..62}] at @s run damage @e[tag=!Frames,r=4,tag=deletion_adapted,tag=!unselect] 33 projectile
execute as @s[scores={Deleter=0..62}] at @s run damage @e[tag=!Frames,r=4,tag=!deletion_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 200 projectile
execute as @s[scores={Deleter=0..62}] at @s run damage @e[tag=!Frames,r=4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 3 override

