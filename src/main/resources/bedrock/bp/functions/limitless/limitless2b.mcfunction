playanimation @s[scores={move=140}] animation.lapse_blue2

tag @s[scores={move=1..2},tag=form2b] remove form2b

scoreboard players set @s[scores={move=1..}] Move 4
scoreboard players set @s[scores={move=1..}] Frames 6

execute as @s[scores={move=140}] at @s run tp @s @s
execute as @s[scores={move=140}] at @s run playsound mob.wither.shoot @a ~~~ 100000 0.7 100000
execute as @s[scores={move=140}] at @s run playsound beacon.activate @a ~~~ 100000 0.74 100000

camera @s[scores={move=6..90},type=player] set minecraft:third_person
camera @s[scores={move=1..5},type=player] clear
execute as @s[scores={move=90}] at @s run camera @a[r=20] fade time 0 0.1 0.5 color 0 180 250

execute as @s[scores={move=94},family=gojo] at @s run summon ds:projectile ~~~ facing ^^^100 none RotateFacing
execute as @s[scores={move=94}] at @s run summon ds:projectile MaxBlue ^^^14
execute as @s[scores={move=1..94}] at @s run tp @e[type=ds:projectile,name=MaxBlue,r=30,c=1] ^^^14 facing @s
execute as @s[scores={move=15..90}] at @s run scoreboard players set @e[type=ds:projectile,name=MaxBlue,r=30,c=1] Deleter 10
execute as @s[scores={move=15..90},family=gojo] at @s run scoreboard players set @e[type=ds:projectile,name=RotateFacing,r=30,c=1] Deleter 10

execute as @s[scores={move=91..94},family=gojo] at @s run tp @e[type=ds:projectile,name=RotateFacing,r=30,c=1] ~~~ facing ^^^100
execute as @s[scores={move=15..90},family=gojo] at @s as @e[type=ds:projectile,name=RotateFacing,r=30,c=1] at @s run tp @s ~~~~4.5
execute as @s[scores={move=15..90},family=gojo] at @s rotated as @e[type=ds:projectile,name=RotateFacing,r=30,c=1] run tp @s ~~~ facing ^^^100

effect @e[type=ds:projectile,name=MaxBlue,r=30,c=1] resistance 1 20 true
effect @e[type=ds:projectile,name=MaxBlue,r=30,c=1] fire_resistance 1 20 true
effect @e[type=ds:projectile,name=MaxBlue,r=30,c=1] instant_health 1 20 true
playanimation @e[type=ds:projectile,name=MaxBlue,r=30,c=1] animation.max_lapse
execute as @e[type=ds:projectile,name=MaxBlue,r=30,c=1] at @s run function limitless/maxblue
