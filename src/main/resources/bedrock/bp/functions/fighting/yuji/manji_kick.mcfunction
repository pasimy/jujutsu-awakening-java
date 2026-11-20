playanimation @s[scores={move=15}] animation.yuji.manji_kick

tag @s[scores={move=1..2},tag=wep1] remove wep1

scoreboard players set @s[scores={move=1..11}] Frames 4
scoreboard players set @s[scores={move=1..}] Move 4
scoreboard players set @s[scores={move=1..7}] Camera 4
scoreboard players set @e[tag=manji,r=7,c=1] Camera 4
scoreboard players set @e[tag=manji,r=7,c=1] Move 4
scoreboard players set @e[tag=manji,r=7,c=1] Stun 5

execute as @s[scores={move=14}] at @s run playsound mob.enderdragon.flap @a[r=10] ~~~ 1 0.4
execute as @s[scores={move=10}] at @s run particle ds:dirt2

execute as @s[scores={move=8..10}] at @s positioned ^^^2 run scoreboard players set @e[r=4.99,tag=!Frames,scores={punch=1..},family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!gg:impact_frame,family=!small] atk 2
execute as @s[scores={move=8..10},type=player] at @s positioned ^^^2 run tag @e[tag=!Frames,scores={atk=1..},r=4.99,c=1,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!gg:impact_frame,family=!small] add manji
execute as @s[scores={move=8..10},type=!player,family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] at @s positioned ^^^2 as @e[tag=!Frames,scores={atk=1..},r=4.99,c=1,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!gg:impact_frame,family=!small] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] run tag @s add manji
execute as @s[scores={move=8..10},type=!player,tag=!sukuna,tag=!rogue_sorcerer] unless entity @s[family=!purecurse,tag=!curse] at @s positioned ^^^2 as @e[tag=!Frames,scores={atk=1..},r=4.99,c=1,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!gg:impact_frame,family=!small] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,family=purecurse,type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,tag=curse,type=!player] run tag @s add manji
execute as @s[scores={move=8..10},type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] at @s positioned ^^^2 run tag @e[tag=!Frames,scores={atk=1..},r=4.99,c=1,family=!projectile,family=!despawncito,family=!damage,family=!disappear,tag=!unselect,type=!gg:impact_frame,family=!small] add manji
execute as @s[scores={move=8..10}] at @s positioned ^^^2 run scoreboard players set @e[tag=!Frames,r=4.99,c=1,tag=manji,tag=!unselect] Stun 15
execute as @s[scores={move=8..10}] at @s positioned ^^^2 run scoreboard players set @e[r=4.99,tag=!Frames,scores={move=3..},c=1,tag=manji,tag=!unselect] move 2
execute as @s[scores={move=8..10}] at @s positioned ^^^2 if entity @e[tag=!Frames,r=4.99,tag=manji,tag=!unselect] run scoreboard players set @s move 6

execute as @s[scores={move=6..7}] at @s positioned ^^^2 unless entity @e[tag=!Frames,r=4.99,tag=manji,tag=!unselect] run scoreboard players set @s Stun 10
execute as @s[scores={move=6..7}] at @s positioned ^^^2 unless entity @e[tag=!Frames,r=4.99,tag=manji,tag=!unselect] run scoreboard players set @s move 2

playanimation @s[scores={move=5}] animation.yuji.manji_kick2

scoreboard players random @s[scores={move=5},tag=!heavenlyrestriction] blackflashchance 1 99
scoreboard players set @s[scores={move=5},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players set @s[scores={move=4..5}] atk 2

execute as @s[scores={move=2..6}] at @s as @e[tag=manji,r=7,c=1] at @s run tp @s @s
execute as @s[scores={move=2..6}] at @s as @e[tag=manji,r=7,c=1] at @s run tp @e[scores={move=2..6},r=7,c=1] ^^0.15^1 facing @s

execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run camerashake add @a[r=10] 2 0.15
execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run particle ds:punch1 ~~~
execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run particle ds:punch2 ~~~
execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run particle ds:punch3 ~~~
execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run particle ds:punch4 ~~~
execute as @s[scores={move=4}] at @s positioned ^^1^0.5 run particle ds:ground_slam2 ~~~
execute as @s[scores={move=4}] at @s positioned ^^^0.5 run playsound mob.punch @a[r=50] ~~~ 9999 1.25 9999
execute as @s[scores={move=4}] at @s positioned ^^^0.5 run playsound random.explode @a[r=50] ~~~ 9999 2 9999
execute as @s[scores={move=4}] at @s positioned ^^^0.5 run playsound random.explode @a[r=50] ~~~ 9999 1.75 9999
execute as @s[scores={move=4}] at @s positioned ^^^2.5 run damage @e[tag=manji,r=2.45,c=1] 5 override entity @s
execute as @s[scores={move=4}] at @s positioned ^^^2.5 run scoreboard players operation @e[tag=manji,r=2.45,c=1] damage += @s damageadd
execute as @s[scores={move=4}] at @s positioned ^^^2.5 run scoreboard players add @e[tag=manji,r=2.45,c=1] Evade 25
execute as @s[scores={move=4}] at @s run  function damages/blunt_damage
execute as @s[scores={move=4}] at @s positioned ^^^2.5 run scoreboard players set @e[tag=manji,r=2.45,c=1] knockdown 15
execute as @s[scores={move=1..2}] at @s run tag @e[tag=manji,r=7,c=1] remove manji