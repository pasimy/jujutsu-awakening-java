kill @e[type=ds:projectile,r=5,tag=!DomainExpansion]
function damages/deletion_damage
particle ds:hollow_purple_impact ~~1~
particle ds:hollow_purple_make1 ~~1~
particle ds:hollow_purple_make2 ~~1~
particle ds:hollow_purple6 ~~-2.8~
particle ds:hollow_purple6 ~~-2.8~
particle ds:hollow_purple7 ~~-2.8~
particle ds:hollow_purple7 ~~-2.8~
particle ds:hollow_purple8 ~~-2.8~
particle ds:improvised_purple_end_small1 ~~1~
particle ds:improvised_purple_end6 ~~1~
particle ds:improvised_purple_small1 ~~1~
particle ds:improvised_purple_shockwave_small1 ~~1~
particle ds:improvised_purple_shockwave_small2 ~~1~
playsound mob.blitz2 @a[r=50] ~~~ 9999 0.85 9999
playsound mob.electricity @a[r=50] ~~~ 9999 0.5 9999
playsound mob.electricity @a[r=50] ~~~ 9999 0.5 9999
playsound mob.electricity @a[r=50] ~~~ 9999 0.5 9999
summon ds:red_reverse
camerashake add @a[r=50] 4 0.25
effect @a[r=50] night_vision 2 1 true
playsound music.bassboost @a[r=50] ~~~ 9999 1.8 9999
damage @e[tag=!Frames,r=10,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 40 override
execute as @e[tag=!Frames,r=10,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!player] unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand] run kill @s
summon ds:red_reversal