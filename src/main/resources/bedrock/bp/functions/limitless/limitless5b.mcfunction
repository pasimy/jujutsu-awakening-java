playanimation @s[scores={move=480..}] animation.hollowpurple
execute as @s[scores={move=480..}] at @s run tp @s @s
execute as @s[scores={move=480}] at @s run playsound mob.hollow1 @a ~~~ 1000 1 1000

tag @s[scores={move=1..2},tag=form5b] remove form5b

execute as @s[scores={move=121..,Stun=1..}] at @s run stopsound @a mob.hollow1
execute as @s[scores={move=121..,Stun=1..}] at @s run function cancel_attack



scoreboard players add @s[scores={move=1..120}] infinity 1
scoreboard players add @s[scores={move=121}] infinity 8
scoreboard players set @s[scores={move=125..}] Camera 5
scoreboard players set @s[scores={move=1..}] Move 5
execute as @s[scores={move=1..}] at @s if block ~~-1~ air run scriptevent ds:antiair

execute as @s[scores={move=1..}] at @s run kill @e[type=ds:knockback,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:running,r=8]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:lapse_explode,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:red_reversal,r=25]



camera @s[scores={move=480..},type=player] fade time 0 1 0.75 color 0 0 0
execute as @s[scores={move=470},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^^-0.5^2 rot ~-22 ~180
execute as @s[scores={move=468},type=player] at @s anchored eyes run camera @s set minecraft:free ease 1.5 linear pos ^^-0.65^2.5 rot ~-23 ~180
execute as @s[scores={move=437},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.5 in_out_circ pos ^^^8 rot ~ ~180
execute as @s[scores={move=425},type=player] at @s anchored eyes run camera @s set minecraft:free ease 2 linear pos ^^^5 rot ~ ~180
execute as @s[scores={move=383},type=player] at @s anchored eyes run camera @s set minecraft:free ease 5 linear pos ^^^4.5 rot ~ ~180
camera @s[scores={move=130},type=player] fade time 0.05 0.05 0.05 color 233 50 233
execute as @s[scores={move=130},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.75 in_out_circ pos ^^1^-2 rot ~ ~
camera @s[scores={move=120},type=player] set minecraft:third_person default
camera @s[scores={move=1..5},type=player] clear



execute as @s[scores={move=133..409}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s run tp @s ~~~
execute as @s[scores={move=203..338}] at @s as @e[name=HBlue,type=ds:projectile,r=10,c=1] at @s run tp @s ~~~ facing @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1]
execute as @s[scores={move=203..278}] at @s as @e[name=HRed,type=ds:projectile,r=10,c=1] at @s run tp @s ~~~ facing @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1]
execute as @s[scores={move=203..265}] at @s as @e[name=HRed,type=ds:projectile,r=10,c=1] at @s run tp @s ^^^0.0234 facing @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1]
execute as @s[scores={move=203..265}] at @s as @e[name=HBlue,type=ds:projectile,r=10,c=1] at @s run tp @s ^^^0.0234 facing @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1]

execute as @s[scores={move=203..338}] at @s run playanimation @e[name=HBlue,type=ds:projectile,r=10,c=1] animation.hollow_blue
execute as @s[scores={move=203..278}] at @s run playanimation @e[name=HRed,type=ds:projectile,r=10,c=1] animation.hollow_red
execute as @s[scores={move=203..338}] at @s as @e[name=HBlue,type=ds:projectile,r=10,c=1] at @s run particle ds:hollow_blue5 ^0.25^^-0.15
execute as @s[scores={move=203..278}] at @s as @e[name=HRed,type=ds:projectile,r=10,c=1] at @s run particle ds:hollow_red5 ^0.25^^-0.15

execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=1.6,c=1] if entity @e[name=HBlue,type=ds:projectile,r=1.6,c=1] run particle ds:hollow_colliding ~~~
execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=1.6,c=1] if entity @e[name=HBlue,type=ds:projectile,r=1.6,c=1] run particle ds:hollow_colliding ~~~
execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=1.25,c=1] if entity @e[name=HBlue,type=ds:projectile,r=1.25,c=1] run particle ds:hollow_colliding2 ~~~
execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=1,c=1] if entity @e[name=HBlue,type=ds:projectile,r=1,c=1] run particle ds:hollow_colliding3 ~~~
execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=1.25,c=1] if entity @e[name=HBlue,type=ds:projectile,r=1.25,c=1] run particle ds:hollow_colliding5 ^^^0.22
execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=0.35,c=1] if entity @e[name=HBlue,type=ds:projectile,r=0.35,c=1] run particle ds:hollow_colliding4 ^^^0.22
execute as @s[scores={move=193..212}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1,scores={Deleter=61..80}] at @s run particle ds:hollow_colliding5 ^^^0.22
execute as @s[scores={move=193..212}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1,scores={Deleter=61..80}] at @s run particle ds:hollow_colliding4^^^0.77
execute as @s[scores={move=193..212}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1,scores={Deleter=61..80}] at @s run particle ds:hollow_absorb ^^^0.22

execute as @s[scores={move=203..278}] at @s as @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1] at @s if entity @e[name=HRed,type=ds:projectile,r=0.15,c=1] if entity @e[name=HBlue,type=ds:projectile,r=0.15,c=1] run kill @e[type=ds:projectile,r=0.15,tag=!itemdrop,tag=!DomainExpansion]
execute as @s[scores={move=170..180}] at @s run kill @e[name=HBlueRedTRG,type=ds:projectile,r=5,c=1]



execute as @s[scores={move=410}] at @s run summon ds:projectile HBlueRedTRG ^^1.25^-2.5
execute as @s[scores={move=410}] at @s positioned ^^1.25^-2.5 run tp @e[name=HBlueRedTRG,type=ds:projectile,r=0.15,c=1] ~~~ facing @s
execute as @s[scores={move=410}] at @s positioned ^^1.25^-2.5 run scoreboard players set @e[name=HBlueRedTRG,type=ds:projectile,r=0.15,c=1] Deleter 278

execute as @s[scores={move=335}] at @s run camerashake add @a[r=10] 3 0.25
execute as @s[scores={move=339}] at @s run summon ds:projectile HBlue ^2^1.25^-2.5
execute as @s[scores={move=335..340}] at @s run particle ds:hollow_blue_stars ^2^1.25^-2.5
execute as @s[scores={move=350}] at @s run particle ds:hollow_blue1 ^2^1.25^-2.5
execute as @s[scores={move=335}] at @s run particle ds:hollow_blue2 ^2^1.25^-2.5
execute as @s[scores={move=335}] at @s run particle ds:hollow_blue3 ^2^1.25^-2.5
execute as @s[scores={move=335}] at @s run particle ds:hollow_blue4 ^2^1.25^-2.5
execute as @s[scores={move=335}] at @s run particle ds:hollow_blue5 ^2^1.25^-2.5
execute as @s[scores={move=339}] at @s positioned ^2^1.25^-2.5 run scoreboard players set @e[name=HBlue,type=ds:projectile,r=0.15,c=1] Deleter 136

execute as @s[scores={move=275}] at @s run camerashake add @a[r=10] 3 0.25
execute as @s[scores={move=279}] at @s run summon ds:projectile HRed ^-2^1.25^-2.5
execute as @s[scores={move=275..280}] at @s run particle ds:hollow_red_stars ^-2^1.25^-2.5
execute as @s[scores={move=290}] at @s run particle ds:hollow_red1 ^-2^1.25^-2.5
execute as @s[scores={move=275}] at @s run particle ds:hollow_red2 ^-2^1.25^-2.5
execute as @s[scores={move=275}] at @s run particle ds:hollow_red3 ^-2^1.25^-2.5
execute as @s[scores={move=275}] at @s run particle ds:hollow_red4 ^-2^1.25^-2.5
execute as @s[scores={move=275}] at @s run particle ds:hollow_red5 ^-2^1.25^-2.5
execute as @s[scores={move=279}] at @s positioned ^-2^1.25^-2.5 run scoreboard players set @e[name=HRed,type=ds:projectile,r=0.15,c=1] Deleter 76



execute as @s[scores={move=180}] at @s run camera @a[r=33] fade time 0 0 0.33 color 220 0 220
execute as @s[scores={move=20..185}] at @s run camerashake add @a[r=30] 0.15 0.08
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple2 ^^-1.5^1
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple3 ^^-1.5^1
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple4 ^^-1.5^1
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple_make1 ^^1^1
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple_make2 ^^1^1
execute as @s[scores={move=120..185}] at @s run particle ds:hollow_purple_make3 ^^1^1
execute as @s[scores={move=129..175}] at @s run particle ds:hollow_absorb ^^1^2
execute as @s[scores={move=129..175}] at @s run particle ds:hollow_absorb2 ^^1^2



effect @s[scores={move=21..},type=player] slowness 1 2 true

title @s[scores={move=119},tag=!impactframesoff,type=player] title 
title @s[scores={move=117},tag=!impactframesoff,type=player] title §l
title @s[scores={move=114},tag=!impactframesoff,type=player] title 
title @s[scores={move=113},tag=!impactframesoff,type=player] title 
title @s[scores={move=112},tag=!impactframesoff,type=player] title §l
title @s[scores={move=22},tag=!impactframesoff,type=player] title 
title @s[scores={move=21},tag=!impactframesoff,type=player] title 
title @s[scores={move=20},tag=!impactframesoff,type=player] title §l
title @s[scores={move=18},tag=!impactframesoff,type=player] title 
title @s[scores={move=17},tag=!impactframesoff,type=player] title 
title @s[scores={move=16},tag=!impactframesoff,type=player] title §l


execute as @s[scores={move=120}] at @s run particle ds:invert ^^2^1.5
execute as @s[scores={move=119}] at @s run particle ds:red_tint ^^2^1.5
execute as @s[scores={move=118}] at @s run particle ds:blue_tint ^^2^1.25
execute as @s[scores={move=117}] at @s run particle ds:invert ^^2^1.15
execute as @s[scores={move=116}] at @s run summon gg:impact_frame
execute as @s[scores={move=114}] at @s run tp @e[type=gg:impact_frame,r=10,c=1] ~~-200~

execute as @s[scores={move=70}] at @s as @a[r=100] at @s run playsound music.hollow2 @s ~~~ 1 1
execute as @s[scores={move=120}] at @s run summon ds:projectile HollowP ^^^6
execute as @s[scores={move=119}] at @s run tag @e[name=HollowP,type=ds:projectile,tag=!GojoProj] add GojoProj

execute as @s[scores={move=20..120}] at @s positioned ^^^6 run tp @e[name=HollowP,type=ds:projectile,r=10,c=1] ~~~ facing ^^^110

execute as @s[scores={move=27}] at @s run playsound mob.red2 @a[r=200] ^^1^1 99999 3 99999
execute as @s[scores={move=27}] at @s run summon gg:impact_frame
execute as @s[scores={move=26}] at @s run particle ds:invert ^^1^ 
execute as @s[scores={move=25}] at @s run summon gg:impact_frame_black
execute as @s[scores={move=27}] at @s run camerashake add @a[r=33] 2 0.15 rotational
execute as @s[scores={move=25..120}] at @s positioned ^^^6 run scoreboard players set @e[type=ds:projectile,name=HollowP,r=0.15,c=1] Deleter 255
execute as @s[scores={move=25}] at @s run scriptevent ds:shootprojectile ds:projectile HollowP velocity:4 scores:Deleter 255 nearestTypeApply



