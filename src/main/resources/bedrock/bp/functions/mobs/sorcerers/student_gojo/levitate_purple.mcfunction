playanimation @s[scores={move=118}] animation.levitation

playanimation @s[scores={move=117..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=117..,Stun=1..}] move 2

execute as @s[scores={move=113..115}] at @s run effect @s levitation 1 60 true
execute as @s[scores={move=111..112}] at @s run effect @s levitation 0 80 true
execute as @s[scores={move=114}] at @s run particle ds:double_jump1 ~~1~
execute as @s[scores={move=114}] at @s run particle ds:double_jump2 ~~1~
execute as @s[scores={move=114}] at @s run particle ds:double_jump3 ~~1~
execute as @s[scores={move=114}] at @s run particle ds:levitate_1 ~~1~
execute as @s[scores={move=114}] at @s run particle ds:levitate_2 ~~1~
execute as @s[scores={move=114}] at @s run effect @s slow_falling 10 5 true
execute as @s[scores={move=114}] at @s run scoreboard players operation @s levitate += @s Energy
execute as @s[scores={move=114}] at @s run scoreboard players set @s countdown1 11
execute as @s[scores={move=114}] at @s run playsound mob.wither.shoot @a[r=50] ~~~ 9999 0.5 9999
execute as @s[scores={move=114}] at @s run camerashake add @a[r=10] 0.15 0.15




execute as @s[scores={move=1..100}] at @s run function limitless/limitless5