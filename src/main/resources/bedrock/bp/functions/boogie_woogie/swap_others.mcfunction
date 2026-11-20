tag @s[tag=!swapper] add swapper

#place location
execute unless entity @e[tag=swapped,r=5] as @e[r=5,c=1,tag=!unselect,tag=!heavenlyrestriction,family=!heavenlyrestriction,type=!item,family=!despawncito,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,tag=!swapper] unless entity @s[family=motionless,family=!curse_warder,tag=!itemdrop,type=!ds:cursed_closet,type=!ds:judgeman,type=!ds:toji_apple,type=!ds:slots,type=!ds:clankers,type=!ds:lost_hiten] unless entity @s[scores={Camera=1..},tag=Frames] unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] run tag @s[tag=!swapped] add swapped
execute unless entity @e[tag=swapped,r=5] as @e[r=5,c=1,tag=!unselect,tag=!heavenlyrestriction,family=!heavenlyrestriction,type=!item,family=!despawncito,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,tag=!swapper] unless entity @s[family=motionless,family=!curse_warder,tag=!itemdrop,type=!ds:cursed_closet,type=!ds:judgeman,type=!ds:toji_apple,type=!ds:slots,type=!ds:clankers,type=!ds:lost_hiten] unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] at @s[scores={Camera=1..,move=1..},tag=Frames] unless entity @e[scores={Camera=5..,Stun=5..},r=15,tag=!unselect] run tag @s[tag=!swapped] add swapped

tag @s[tag=swapper] remove swapper
execute unless entity @e[tag=swapped,r=5] if entity @e[tag=swapper,r=100] positioned ^^^5 run function boogie_woogie/swap_others


#swapping system below
#particles & iframes
execute if entity @e[tag=swapped,r=5] at @s run summon gg:impact_frame ~~~
execute if entity @e[tag=swapped,r=5] at @s run particle ds:boogie_woogie_tp ~~~
execute if entity @e[tag=swapped,r=5] at @s run particle ds:boogie_woogie_tp2 ~~~
execute as @e[tag=swapped,r=5,c=1] at @s run particle ds:boogie_woogie_tp ~~~
execute as @e[tag=swapped,r=5,c=1] at @s run particle ds:boogie_woogie_tp2 ~~~

#tps
execute if entity @e[tag=swapped,r=5] at @s run summon ds:rift ~~~ facing ^^^10 none swapper_location
execute if entity @e[tag=swapped,r=5] at @s run event entity @e[name=swapper_location,type=ds:rift,r=1,c=1] ds:disappear
execute at @e[tag=swapped,r=5,c=1] positioned ~~~ run tp @s ~~~
execute at @e[tag=swapped,r=5,c=1] positioned ~~~ unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={knock=1..}] unless entity @s[scores={knockdown=1..}] unless entity @s[scores={Flourish=1..}] unless entity @s[scores={atk=1..}] run tp @s ~~~ facing ^^^10
execute as @e[tag=swapped,r=5,c=1] at @e[name=swapper_location,type=ds:rift,c=1] run tp @s ~~~ facing ^^^10



#cleanup
execute if entity @e[name=swapper_location,type=ds:rift] run tag @e[tag=swapper,c=1] add just_swapped
execute if entity @e[name=swapper_location,type=ds:rift] run tag @e[tag=swapper] remove swapper
tag @e[tag=swapped,r=5] remove swapped

#swapped = target ur looking at
#@s = target u selected
#swapper = the user & target u selected