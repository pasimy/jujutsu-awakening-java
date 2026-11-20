playanimation @s[scores={move=39}] animation.rabbit_spawn

scoreboard players set @s[scores={move=3..}] Move 5
scoreboard players set @s[scores={move=3..}] Camera 5


tag @s[scores={move=1..2},tag=form1] remove form1

tag @s[scores={move=34..,Stun=1..},tag=form1] remove form1
playanimation @s[scores={move=34..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=34..,Stun=1..}] move 0

execute as @s[scores={move=22}] at @s run function shikigami/shikigami/rabbit_spawn
execute as @s[scores={move=1..21}] at @s as @e[type=ds:rabbitescape,r=20] at @s run particle ds:swamp_puddle1 ~~0.44~
execute as @s[scores={move=1..21}] at @s as @e[type=ds:rabbitescape,r=20] at @s run particle ds:swamp_puddle2
execute as @s[scores={move=1..21}] at @s as @e[type=ds:rabbitescape,r=20] at @s run particle ds:swamp_puddle3
execute as @s[scores={move=1..21}] at @s as @e[type=ds:rabbitescape,r=20] at @s run particle ds:shikigami_bubble
execute as @s[scores={move=3..21}] at @s run playsound bubble.up @a[r=30] ~~~3 9999 1 9999
execute as @s[scores={move=3..21}] at @s run playsound bubble.up @a[r=30] ~3~~ 9999 1.15 9999
execute as @s[scores={move=3..21}] at @s run playsound bubble.up @a[r=30] ~1~~4 9999 0.7 9999

scoreboard players set @s[scores={move=5..17}] move 4