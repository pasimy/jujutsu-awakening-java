playanimation @s[scores={move=40}] animation.divergent_enable

tag @s[scores={move=32..,Stun=1..},tag=divergentfist] remove divergentfist
playanimation @s[scores={move=32..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=32..,Stun=1..}] move 0

tag @s[scores={move=1..2},tag=divergentfist] remove divergentfist

scoreboard players set @s[scores={domainamp=5..,move=24..}] domainamp 4
scoreboard players set @s[scores={divergent=5..,move=24..}] divergent 4
scoreboard players set @s[scores={bluefist=5..,move=24..}] bluefist 4

execute as @s[scores={move=19..20}] at @s run playsound random.wither.shoot @a[r=100] ~~~ 99999 0.6 9999
execute as @s[scores={move=19..20}] at @s run playsound mob.blaze.shoot @a[r=100] ~~~ 99999 0.6 9999
execute as @s[scores={move=19..20}] at @s run playsound mob.cursed_energy @a[r=100] ~~~ 99999 1 9999

execute as @s[scores={move=12..20},tag=!roughce] at @s run particle ds:divergent_ac4
execute as @s[scores={move=12..20}] at @s run particle ds:divergent_ac5
execute as @s[scores={move=12..20},tag=!roughce] at @s run particle ds:divergent_ac6

execute as @s[scores={move=12..20},tag=roughce] at @s run particle ds:divergent_acgreen4
execute as @s[scores={move=12..20},tag=roughce] at @s run particle ds:divergent_acgreen6



execute as @s[scores={move=1..13},family=!purecurse,tag=!curse,tag=!roughce,hasitem={item=ds:divergentfists,location=slot.weapon.offhand,quantity=0}] unless entity @s[tag=has_sukuna,tag=sukuna,type=!player] unless entity @s[tag=sukuna,type=player] run replaceitem entity @s slot.weapon.offhand 1 ds:divergentfists 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}
execute as @s[scores={move=1..13},tag=!roughce,hasitem={item=ds:divergentfists,location=slot.weapon.offhand,quantity=0}] unless entity @s[family=!purecurse,tag=!curse] unless entity @s[tag=has_sukuna,tag=sukuna,type=!player] unless entity @s[tag=sukuna,type=player] run replaceitem entity @s slot.weapon.offhand 1 ds:divergentfists_purple 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}
execute as @s[scores={move=1..13},tag=roughce,hasitem={item=ds:divergentfists,location=slot.weapon.offhand,quantity=0}] unless entity @s[tag=has_sukuna,tag=sukuna,type=!player] unless entity @s[tag=sukuna,type=player] run replaceitem entity @s[scores={move=1..13},tag=roughce,tag=!sukuna,hasitem={item=ds:divergentfists_green,location=slot.weapon.offhand,quantity=0}] slot.weapon.offhand 1 ds:divergentfists_green 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}
replaceitem entity @s[scores={move=1..13},tag=has_sukuna,tag=sukuna,type=!player,hasitem={item=ds:divergentfists_red,location=slot.weapon.offhand,quantity=0}] slot.weapon.offhand 1 ds:divergentfists_red 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}
replaceitem entity @s[scores={move=1..13},tag=sukuna,type=player,hasitem={item=ds:divergentfists_red,location=slot.weapon.offhand,quantity=0}] slot.weapon.offhand 1 ds:divergentfists_red 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}
execute as @s[scores={move=20}] at @s run particle ds:dirt2
execute as @s[scores={move=20}] at @s unless block ~~-1~ air unless block ~~-1~ barrier run playsound mob.wither.break_block @a ~~~ 1 0.5
execute as @s[scores={move=20}] at @s unless block ~~-1~ air unless block ~~-1~ barrier run particle ds:crater
execute as @s[scores={move=20}] at @s unless block ~~-1~ air unless block ~~-1~ barrier run particle ds:rubble3

scoreboard players operation @s[scores={move=20}] damageinsurance = @s damageadd
scoreboard players operation @s[scores={move=20}] divfist = @s damageadd
scoreboard players operation @s[scores={move=20}] divfist /= two Mode
scoreboard players operation @s[scores={move=20}] damageadd += @s divfist
scoreboard players operation @s[scores={move=20},tag=roughce] divfist /= two Mode
scoreboard players operation @s[scores={move=20},tag=roughce] damageadd += @s divfist



execute as @s[scores={move=5..20}] at @s run camerashake add @a 4 0.25
scoreboard players set @s[scores={move=5..20}] Stun 15
scoreboard players set @s[scores={move=5..20}] Move 4
scoreboard players remove @s[scores={move=5..20}] Energy 2

scoreboard players set @s[scores={move=20}] divergent 300
scoreboard players operation @s[scores={move=20}] divergent += @s Energy
scoreboard players operation @s[scores={move=20}] divergent /= two Mode