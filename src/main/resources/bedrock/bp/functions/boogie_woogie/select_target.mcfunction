# start
scoreboard players set @s Disabled 10
tag @s[tag=!boogietargetting] add boogietargetting

# tag new valid target nearby
execute unless entity @e[tag=boogie_target,r=5] as @e[r=5,c=1,tag=!unselect,tag=!heavenlyrestriction,family=!heavenlyrestriction,type=!item,family=!despawncito,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,tag=!boogietargetting] unless entity @s[family=motionless,family=!curse_warder,tag=!itemdrop,type=!ds:cursed_closet,type=!ds:judgeman,type=!ds:toji_apple,type=!ds:slots,type=!ds:clankers,type=!ds:lost_hiten] run tag @s[tag=!boogie_target] add boogie_target

# generate new BoogieSelfID & giv BoogieSelfID to the new target, only assign BoogieTargetID to the target
execute if entity @e[tag=boogie_target,r=5] run scoreboard players add ID BoogieTargetID 1
execute if entity @e[tag=boogie_target,r=5] run scoreboard players operation @s BoogieSelfID = ID BoogieTargetID
scoreboard players operation @e[tag=boogie_target,r=5,c=1] BoogieTargetID = @s BoogieSelfID

# feedback
execute if entity @e[tag=boogie_target,r=5] run tellraw @s[type=player] {"rawtext":[{"text":"§aTarget locked: §r§f"},{"selector":"@e[tag=boogie_target,r=5,c=1]"}]}
execute if entity @e[tag=boogie_target,r=5] run playsound random.orb @s[type=player]

# continue further if needed
execute positioned ^^^5 if entity @e[tag=boogietargetting,r=100] unless entity @e[tag=boogie_target,r=5] run function boogie_woogie/select_target

# clear tags and shi
tag @s[tag=boogietargetting] remove boogietargetting
tag @e[tag=boogie_target] remove boogie_target