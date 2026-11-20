playanimation @s[scores={move=65}] animation.enchant_red
playanimation @s[scores={move=3..7}] animation.enchant_red_hold

playanimation @s[scores={move=3..65,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=3..65,Stun=1..}] move 2
scoreboard players set @s[scores={move=66..}] Frames 5

scoreboard players set @s[scores={move=1..}] Move 6

scoreboard players set @s[scores={move=1..2,chant=1..}] chant 0
tag @s[scores={move=0..2},tag=form3e] remove form3e
tag @s[scores={move=0..2},tag=phase] remove phase
tag @s[scores={move=0..2},tag=paramita] remove paramita
tag @s[scores={move=0..2},tag=pillaroflight] remove pillaroflight

execute if block ~~-1~ air run scoreboard players add @s levitate 2

execute as @s[scores={move=64..65}] at @s run playsound mob.red1 @a[r=50] ~~~ 0.2 0.3

execute as @s[scores={move=57}] at @s run scoreboard players set @s chant 1
execute as @s[scores={move=57}] at @s run particle ds:enchant_red1 ~~~
execute as @s[scores={move=57}] at @s run particle ds:enchant_red2 ~~~
camerashake add @s[scores={move=57},type=player] 0.1 0.08
execute as @s[scores={move=57}] at @s run particle ds:blue_chant1 ^1.15^1.37^-0.15
execute as @s[scores={move=57}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 0.97 99999

execute as @s[scores={move=38..56},tag=itemUse:ds:limitless3] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=38..56},tag=itemUse:ds:limitless3] move 501

execute as @s[scores={move=37}] at @s run scoreboard players set @s chant 2
execute as @s[scores={move=37}] at @s run particle ds:enchant_red1 ~~~
execute as @s[scores={move=37}] at @s run particle ds:enchant_red2 ~~~
camerashake add @s[scores={move=37},type=player] 0.1 0.08
execute as @s[scores={move=37}] at @s run particle ds:red_chant2 ^-1.15^1.5^-0.15
execute as @s[scores={move=37}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 1 99999

execute as @s[scores={move=16..36},tag=itemUse:ds:limitless3] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=16..36},tag=itemUse:ds:limitless3] move 601

execute as @s[scores={move=15}] at @s run scoreboard players set @s chant 3
execute as @s[scores={move=15}] at @s run particle ds:enchant_red1 ~~~
execute as @s[scores={move=15}] at @s run particle ds:enchant_red2 ~~~
camerashake add @s[scores={move=15},type=player] 0.1 0.08
execute as @s[scores={move=15}] at @s run particle ds:red_chant3 ^1.15^1.75^-0.15
execute as @s[scores={move=15}] at @s run playsound mob.chant @a[r=50] ~~~ 99999 0.9 99999

execute as @s[scores={move=4..14},tag=itemUse:ds:limitless3] at @s run playsound beacon.activate @a[r=50] ~~~ 99999 1.5 99999
scoreboard players set @s[scores={move=4..14},tag=itemUse:ds:limitless3] move 1001

scoreboard players set @s[scores={move=3..5}] move 5

playanimation @s[scores={move=500}] animation.enchant_red1

execute as @s[scores={move=500}] at @s run playsound mob.red1 @a[r=50] ~~~ 9999 1 9999
execute as @s[scores={move=492}] at @s run summon ds:projectile ^^1.5^1.5 facing ^^1^20 none phasered
execute as @s[scores={move=492}] at @s positioned ^^1.5^60 run summon ds:projectile ~~~ facing ^^^100 none phaseredTRG
execute as @s[scores={move=492}] at @s positioned ^^1.5^1.5 run tag @e[name=phasered,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=492}] at @s positioned ^^1.5^60 run tag @e[name=phaseredTRG,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=492}] at @s positioned ^^1.5^1.5 run scoreboard players set @e[name=phasered,type=ds:projectile,r=0.15,c=1] Deleter 61
execute as @s[scores={move=492}] at @s positioned ^^1.5^60 run scoreboard players set @e[name=phaseredTRG,type=ds:projectile,r=0.15,c=1] Deleter 61
execute as @s[scores={move=492}] at @s run particle ds:red_ex6 ^^1^1
execute as @s[scores={move=492}] at @s run particle ds:red_ex6 ^^1^1
execute as @s[scores={move=492}] at @s run particle ds:red_ex1 ^^1^1
execute as @s[scores={move=492}] at @s run playsound mob.wither.shoot @a[r=50] ~~~ 99999 1.1 99999
execute as @s[scores={move=492}] at @s run playsound mob.shock2 @a[r=50] ~~~ 999999 1.25 999999
execute as @s[scores={move=492}] at @s run camerashake add @a[r=50] 1 0.15
execute as @s[scores={move=492}] at @s run effect @a[r=50] night_vision 1 1 true

execute as @s[scores={move=480..485}] at @s run function cancel_attackv2


playanimation @s[scores={move=600}] animation.enchant_red2

execute as @s[scores={move=600}] at @s run playsound mob.red1 @a[r=100] ^^1^1 99999 0.75 99999
execute as @s[scores={move=580}] at @s run camera @a[r=10] fade time 0 0 2 color 200 50 50
execute as @s[scores={move=550..580}] at @s run playsound mob.shock2 @a[r=100] ^^1^4 99999 1.85 99999
execute as @s[scores={move=550..580}] at @s run playsound mob.shock2 @a[r=100] ^^1^4 99999 2.25 99999
execute as @s[scores={move=550..580}] at @s run camerashake add @a[r=10] 0.1 0.1
execute as @s[scores={move=540..580}] at @s run tp @s @s

execute as @s[scores={move=580}] at @s rotated ~ 0 run summon ds:projectile ^^1.25^1 facing ^^1.25^10 none paramita
execute as @s[scores={move=580}] at @s rotated ~ 0 positioned ^^1.25^1 run tag @e[name=paramita,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=580}] at @s rotated ~ 0 positioned ^^1.25^1 run scoreboard players set @e[name=paramita,type=ds:projectile,r=0.15,c=1] Deleter 31
execute as @s[scores={move=550..580}] at @s rotated ~ 0 positioned ^^1.25^1 run playanimation @e[name=paramita,type=ds:projectile,r=5,c=1] animation.paramita_red
execute as @s[scores={move=550..580}] at @s run function damages/explosion_damage
execute as @s[scores={move=550..580}] at @s positioned ^^1.25^2.55 run function limitless/paramita
execute as @s[scores={move=550..580}] at @s positioned ^^1.25^5.05 run function limitless/paramita
execute as @s[scores={move=550..580}] at @s positioned ^^1.25^7.55 run function limitless/paramita
execute as @s[scores={move=550..580},type=player] at @s rotated ~ 0 anchored eyes run camera @s set minecraft:free pos ^5 ^3 ^5 facing ^^1^2.5
execute as @s[scores={move=550..580}] at @s rotated ~ 0 positioned ^^1.25^1 run tp @e[name=paramita,type=ds:projectile,r=5,c=1] ^^1.25^1 facing ^^1.25^10
scoreboard players set @s[scores={move=550..580}] Camera 5

execute as @s[scores={move=540..547}] at @s run function cancel_attackv2


execute as @s[scores={move=1000}] at @s unless block ~~-1~ air run playanimation @s animation.enchant_red3
execute as @s[scores={move=1000}] at @s if block ~~-1~ air run playanimation @s animation.enchant_red3air


execute as @s[scores={move=1000}] at @s run playsound mob.red3 @a[r=100] ~~~ 99999 0.35 99999
execute as @s[scores={move=940}] at @s run playsound mob.red2 @a[r=100] ~~~ 99999 0.8 99999

execute as @s[scores={move=955}] at @s run playsound mob.gojo_red2 @a[r=100] ~~~ 99999 1 99999

execute as @s[scores={move=943}] at @s run playsound mob.impact1 @a[r=100] ~~~ 99999 1 99999

camera @s[scores={move=1000},type=player] fade time 0.5 0 0.5 color 255 50 50

execute as @s[scores={move=939..944}] at @s run particle ds:red_stars_flash

execute as @s[scores={move=941}] at @s anchored eyes run particle ds:burst_impact ^^^3
execute as @s[scores={move=938}] at @s run particle ds:large_slam1 ^^^3
execute as @s[scores={move=938}] at @s run particle ds:large_slam2 ^^^3
execute as @s[scores={move=938}] at @s run particle ds:large_slam3 ^^^3
execute as @s[scores={move=938}] at @s run particle ds:large_slam4 ^^^3
execute as @s[scores={move=938}] at @s run camerashake add @a[r=100] 4 0.25 rotational
execute as @s[scores={move=940}] at @s run playsound mob.blasted2 @a[r=100] ~~~ 99999 0.8 99999
execute as @s[scores={move=940}] at @s run playsound mob.blasted4 @a[r=100] ~~~ 99999 0.4 99999

execute as @s[scores={move=942}] at @s run summon gg:impact_frame

execute as @s[scores={move=939}] at @s run summon gg:impact_frame_black
execute as @s[scores={move=940}] at @s positioned ^^1^1 run function limitless/red_beam


execute as @s[scores={move=925..930}] at @s run function cancel_attackv2