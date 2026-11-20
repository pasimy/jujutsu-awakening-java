execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:red_ex
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:red_ex1
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:red_ex7b
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:red_ex6
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:impact
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:ground_slam2 ^4^^
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] run particle ds:ground_slam2 ^-4^^

execute if entity @s[scores={move=938..940},r=90,c=1] as @p if entity @e[tag=griefable,c=1] run function 4x4sphere
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run damage @e[tag=!Frames,r=2.99,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] 200 entity_explosion
execute if entity @s[scores={move=938..940},r=90,c=1] as @p unless entity @e[name="Blue Core",type=ds:projectile,r=5,c=1] if entity @e[tag=!Frames,r=2.99,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] run summon ds:red_reverse ~~~
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=item,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=xp_orb,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=arrow,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=fishing_hook,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=area_effect_cloud,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p run kill @e[type=falling_block,r=4]
execute if entity @s[scores={move=938..940},r=90,c=1] as @p as @e[name="Blue Core",type=ds:projectile,r=5,c=1] at @s run function limitless/hollow_nuke_activate
execute if entity @s[scores={move=938..940},r=90,c=1] as @p if entity @e[name="Lapse2",type=ds:projectile,r=3,c=1] run function limitless/improvised_purple_small

function damages/explosion_damage
execute if entity @s[scores={move=938..940},r=90,c=1] unless entity @e[name="Lapse2",type=ds:projectile,r=3,c=1] unless entity @e[name="Blue Core",type=ds:projectile,r=3,c=1] positioned ^^^3 run function limitless/red_beam

