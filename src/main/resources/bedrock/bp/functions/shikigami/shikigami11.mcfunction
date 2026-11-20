playanimation @s[scores={move=39}] animation.agito_spawn

scoreboard players set @s[scores={move=3..}] Move 5
scoreboard players set @s[scores={move=3..}] Camera 5


tag @s[scores={move=1..2},tag=form11] remove form11

tag @s[scores={move=34..,Stun=1..},tag=form11] remove form11
playanimation @s[scores={move=34..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=34..,Stun=1..}] move 0

event entity @s[scores={move=32}] agito_spawn
execute as @s[scores={move=31}] at @s run tag @e[type=ds:familiar_entity,r=5,c=1] add AgitoSummon
execute as @s[scores={move=31}] at @s rotated ~ 0 run tp @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] ^^^1 facing ^^^20

execute as @s[scores={move=19..31}] at @s positioned as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] rotated ~ 0 run tp @e[tag=AgitoSummon,type=ds:familiar_entity,r=1,c=1] ~~~ facing ^^^20
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run tp @s ^^^0.21 true
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle1 ~~0.44~
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle2
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:swamp_puddle3
execute as @s[scores={move=19..31}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_bubble
execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_appear3 ~~1~
execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_appear3 ~~0.75~
execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_appear3 ~~1.5~
execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shikigami_appear3 ~~2.25~
execute as @s[scores={move=20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run effect @a[r=7] blindness 2 1 true
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a ~~~3 1 1 1
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a ~3~~ 1 1.15 1
execute as @s[scores={move=17..31}] at @s run playsound bubble.up @a ~1~~4 1 0.7 1


execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run particle ds:shock_punch1 ~~2~
execute as @s[scores={move=19..20}] at @s as @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] at @s run playsound mob.electricity @a ~~~ 100000 0.5 10000
execute as @s[scores={move=19}] at @s run scoreboard players set @e[type=ds:rounddeer,r=80,c=1] Deleter 4
execute as @s[scores={move=19}] at @s run scoreboard players set @e[type=ds:serpent,r=80,c=1] Deleter 4
execute as @s[scores={move=19}] at @s at @e[tag=AgitoSummon,type=ds:familiar_entity,r=20,c=1] run function shikigami/shikigami/agito_spawn

scoreboard players set @s[scores={move=5..17}] move 4