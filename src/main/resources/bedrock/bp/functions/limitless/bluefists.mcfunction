playanimation @s[scores={move=20}] animation.blue_infuse

scoreboard players set @s[scores={divergent=5..,move=14..}] divergent 4
scoreboard players set @s[scores={bluefist=5..,move=14..}] bluefist 4
scoreboard players set @s[scores={domainamp=5..,move=14..}] domainamp 4

execute as @s[scores={move=9..10}] at @s run playsound random.wither.shoot @a[r=100] ~~~ 99999 0.76 9999
execute as @s[scores={move=9..10}] at @s run playsound beacon.activate @a[r=100] ~~~ 99999 1.15 9999

execute as @s[scores={move=8..10}] at @s run particle ds:divergent_ac4
execute as @s[scores={move=8..10}] at @s run particle ds:divergent_ac5
execute as @s[scores={move=8..10}] at @s run particle ds:divergent_ac6


replaceitem entity @s[scores={move=1..4},hasitem={item=ds:bluefist,location=slot.weapon.offhand,quantity=0}] slot.weapon.offhand 1 ds:bluefist 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}

scoreboard players operation @s[scores={move=11..12}] damageinsurance = @s damageadd
scoreboard players operation @s[scores={move=10}] damageadd *= two Mode


execute as @s[scores={move=5..10}] at @s run camerashake add @a[r=15] 1 0.25
execute as @s[scores={move=5..10}] at @s run scoreboard players set @s Stun 15
execute as @s[scores={move=5..10}] at @s run scoreboard players set @s Move 4
execute as @s[scores={move=5..10}] at @s run scoreboard players remove @s Energy 2


execute as @s[scores={move=10}] at @s run scoreboard players set @s bluefist 201

