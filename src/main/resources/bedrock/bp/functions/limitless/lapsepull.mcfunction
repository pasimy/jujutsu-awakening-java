tag @s[tag=!selfentity] add selfentity

execute if entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!armor_stand,family=!flyhead,type=!ds:leech_curse,type=!ds:kiss_fish,type=!ds:ember_insect,type=!ds:centipede_curse] run function limitless/lapsepull1
execute unless entity @s[type=!item,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!snowball,type=!egg,type=!falling_block,type=!armor_stand,family=!flyhead,type=!ds:leech_curse,type=!ds:kiss_fish,type=!ds:ember_insect,type=!ds:centipede_curse] run function limitless/lapsepull2

tag @s[tag=collided] remove collided
tag @s[tag=lapsepull] remove lapsepull
tag @s[tag=selfentity] remove selfentity
tag @e[name=entityDetect,type=ds:projectile,tag=Frames] remove Frames