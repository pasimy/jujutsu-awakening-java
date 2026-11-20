

playanimation @s animation.phase_red




particle ds:red_ex6
particle ds:red_ex4
particle ds:red_ex
particle ds:air_effect1

kill @e[type=item,r=40]
kill @e[type=arrow,r=40]
kill @e[type=fishing_hook,r=40]
kill @e[type=area_effect_cloud,r=40]
effect @e[tag=!Frames,r=35,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] resistance 1 2 true

damage @e[tag=!Frames,r=20,tag=!limitless,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 26 override
function damages/explosion_damage
summon ds:red_reversal ^^-1^-9 0 ~ minecraft:crystal_explode
summon ds:red_reversal ^3^-1^-9 0 ~ minecraft:crystal_explode
summon ds:red_reversal ^-3^-1^-9 0 ~ minecraft:crystal_explode
summon ds:red_reverse ^^-1^-9
summon ds:red_reverse ^-3^-1^-9
summon ds:red_reverse ^3^-1^-9