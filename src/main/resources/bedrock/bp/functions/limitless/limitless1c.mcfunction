playanimation @s[scores={move=14}] animation.levitation


tag @s[scores={move=1..2},tag=form1c] remove form1c

tag @s[scores={move=13..,Stun=1..},tag=form1c] remove form1c
playanimation @s[scores={move=13..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=13..,Stun=1..}] move 0

effect @s[scores={move=3..11}] levitation 1 60 true
effect @s[scores={move=1..2}] levitation 0 80 true
effect @s[scores={move=8}] slow_falling 10 5 true
execute as @s[scores={move=8}] at @s run particle ds:double_jump1 ~~1~
execute as @s[scores={move=8}] at @s run particle ds:double_jump2 ~~1~
execute as @s[scores={move=8}] at @s run particle ds:double_jump3 ~~1~
execute as @s[scores={move=8}] at @s run particle ds:levitate_1 ~~1~
execute as @s[scores={move=8}] at @s run particle ds:levitate_2 ~~1~
scoreboard players operation @s[scores={move=8}] levitate += @s Energy
scoreboard players set @s[scores={move=8}] countdown1 11
execute as @s[scores={move=8}] at @s run playsound mob.wither.shoot @a[r=50] ~~~ 9999 0.5 9999
execute as @s[scores={move=8}] at @s run camerashake add @a[r=10] 0.15 0.15
