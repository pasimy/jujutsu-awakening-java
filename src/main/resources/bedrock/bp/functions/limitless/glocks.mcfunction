execute as @p if entity @e[tag=griefable] run function 4x4sphere
execute as @p if entity @e[tag=griefable] positioned ^2^^ run function 4x4sphere
execute as @p if entity @e[tag=griefable] positioned ^-2^^ run function 4x4sphere
execute as @p run damage @e[tag=!Frames,r=2.99,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 14 override
execute as @p run damage @e[tag=!Frames,r=4.99,tag=Big,tag=!unselect] 14 override
execute as @p if entity @e[tag=glocks,r=50] positioned ^^^3 run function limitless/glocks
