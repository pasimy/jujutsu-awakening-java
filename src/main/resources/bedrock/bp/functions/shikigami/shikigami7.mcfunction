playanimation @s[scores={move=39}] animation.maxelephant_spawn

scoreboard players set @s[scores={move=3..}] Move 5
scoreboard players set @s[scores={move=3..}] Camera 5


tag @s[scores={move=1..2},tag=form7] remove form7

tag @s[scores={move=34..,Stun=1..},tag=form7] remove form7
playanimation @s[scores={move=34..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=34..,Stun=1..}] move 0

event entity @s[scores={move=32}] maxelephant_spawn
execute as @s[scores={move=31}] at @s run tag @e[type=ds:familiar_entity,r=5,c=1] add ElephantSummon
execute as @s[scores={move=31}] at @s rotated ~ 0 run tp @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] ^^^1 facing ^^^20

execute as @s[scores={move=19..31}] at @s positioned as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] rotated ~ 0 run tp @e[tag=ElephantSummon,type=ds:familiar_entity,r=1,c=1] ~~~ facing ^^^20
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle1 ~~0.44~
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle2
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle3
execute as @s[scores={move=19..31}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_bubble
execute as @s[scores={move=19..20}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_appear3 ~~1~
execute as @s[scores={move=20}] at @s as @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] at @s run effect @a[r=7] blindness 2 1 true
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a[r=30] ~~~3 9999 1 9999
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a[r=30] ~3~~ 9999 1.15 9999
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a[r=30] ~1~~4 9999 0.7 9999


execute as @s[scores={move=19}] at @s at @e[tag=ElephantSummon,type=ds:familiar_entity,r=20,c=1] run function shikigami/shikigami/elephant_spawn

scoreboard players set @s[scores={move=5..17}] move 4