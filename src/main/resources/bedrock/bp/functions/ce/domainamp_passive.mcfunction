tag @s[scores={domainamp=2..},tag=!fistenergy] add fistenergy

tag @s[scores={domainamp=3..},tag=!domainamplification] add domainamplification
tag @s[scores={domainamp=1..2},tag=domainamplification] remove domainamplification


playsound beacon.ambient @a ~~~ 0.005 2
scoreboard players add @s domainampCD 1
scoreboard players set @s nocts 5
scoreboard players set @s domainimmune 5
scoreboard players set @s[scores={divergentfistCD=0..1}] divergentfistCD 15
scoreboard players set @s[scores={hakarimode=4..}] hakarimode 3
scoreboard players set @s[scores={amberbeast=4..,Energy=4..}] Energy 1
effect @s resistance 1 1 true
effect @s[scores={Sneaking=1..}] resistance 3 3 true
execute if entity @e[scores={move=1..},r=15] run effect @s[type=!player,tag=!basic_behavior] resistance 1 3 true
execute if entity @e[family=projectile,tag=DomainExpansion,r=50] run effect @s[type=!player,tag=!basic_behavior] resistance 1 3 true
execute if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run effect @s[type=!player,tag=!basic_behavior] resistance 1 3 true

scoreboard players remove @s[scores={onfire=3..,Sneaking=0}] onfire 1
scoreboard players remove @s[scores={shocked=3..,Sneaking=0}] shocked 1
scoreboard players set @s[scores={onfire=3..,Sneaking=0}] onfire 2
scoreboard players set @s[scores={shocked=3..,Sneaking=0}] shocked 2

execute as @s[scores={atk=1..2,Energy=0..}] positioned ^^^3 as @e[scores={infinity=4..},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] positioned ^^^-3 run scoreboard players operation @s domainamp_damage = @e[scores={atk=1..2,Energy=0..,domainamp=1..},r=0.15,c=1] Energy
execute as @s[scores={atk=1..2,Energy=1..}] positioned ^^^3 as @e[scores={infinity=4..,domainamp_damage=1..},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players operation @s domainamp_damage /= ten Mode
execute as @s[scores={atk=1..2,Energy=1..}] positioned ^^^3 as @e[scores={infinity=4..,domainamp_damage=1..},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players operation @s infinity -= @s domainamp_damage
execute as @s[scores={atk=1..2,Energy=1..}] positioned ^^^3 as @e[scores={infinity=4..,domainamp_damage=1..},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players operation @s domainamp_damage /= five Mode
execute as @s[scores={atk=1..2,Energy=1..}] positioned ^^^3 as @e[scores={infinity=4..,domainamp_damage=1..},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players operation @s ability1 += @s domainamp_damage
execute as @s[scores={atk=1..2,Energy=0..}] positioned ^^^3 as @e[scores={infinity=..1},tag=limitless,tag=functiontrg_infinity,tag=!unselect,r=2.95] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players set @s infinity 3



execute as @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0}] at @s run playsound beacon.deactivate @a ~~~ 1 3
clear @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0},hasitem={item=ds:domainamplification},type=player] ds:domainamplification
replaceitem entity @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0},hasitem={item=ds:domainamplification,location=slot.weapon.offhand},type=!player] slot.weapon.offhand 1 air
scoreboard players set @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0}] Stun 5
scoreboard players set @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0,nocts=4..}] nocts 3
scoreboard players set @s[tag=itemUse:ds:cursedenergy,scores={scroll=5,move=0,ab=0,domainamp=1..}] domainamp 0

execute as @s[scores={domainamp=..1}] at @s run playsound beacon.activate @a ~~~ 1 2
tag @s[scores={domainamp=..1},tag=fistenergy] remove fistenergy

clear @s[scores={domainamp=..2},hasitem={item=ds:domainamplification},type=player] ds:domainamplification
replaceitem entity @s[scores={domainamp=..2},hasitem={item=ds:domainamplification,location=slot.weapon.offhand},type=!player] slot.weapon.offhand 1 air

scoreboard players remove @s[scores={domainamp=1..}] domainamp 1