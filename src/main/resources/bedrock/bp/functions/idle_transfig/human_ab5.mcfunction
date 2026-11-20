execute as @s[type=player,scores={move=20..21}] at @s unless entity @s[hasitem={item=ds:unstable_transfigured_human,quantity=4..}] run scoreboard players add @s Energy 500
execute as @s[type=player,scores={move=20..21}] at @s unless entity @s[hasitem={item=ds:unstable_transfigured_human,quantity=4..}] run scoreboard players set @s move 3

playanimation @s[scores={move=20..21}] animation.mahito.human_ab5
scoreboard players set @s[scores={move=20..21}] Move 15

execute as @s[type=!player] at @s run tp @s ~~~


event entity @s[scores={move=20..21}] dual_souls
event entity @s[scores={move=15..16}] mahito_metal_off

execute as @s[scores={move=19}] at @s run playsound mob.whoosh1 @a[r=33] ~~1~ 99999 1 99999


event entity @s[scores={move=16}] soul_isomer_spawn
execute as @s[scores={move=15}] at @s run tp @e[type=ds:familiar_entity,r=5,c=1] ^1.5^^ facing ^^^30
execute as @s[scores={move=15}] at @s run tp @e[type=ds:familiar_entity,r=5,c=1] ^-1.5^^ facing ^^^30

execute as @s[scores={move=15},tag=!rogue_sorcerer,tag=!sukuna,type=player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_curse
execute as @s[scores={move=15},tag=rogue_sorcerer,tag=!sukuna,type=player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_rogue
execute as @s[scores={move=15},tag=sukuna,type=player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_sukuna

execute as @s[scores={move=15},tag=!rogue_sorcerer,tag=!sukuna,type=!player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_curse_ptrg
execute as @s[scores={move=15},tag=rogue_sorcerer,tag=!sukuna,type=!player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_rogue_ptrg
execute as @s[scores={move=15},tag=sukuna,type=!player] at @s run event entity @e[type=ds:familiar_entity,r=5,c=2] soul_isomer_spawn_sukuna_ptrg

clear @s[scores={move=15},type=player,tag=!unselect] ds:unstable_transfigured_human 0 4

tag @s[scores={move=0..3}] remove form12