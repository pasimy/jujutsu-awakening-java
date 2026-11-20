particle ds:improvised_purple_end2
particle ds:improvised_purple_end3
tp @e[type=ds:projectile,name=fuga_arrow1,r=150,c=1] ~~~
particle ds:limitless_explode1
particle ds:limitless_explode2
particle ds:limitless_explode3
particle ds:improvised_purple_end1
particle ds:nuke_purple_explode1
particle ds:nuke_purple_explode2
particle ds:nuke_purple_explode3
damage @e[r=50,tag=!limitless,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 450 override
damage @e[r=50,tag=limitless,tag=!unselect] 150 override
execute as @e[tag=!Frames,r=50,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!player] unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand] run kill @s
camerashake add @a[r=150] 4 1 rotational
summon gg:impact_frame
execute as @a[r=150] at @s run playsound music.red @s ~~~ 99999 0.5 999999
playsound mob.shock1 @a[r=150] ~~~ 99999 0.5 99999
playsound mob.shock1 @a[r=150] ~~~ 99999 0.25 99999
execute if entity @p[tag=griefable] run function 32x32sphere
execute if entity @p[tag=griefable] unless block ~~~ bedrock unless block ~~-1~ bedrock unless block ~~-2~ bedrock unless block ~~-3~ bedrock unless block ~~-4~ bedrock unless block ~~-5~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock unless block ~~4~ bedrock unless block ~~5~ bedrock unless block ~~~ barrier unless block ~~-1~ barrier unless block ~~-2~ barrier unless block ~~-3~ barrier unless block ~~-4~ barrier unless block ~~-5~ barrier unless block ~~1~ barrier unless block ~~2~ barrier unless block ~~3~ barrier unless block ~~4~ barrier unless block ~~5~ barrier run fill ~5~5~5~-5~-5~-5 air
scoreboard players set @s[type=ds:projectile,name=fuga_arrow1,r=150,c=1] Deleter 9
kill @s