playanimation @s[scores={move=35}] animation.spacial_kick

tag @s[scores={move=1..2},tag=form4c] remove form4c

tag @s[scores={move=25..,Stun=1..},tag=form4c] remove form4c
playanimation @s[scores={move=25..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=25..,Stun=1..}] move 0

scoreboard players set @s[scores={move=15..}] Move 4
scoreboard players set @s[scores={move=1..}] Frames 4

tp @s[scores={move=10..}] ~~~

execute as @s[scores={move=35}] at @s run particle ds:lapse_pull4 ~~1~
execute as @s[scores={move=25}] at @s run playsound beacon.deactivate @a ~~~ 9999 0.8 9999
execute as @s[scores={move=24}] at @s run camerashake add @a[r=40] 0.25 0.1
execute as @s[scores={move=24}] at @s run particle ds:lapse_pull3 ~~1~
execute as @s[scores={move=24}] at @s run particle ds:spatial_warp1 ~~1~
execute as @s[scores={move=24}] at @s run particle ds:spatial_warp2 ~~1~
execute as @s[scores={move=24}] at @s run particle ds:spatial_warp3 ~~1~
execute as @s[scores={move=24}] at @s run playsound music.distort3 @a ~~~ 9999 1.5 9999
execute as @s[scores={move=24}] at @s run playsound beacon.deactivate @a ~~~ 9999 0.8 9999
execute as @s[scores={move=24}] at @s run playsound random.glass @a ~~~ 9999 0.65 9999

execute as @s[scores={move=25},tag=!hasTRG] at @s anchored eyes positioned ^^^5.05 run function limitless/warp
execute as @s[scores={move=15..25}] at @s as @e[tag=warp,r=60,c=1] at @s run tp @s ~~~
execute as @s[scores={move=15..25}] at @s at @e[tag=warp,r=60,c=1] run tp @s ^0.3^0.4^-1 facing @e[tag=warp,r=0.15,c=1]

execute as @s[scores={move=21..25}] at @s unless entity @e[tag=warp,r=60,c=1] run playanimation @s animation.stunned
execute as @s[scores={move=21..25}] at @s unless entity @e[tag=warp,r=60,c=1] run scoreboard players set @s move 3

execute as @s[scores={move=15}] at @s run playsound mob.shock1 @a[r=25] ~~~ 9999 2 9999
execute as @s[scores={move=15}] at @s as @e[tag=!Frames,tag=warp,r=3,c=1] at @s run tp @s ~~~ facing @e[scores={move=15},r=3,c=1]
execute as @s[scores={move=15}] at @s run damage @e[tag=!Frames,tag=warp,r=3,c=1] 8 override entity @s
execute as @s[scores={move=15}] at @s run scoreboard players operation @e[tag=!Frames,tag=warp,r=3,c=1] damage += @s damageadd
execute as @s[scores={move=15}] at @s run scoreboard players add @e[tag=!Frames,tag=warp,r=3,c=1] Hit 3
execute as @s[scores={move=15}] at @s run scoreboard players set @e[tag=!Frames,tag=warp,r=3,c=1] Stun 20
execute as @s[scores={move=15}] at @s run scoreboard players add @e[tag=!Frames,tag=warp,r=3,c=1] Evade 8
execute as @s[scores={move=15}] at @s run function damages/blunt_damage
execute as @s[scores={move=15}] run tag @e[tag=warp,r=100,c=1] remove warp
execute as @s[scores={move=14..15}] at @s run summon ds:knockback ~~~