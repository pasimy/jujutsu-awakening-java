


scoreboard players random @s[name=HollowP,scores={Deleter=0..262}] chance 1 5
execute as @s[name=HollowP,scores={Deleter=0..250,chance=1}] at @s run particle ds:hollow_purple7 ~~~

execute if entity @e[type=ds:projectile,name=fuga_arrow1,r=20,c=1] run function hollow_nuked


execute as @s[name=HollowP,scores={Deleter=0..}] at @s as @e[tag=!Frames,r=20,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!player] unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand] run kill @s


execute as @s[name=HollowP,scores={Deleter=0..}] at @s run playsound mob.stormwraith.attack @a ~~~ 0.15 1.75
execute as @s[name=HollowP,scores={Deleter=0..}] at @s run playsound mob.stormwraith.attack @a ~~~ 0.15 1.5
execute as @s[name=HollowP,scores={Deleter=0..}] at @s run playsound mob.stormwraith.attack @a ~~~ 0.15 0.4

playanimation @s[name=HollowP,scores={Deleter=0..}] animation.hollowp

execute as @s[name=HollowP,scores={Deleter=0..200}] at @s unless block ~~~ air unless block ~~~ barrier run camerashake add @a[r=50] 4 0.1
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless block ~~~ air unless block ~~~ barrier run particle ds:hollow_impact ~~2.8~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble3
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble3

execute as @s[name=HollowP,scores={Deleter=0..250}] at @s if entity @e[tag=griefable] positioned ~~2~ run function 4x4sphere

execute as @s[name=HollowP,scores={Deleter=0..250}] at @s run particle mcdp_v:knockback_roar_particle_2 ~~2.8~

execute as @s[name=HollowP,scores={Deleter=0..240}] at @s run summon ds:lapse_explode ^^^-7

execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple1 ~~~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple2 ~~~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple3 ~~~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple4 ~~~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple5 ~~~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:hollow_purple6 ~~~

execute as @s[name=HollowP,scores={Deleter=0..250}] at @s run particle ds:hollow_purple_air2 ~~3~
execute as @s[name=HollowP,scores={Deleter=0..250}] at @s run particle ds:hollow_purple_air ~~3~
execute as @s[name=HollowP,scores={Deleter=0..200}] at @s run camerashake add @a[r=50] 2.5 0.1

execute as @s[name=HollowP,scores={Deleter=0..262}] at @s as @e[tag=!Frames,r=15,scores={domainamp=1..},tag=!unselect] positioned ^^^-9 unless entity @s[tag=limitless,scores={move=19..120},r=0.15] run effect @s resistance 1 5 true
execute as @s[name=HollowP,scores={Deleter=0..262}] at @s as @e[tag=!Frames,r=15,scores={domainamp=1..},tag=!unselect] positioned ^^^-9 unless entity @s[tag=limitless,scores={move=19..120},r=0.15] run damage @s 15 projectile

execute as @s[name=HollowP,scores={Deleter=0..262}] at @s as @e[tag=!Frames,r=7,tag=!deletion_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] positioned ^^^-9 unless entity @s[tag=limitless,scores={move=19..120},r=0.15] run damage @s 40 override
execute as @s[name=HollowP,scores={Deleter=0..262}] at @s as @e[tag=!Frames,r=7,tag=deletion_adapted,tag=!unselect] positioned ^^^-9 unless entity @s[tag=limitless,scores={move=19..120},r=0.15] run damage @s 10 override
execute as @s[name=HollowP,scores={Deleter=0..262}] at @s as @e[tag=!Frames,r=15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] positioned ^^^-9 unless entity @s[tag=limitless,scores={move=19..120},r=0.15] run damage @s 5 override

execute as @s[name=HollowP,scores={Deleter=0..262}] at @s run function damages/deletion_damage



scoreboard players set @s[name=HollowP,scores={Deleter=4..157}] Deleter 3
