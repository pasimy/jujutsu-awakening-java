playanimation @s[scores={move=100}] animation.imaginary_purple

execute as @s[scores={move=100}] unless entity @s[type=ds:student_gojo2,scores={chance=29}] at @s run tp @s ~~2~
execute as @s[scores={move=100}] unless entity @s[type=ds:student_gojo2,scores={chance=29}] at @s run tp @s @s
camera @s[scores={move=100},type=player] fade time 0.1 0 0.2 color 0 0 0
execute as @s[scores={move=100}] at @s run playsound mob.hollow2 @a ~~~ 1000 1 1000


tag @s[scores={move=1..2},tag=form5] remove form5

execute as @s[scores={move=52..,Stun=1..}] at @s run stopsound @a mob.hollow2
execute as @s[scores={move=52..,Stun=1..}] at @s run function cancel_attack


scoreboard players set @s[scores={move=1..52}] Frames 5
scoreboard players set @s[scores={move=75..}] Camera 4
scoreboard players set @s[scores={move=1..}] Move 4
execute as @s[scores={move=25..},type=player] at @s run scriptevent ds:antiair
tp @s[scores={move=25..},type=!player] ~~~

execute as @s[scores={move=1..}] at @s run kill @e[type=ds:knockback,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:running,r=8]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:lapse_explode,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:red_reversal,r=25]

execute as @s[scores={move=1..97}] at @s run tp @e[name=ImagineTRG,type=ds:projectile,r=5,c=1] ^^1.25^1.33 facing @s
execute as @s[scores={move=1..97}] at @s as @e[name=ImagineTRG,type=ds:projectile,r=5,c=1] at @s run tp @s @s
execute as @s[scores={move=1..97}] at @s as @e[name=ImagineTRG,type=ds:projectile,r=5,c=1] at @s run tp @s ~~~~ 0
execute as @e[name=ImagineTRG,type=ds:projectile,r=5,c=1,scores={Deleter=0..2}] at @s run tp @s ~~-200~
execute as @e[name=ImagineRed,type=ds:projectile,r=5,c=1] at @s run function limitless/limitless5proj
execute as @e[name=ImagineBlue,type=ds:projectile,r=5,c=1] at @s run function limitless/limitless5proj


execute as @s[scores={move=100}] at @s run particle ds:hollow_blue_stars ^-2.5^1^1
execute as @s[scores={move=100}] at @s run particle ds:hollow_red_stars ^2.5^1^1
execute as @s[scores={move=98}] at @s run summon ds:projectile ImagineBlue ^-2.5^1.5^1
execute as @s[scores={move=98}] at @s run summon ds:projectile ImagineRed ^2.5^1.5^1
execute as @s[scores={move=98}] at @s run summon ds:projectile ImagineTRG ^^1^1
execute as @s[scores={move=98}] at @s run tag @e[name=ImagineBlue,type=ds:projectile,r=5,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=98}] at @s run tag @e[name=ImagineRed,type=ds:projectile,r=5,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=98}] at @s run tag @e[name=ImagineTRG,type=ds:projectile,r=5,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=88..98}] at @s run scoreboard players set @e[name=ImagineBlue,type=ds:projectile,r=5,c=1] Deleter 6
execute as @s[scores={move=88..98}] at @s run scoreboard players set @e[name=ImagineRed,type=ds:projectile,r=5,c=1] Deleter 6
execute as @s[scores={move=6..98}] at @s run scoreboard players set @e[name=ImagineTRG,type=ds:projectile,r=5,c=1] Deleter 6





effect @s[scores={move=21..60},type=player] slowness 1 2 true

title @s[scores={move=45},tag=!impactframesoff,type=player] title 
title @s[scores={move=44},tag=!impactframesoff,type=player] title 
title @s[scores={move=43},tag=!impactframesoff,type=player] title §l
title @s[scores={move=41},tag=!impactframesoff,type=player] title 
title @s[scores={move=40},tag=!impactframesoff,type=player] title 
title @s[scores={move=39},tag=!impactframesoff,type=player] title §l

execute as @s[scores={move=84..85}] at @s run playanimation @e[name=ImagineTRG,type=ds:projectile,r=5,c=1] animation.imaginary_collide
execute as @s[scores={move=85}] at @s run camera @a[r=10] fade time 0.1 0 0.2 color 255 255 255
execute as @s[scores={move=84}] at @s run playsound mob.water @a ~~~ 1000 0.5 1000
execute as @s[scores={move=84..85}] at @s run effect @e[name=ImagineTRG] invisibility 10 10 true


execute as @s[scores={move=44}] at @s run camerashake add @a[r=40] 2 0.25
execute as @s[scores={move=44}] at @s run effect @a[r=20] night_vision 5 1 true
execute as @s[scores={move=44}] at @s run scriptevent ds:shootprojectile ds:projectile ImaginaryP velocity:4 scores: Deleter 40
execute as @s[scores={move=43}] at @s run tag @e[name=ImaginaryP,type=ds:projectile,tag=!GojoProj] add GojoProj


execute as @s[scores={move=36}] at @s run camera @a[r=40] fade time 0 0 1 color 235 55 235