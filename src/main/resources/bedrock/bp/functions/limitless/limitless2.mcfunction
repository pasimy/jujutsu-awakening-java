playanimation @s[scores={move=14}] animation.lapse_blue1

tag @e[scores={move=1..2},tag=form2] remove form2

tag @e[scores={move=8..,Stun=1..},tag=form2] remove form2
playanimation @s[scores={move=8..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=8..,Stun=1..}] move 0

execute as @s[scores={move=4}] at @s run camerashake add @a[r=15] 2 0.1

execute as @s[scores={move=6..}] at @s run playsound beacon.ambient @a ^^1^1 0.2 3
execute as @s[scores={move=4}] at @s run playsound beacon.deactivate @a ^^1^1 1 1.25
execute as @s[scores={move=4}] at @s run playsound mob.beam3 @a ^^1^1 1 0.6

execute as @s[scores={move=4}] at @s run scriptevent ds:shootprojectile ds:projectile Lapse velocity:4 scores: Deleter 45
execute as @s[scores={move=3}] at @s run tag @e[name=Lapse,type=ds:projectile,tag=!GojoProj] add GojoProj
