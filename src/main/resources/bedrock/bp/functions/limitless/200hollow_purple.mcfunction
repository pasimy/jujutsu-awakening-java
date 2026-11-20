execute as @s[name=200HollowP,scores={Deleter=243..262},tag=!Stopped] at @s run tp @s ^^^0.55
execute as @s[name=200HollowP,scores={Deleter=243..262},tag=!Stopped] at @s run tp @s ^^^0.55
execute as @s[name=200HollowP,scores={Deleter=243..262},tag=!Stopped] at @s run tp @s ^^^0.55
execute as @s[name=200HollowP,scores={Deleter=0..242},tag=!Stopped] at @s run tp @s ^^^2.5
execute as @s[name=200HollowP,scores={Deleter=0..242},tag=!Stopped] at @s run tp @s ^^^2.5



scoreboard players random @s[name=200HollowP,scores={Deleter=0..262}] chance 1 5
execute as @s[name=200HollowP,scores={Deleter=0..250,chance=1}] at @s run particle ds:hollow_purple7 ~~16~

execute as @s[name=200HollowP,scores={Deleter=0..}] at @s if entity @e[type=ds:projectile,name=fuga_arrow1,r=40] run function hollow_nuked

execute as @s[name=200HollowP,scores={Deleter=260..264}] at @s run effect @a[r=100] night_vision 4 1 true
execute as @s[name=200HollowP,scores={Deleter=260..264}] at @s run particle ds:200hollow_shoot1 ^^16^-4
execute as @s[name=200HollowP,scores={Deleter=260..264}] at @s run particle ds:200purple_shoot2 ^^16^-4
execute as @s[name=200HollowP,scores={Deleter=260..264}] at @s run particle ds:200hollow_shoot3 ^^16^-4
execute as @s[name=200HollowP,scores={Deleter=260..264}] at @s run particle ds:200hollow_shoot4 ^^16^-4
execute as @s[name=200HollowP,scores={Deleter=1..}] at @s run function damages/deletion_damage

execute as @s[name=200HollowP,scores={Deleter=0..}] at @s as @e[tag=!Frames,r=65,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!player] unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand] run kill @s



playanimation @s[name=200HollowP,scores={Deleter=0..}] animation.200hollowp

execute as @s[name=200HollowP,scores={Deleter=0..200}] at @s unless block ~~~ air unless block ~~~ barrier run camerashake add @a[r=50] 4 0.1
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless block ~~~ air unless block ~~~ barrier run particle ds:hollow_impact ~~12.8~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble_rain
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless block ~~-0.3~ air unless block ~~-0.3~ barrier run particle ds:rubble3

execute as @s[name=200HollowP,scores={Deleter=4..250}] at @s if entity @a[tag=griefable,c=1] positioned ~~14~ unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock unless block ~~4~ bedrock unless block ~~5~ bedrock unless block ~~6~ bedrock unless block ~~-1~ bedrock unless block ~~-2~ bedrock unless block ~~-3~ bedrock unless block ~~-4~ bedrock unless block ~~-5~ bedrock unless block ~~-6~ bedrock unless block ~~~ barrier unless block ~~1~ barrier unless block ~~2~ barrier unless block ~~3~ barrier unless block ~~4~ barrier unless block ~~5~ barrier unless block ~~6~ barrier unless block ~~-1~ barrier unless block ~~-2~ barrier unless block ~~-3~ barrier unless block ~~-4~ barrier unless block ~~-5~ barrier unless block ~~-6~ barrier run fill ~6~6~6~-6~-6~-6 air

execute as @s[name=200HollowP,scores={Deleter=0..245}] at @s run summon ds:red_reversal ^ ^ ^-12
execute as @s[name=200HollowP,scores={Deleter=0..245}] at @s run summon ds:red_reversal ^ ^12 ^-12

execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple1 ~~~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple2 ~~~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple3 ~~~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple4 ~~~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple5 ~~~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s unless entity @a[r=70] run particle ds:200hollow_purple6 ~~~

execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s run particle ds:200hollow_purple_air2 ~~3~
execute as @s[name=200HollowP,scores={Deleter=0..250}] at @s run particle ds:200hollow_purple_air ~~3~
execute as @s[name=200HollowP,scores={Deleter=0..200}] at @s run camerashake add @a[r=150] 1.5 0.1
execute as @s[name=200HollowP,scores={Deleter=0..262}] at @s run effect @e[tag=!Frames,r=30,scores={domainamp=1..},tag=!unselect] resistance 1 5 true
execute as @s[name=200HollowP,scores={Deleter=0..262}] at @s run damage @e[tag=!Frames,r=30,scores={domainamp=1..},tag=!unselect] 15
execute as @s[name=200HollowP,scores={Deleter=0..262}] at @s run damage @e[tag=!Frames,r=17,tag=deletion_adapted,tag=!unselect] 50 projectile
execute as @s[name=200HollowP,scores={Deleter=0..262}] at @s run damage @e[tag=!Frames,r=17,tag=!deletion_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 300 projectile
execute as @s[name=200HollowP,scores={Deleter=0..262}] at @s run damage @e[tag=!Frames,r=17,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 10 override

scoreboard players set @s[name=200HollowP,scores={Deleter=4..197}] Deleter 3

