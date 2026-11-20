#playanimation @s[scores={move=12}] animation.use

tag @s[scores={move=1..2},tag=form1] remove form1


execute as @s[scores={move=5}] at @s run particle ds:infinity_1 ~~1~
execute as @s[scores={move=5}] at @s run particle ds:infinity_2 ~~1~
execute as @s[scores={move=5}] at @s run scoreboard players set @s infinity 300
execute as @s[scores={move=5}] at @s run scoreboard players operation @s infinity += @s Energy
execute as @s[scores={move=5}] at @s run playsound mob.elderguardian.curse @a ~~~ 1 2.5
execute as @s[scores={move=5}] at @s run playsound mob.elderguardian.curse @a ~~~ 1 1.5
execute as @s[scores={move=5}] at @s run camerashake add @a[r=10] 4 0.15