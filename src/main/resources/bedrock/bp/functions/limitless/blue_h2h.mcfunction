tag @s[scores={bluefist=6..},tag=!fistenergy] add fistenergy
tag @s[scores={bluefist=1..5},tag=fistenergy] remove fistenergy

execute unless entity @s[scores={bluefist=1..,strength=30..}] run effect @s[scores={bluefist=1..}] strength 1 1 true
effect @s[scores={bluefist=1..,strength=30..49}] strength 1 2 true
effect @s[scores={bluefist=1..,strength=50..}] strength 1 3 true

scoreboard players remove @s[scores={atk=1..,Energy=4..}] Energy 4
scoreboard players set @s[scores={Energy=-99999..3,bluefist=4..}] bluefist 3

execute as @s[scores={atk=1..}] at @s positioned ^^^3 if entity @e[tag=!Frames,r=2.95,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s positioned ^^1^1.25 run function limitless/blue_hit

execute as @s[hasitem={item=ds:cursedenergy,location=slot.weapon.mainhand},tag=itemUse:ds:cursedenergy,scores={scroll=2,move=0,ab=0}] at @s run playsound beacon.deactivate @a ~~~ 1 3
scoreboard players set @s[hasitem={item=ds:cursedenergy,location=slot.weapon.mainhand},tag=itemUse:ds:cursedenergy,scores={scroll=2,move=0,ab=0}] Stun 5
scoreboard players set @s[hasitem={item=ds:cursedenergy,location=slot.weapon.mainhand},tag=itemUse:ds:cursedenergy,scores={scroll=2,move=0,ab=0}] bluefist 3

execute as @s[scores={bluefist=4..}] at @s run playsound beacon.ambient @a[r=50] ~~~ 0.05 2

execute as @s[scores={bluefist=-9999..1}] at @s run playsound random.fizz @a ~~~
execute as @s[scores={bluefist=-9999..1}] at @s run particle ds:blue_ac5 
execute as @s[scores={bluefist=-9999..1}] at @s run particle ds:blue_ac6
execute unless entity @s[scores={nocts=6..},tag=!spectator,tag=confiscation,tag=!havingcts,type=!player] run scoreboard players operation @s[scores={bluefist=-9999..2}] damageadd = @s damageinsurance
execute unless entity @s[scores={nocts=6..},tag=!spectator,tag=confiscation,tag=!havingcts,type=!player] run scoreboard players set @s[scores={bluefist=-9999..1}] damageinsurance 0
scoreboard players set @s[scores={divfist=1..,bluefist=-9999..2}] divfist 0
clear @s[scores={bluefist=-9999..1},hasitem={item=ds:bluefist},type=player] ds:bluefist
replaceitem entity @s[scores={bluefist=-9999..1},hasitem={item=ds:bluefist,location=slot.weapon.offhand},type=!player] slot.weapon.offhand 1 air

scoreboard players remove @s[scores={bluefist=1..}] bluefist 1