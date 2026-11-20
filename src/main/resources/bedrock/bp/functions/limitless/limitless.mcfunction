
execute as @e[scores={bluefist=1..}] at @s run function limitless/blue_h2h

execute as @e[name=Lapse,type=ds:projectile] at @s run function limitless/lapseblue
execute as @e[name=Lapse2,type=ds:projectile] at @s run function limitless/lapseblue2
execute as @e[name="Blue Core",type=ds:projectile] at @s run function limitless/bluecore
execute as @e[name=phaseblue,type=ds:projectile,c=2] at @s run function limitless/phaseblue
execute as @e[name=twilight,type=ds:projectile,c=6] at @s run function limitless/twilightblue
execute as @e[name=wisdomblue,type=ds:projectile,c=2] at @s run function limitless/wisdomblue
execute as @e[name=phasered,type=ds:projectile,c=2] at @s run function limitless/phasered
execute as @e[name=Reversal,type=ds:projectile] at @s run function limitless/reversal
execute as @e[name=ImaginaryP,type=ds:projectile] at @s run function limitless/imaginary_purple
execute as @e[name=HollowP,type=ds:projectile] at @s run function limitless/hollow_purple
execute as @e[name=200HollowP,type=ds:projectile] at @s run function limitless/200hollow_purple


execute as @e[name=UnlimitedVoid] at @s run function limitless/unlimited_void


execute as @e[scores={levitate=2..},c=1] at @s unless block ~~-0.25~ air run scoreboard players set @s levitate 1
scoreboard players set @a[scores={levitate=2..},tag=doublesneak] levitate 1
effect @e[tag=limitless,scores={levitate=1..,cutscene=0,knockdown=0,Flourish=0},type=!player] slow_falling 1 4 true
effect @a[tag=limitless,scores={levitate=1..2}] slow_falling 0 7 true
effect @a[tag=limitless,scores={levitate=1..},tag=lookingup] levitation 1 7 true
effect @a[tag=limitless,scores={levitate=1..},tag=!uplook] levitation 0 20 true
scoreboard players remove @a[scores={levitate=1..,countdown1=1..}] countdown1 1
scoreboard players remove @e[scores={levitate=1..}] levitate 1
effect @a[scores={levitate=1..,countdown1=3}] levitation 1 2 true
effect @a[scores={levitate=1..,countdown1=6}] levitation 0 10 true
scoreboard players set @a[scores={countdown1=1..2}] countdown1 11
execute as @e[scores={levitate=1..}] at @s run particle ds:levitate_1 ~~~
execute as @e[scores={levitate=1..}] at @s run particle ds:levitate_2 ~~~

scoreboard players set @a[scores={Hit=0,cutscene=0,Stun=0,move=0,infinity=1..,detect_left=1..},hasitem={item=ds:dash,location=slot.weapon.mainhand}] Dash 12
tag @a[scores={Hit=0,cutscene=0,Stun=0,move=0,infinity=1..,detect_left=1..},hasitem={item=ds:dash,location=slot.weapon.mainhand},tag=!infinitydash] add infinitydash