scoreboard players set @s[scores={divergent=5..,move=6..}] divergent 4
scoreboard players set @s[scores={bluefist=5..,move=6..}] bluefist 4
scoreboard players set @s[scores={domainamp=5..,move=6..}] domainamp 4
scoreboard players set @s[scores={Energy=-9999..3,domainamp=5..}] domainamp 4

tag @s[scores={move=1..2},tag=domainamp] remove domainamp

execute as @s[scores={move=6}] at @s run particle ds:domainamp_use ~~1~
execute as @s[scores={move=6}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.5 9999
execute as @s[scores={move=6}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.5 9999
execute as @s[scores={move=6}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.5 9999
execute as @s[scores={move=5}] at @s run particle ds:domainamp_use2 ~~1~
execute as @s[scores={move=5}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.35 9999
execute as @s[scores={move=5}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.35 9999
execute as @s[scores={move=5}] at @s run playsound beacon.deactivate @a[r=100] ~~~ 99999 0.35 9999


execute as @s[scores={move=1..5},hasitem={item=ds:domainamplification,location=slot.weapon.offhand,quantity=0}] at @s run replaceitem entity @s slot.weapon.offhand 1 ds:domainamplification 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}

execute as @s[scores={move=5}] at @s run scoreboard players set @s domainamp 300
execute as @s[scores={move=5}] at @s run scoreboard players operation @s domainamp += @s Energy
execute as @s[scores={move=5}] at @s run scoreboard players operation @s domainamp /= two Mode

scoreboard players remove @s[scores={domainamp=1..}] Energy 1
scoreboard players remove @s[scores={domainamp=1..}] Energy 1
scoreboard players remove @s[scores={domainamp=1..}] Energy 1
scoreboard players remove @s[scores={domainamp=1..}] Energy 1