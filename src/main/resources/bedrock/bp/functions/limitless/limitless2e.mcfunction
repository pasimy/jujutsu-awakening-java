playanimation @s[scores={move=65}] animation.enchant_blue
playanimation @s[scores={move=3..7}] animation.enchant_blue_hold


playanimation @s[scores={move=3..65,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=3..65,Stun=1..}] move 2
scoreboard players set @s[scores={move=66..}] Frames 5

scoreboard players set @s[scores={move=1..900}] Move 6

scoreboard players set @s[scores={move=1..2,chant=1..}] chant 0
tag @s[scores={move=0..2},tag=form2e] remove form2e
tag @s[scores={move=0..2},tag=phase] remove phase
tag @s[scores={move=0..2},tag=twilight] remove twilight
tag @s[scores={move=0..2},tag=eyesofwisdom] remove eyesofwisdom

execute if block ~~-1~ air run scoreboard players add @s levitate 2

execute as @s[scores={move=57}] at @s run scoreboard players set @s chant 1
execute as @s[scores={move=57}] at @s run particle ds:enchant_blue1 ~~~
execute as @s[scores={move=57}] at @s run particle ds:enchant_blue2 ~~~
camerashake add @s[scores={move=57},type=player] 0.1 0.08
execute as @s[scores={move=57}] at @s run particle ds:blue_chant1 ^1.15^1.37^-0.15
execute as @s[scores={move=57}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 0.97 99999

execute as @s[scores={move=38..56},tag=itemUse:ds:limitless2] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=38..56},tag=itemUse:ds:limitless2] move 501

execute as @s[scores={move=37}] at @s run scoreboard players set @s chant 2
execute as @s[scores={move=37}] at @s run particle ds:enchant_blue1 ~~~
execute as @s[scores={move=37}] at @s run particle ds:enchant_blue2 ~~~
camerashake add @s[scores={move=37},type=player] 0.1 0.08
execute as @s[scores={move=37}] at @s run particle ds:blue_chant2 ^-1.15^1.5^-0.15
execute as @s[scores={move=37}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 1 99999

execute as @s[scores={move=16..36},tag=itemUse:ds:limitless2] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=16..36},tag=itemUse:ds:limitless2] move 601

execute as @s[scores={move=15}] at @s run scoreboard players set @s chant 3
execute as @s[scores={move=15}] at @s run particle ds:enchant_blue1 ~~~
execute as @s[scores={move=15}] at @s run particle ds:enchant_blue2 ~~~
camerashake add @s[scores={move=15},type=player] 0.1 0.08
execute as @s[scores={move=15}] at @s run particle ds:blue_chant3 ^1.15^1.75^-0.15
execute as @s[scores={move=15}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 0.9 99999

execute as @s[scores={move=4..14},tag=itemUse:ds:limitless2] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=4..14},tag=itemUse:ds:limitless2] move 1001

scoreboard players set @s[scores={move=3..4}] move 5

playanimation @s[scores={move=500}] animation.enchant_blue1

execute as @s[scores={move=490}] at @s run summon ds:projectile ^^1^1.5 facing ^^1^20 none phaseblue
execute as @s[scores={move=490}] at @s positioned ^^1^1.5 run tag @e[name=phaseblue,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=490}] at @s positioned ^^1^1.5 run scoreboard players set @e[name=phaseblue,type=ds:projectile,r=0.15,c=1] Deleter 31
execute as @s[scores={move=490}] at @s run particle ds:lapse_pull3 ^^1^1
execute as @s[scores={move=490}] at @s run playsound mob.wither.shoot @a[r=50] ~~~ 99999 1.1 99999
execute as @s[scores={move=490}] at @s run playsound beacon.activate @a[r=50] ~~~ 999999 0.5 999999
execute as @s[scores={move=490}] at @s run camerashake add @a[r=50] 2 0.15
execute as @s[scores={move=490}] at @s run effect @a[r=50] night_vision 1 1 true

execute as @s[scores={move=484..485}] at @s run function cancel_attackv2


playanimation @s[scores={move=600}] animation.enchant_blue2

execute as @s[scores={move=575..600}] at @s run tp @s ~~~

camerashake add @s[scores={move=589..597},type=player] 0.1 0.08 
execute as @s[scores={move=599}] at @s run particle ds:lapse_pull4 ^^1^1
execute as @s[scores={move=597}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=595}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=593}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=591}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=589}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=587}] at @s run playsound beacon.activate @a[r=20] ~~~ 9999 3.5 9999
execute as @s[scores={move=597}] at @s run summon ds:projectile ^-0.33^0.33^1 facing ^^1^10 none twilight
execute as @s[scores={move=595}] at @s run summon ds:projectile ^0.33^0.33^1 facing ^^1^10 none twilight
execute as @s[scores={move=593}] at @s run summon ds:projectile ^0.8^1^1 facing ^^1^10 none twilight
execute as @s[scores={move=591}] at @s run summon ds:projectile ^0.33^1.66^1 facing ^^1^10 none twilight
execute as @s[scores={move=589}] at @s run summon ds:projectile ^-0.33^1.66^1 facing ^^1^10 none twilight
execute as @s[scores={move=587}] at @s run summon ds:projectile ^-0.8^1^1 facing ^^1^10 none twilight
execute as @s[scores={move=587..597}] at @s run tag @e[name=twilight,type=ds:projectile,r=5,tag=!GojoProj] add GojoProj
execute as @s[scores={move=576..597}] at @s run tag @e[name=twilight,type=ds:projectile,r=5,c=1,tag=!Stopped] add Stopped
execute as @s[scores={move=576..597}] at @s run scoreboard players set @e[name=twilight,type=ds:projectile,r=5] Deleter 55
execute as @s[scores={move=570..575}] at @s run tag @e[name=twilight,type=ds:projectile,r=5,c=1,tag=Stopped] remove Stopped
execute as @s[scores={move=575}] at @s positioned ^^^55 run summon ds:projectile twilightTRG
execute as @s[scores={move=575}] at @s positioned ^^^55 run tag @e[name=twilightTRG,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=575}] at @s positioned ^^^55 run scoreboard players set @e[name=twilightTRG,type=ds:projectile,r=0.15,c=1] Deleter 25

execute as @s[scores={move=560..567}] at @s run function cancel_attackv2


playanimation @s[scores={move=1000}] animation.enchant_blue3

execute as @s[scores={move=995}] at @s run particle ds:lapse_pull2 ^-1^2^
execute as @s[scores={move=995}] at @s run particle ds:lapse_pull3 ^-1^2^
execute as @s[scores={move=995}] at @s run particle ds:lapse_pull4 ^-1^2^
execute as @s[scores={move=992}] at @s run summon ds:projectile wisdomblue ^-1^2^
execute as @s[scores={move=992}] at @s run summon ds:projectile wisdomblueTRG ^^1^40
execute as @s[scores={move=992}] at @s positioned ^-1^2^ run tag @e[name=wisdomblue,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=992}] at @s positioned ^^1^40 run tag @e[name=wisdomblueTRG,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=992}] at @s positioned ^-1^2^ run scoreboard players set @e[name=wisdomblue,type=ds:projectile,r=0.15,c=1] Deleter 57
execute as @s[scores={move=992}] at @s positioned ^^1^40 run scoreboard players set @e[name=wisdomblueTRG,type=ds:projectile,r=0.15,c=1] Deleter 57

execute as @s[scores={move=900..992}] at @s positioned ^^1^40 run tp @e[name=wisdomblueTRG,type=ds:projectile,r=50,c=1] ~~~ facing ^^^100

execute as @s[scores={move=930..945}] at @s run function cancel_attackv2