playanimation @s[scores={move=320..}] animation.200_purple
execute as @s[scores={move=320..}] at @s run tp @s @s
execute as @s[scores={move=320}] at @s run playsound music.200hollow2 @s ~~~ 1000 1 1000
execute as @s[scores={move=320}] at @s run playsound mob.200hollow @a[rm=0.15] ~~~ 1000 1 1000

tag @s[scores={move=1..2},tag=form5c] remove form5c

execute as @s[scores={move=121..,Stun=1..}] at @s run stopsound @a mob.200hollow
execute as @s[scores={move=249..294,Stun=1..},type=player] at @s positioned ~ 310 ~ run kill @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1]
execute as @s[scores={move=238..294,Stun=1..},type=player] at @s positioned ~ 310 ~ run kill @e[name=HBlue2,type=ds:projectile,r=10,c=1]
execute as @s[scores={move=238..294,Stun=1..},type=player] at @s positioned ~ 310 ~ run kill @e[name=HRed2,type=ds:projectile,r=10,c=1]
stopsound @s[scores={move=121..,Stun=1..},type=player] music.200hollow2
execute as @s[scores={move=121..,Stun=1..}] at @s run function cancel_attack


scoreboard players add @s[scores={move=121}] infinity 8
scoreboard players add @s[scores={move=1..120}] infinity 1
scoreboard players set @s[scores={move=1..}] Camera 4
scoreboard players set @s[scores={move=1..}] Move 4
#scoreboard players set @s[scores={move=1..}] ProjImmune 50
execute as @s[scores={move=1..}] at @s if block ~~-1~ air run scriptevent ds:antiair

execute as @s[scores={move=1..}] at @s run kill @e[type=ds:knockback,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:running,r=8]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:lapse_explode,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:red_reversal,r=25]



camera @s[scores={move=320},type=player] fade time 0.2 0.2 0.3 color 255 255 255
execute as @s[scores={move=316},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^ ^15 ^25 rot ~35 ~180
execute as @s[scores={move=314},type=player] at @s anchored eyes run camera @s set minecraft:free ease 1 in_out_circ pos ^^^3.5 rot ~ ~180
execute as @s[scores={move=291},type=player] at @s anchored eyes run camera @s set minecraft:free ease 1 in_out_circ pos ^ ^10 ^-13.5 rot ~54 ~
camera @s[scores={move=281},type=player] fade time 0.2 0.2 0.1 color 0 0 0
execute as @s[scores={move=277},type=player] at @s run camera @s set minecraft:free pos ~ 310 ~ rot ~ ~174
camera @s[scores={move=260},type=player] fade time 0 0.3 1 color 255 20 255
camera @s[scores={move=251},type=player] clear
execute as @s[scores={move=250},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^25 ^20 ^28.5 rot ~44 ~130
execute as @s[scores={move=249},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.5 in_out_circ pos ^-7 ^10 ^-13.5 rot ~34 ~-37
execute as @s[scores={move=238},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.75 in_out_circ pos ^^^3.5 rot ~ ~180
camera @s[scores={move=130},type=player] fade time 0.3 0.2 0.3 color 255 25 255
execute as @s[scores={move=125},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^25 ^20 ^-12.5 rot ~24 ~32
execute as @s[scores={move=45},type=player] at @s anchored eyes run camera @s set minecraft:free ease 2.4 in_out_circ pos ^19 ^20 ^-12.5 rot ~14 ~5

execute as @s[scores={move=255..275},type=player] at @s run particle ds:cutscene_black1 ~ 310 ~
title @s[scores={move=258},tag=!impactframesoff,type=player] title 
title @s[scores={move=257},tag=!impactframesoff,type=player] title 
title @s[scores={move=256},tag=!impactframesoff,type=player] title 
title @s[scores={move=255},tag=!impactframesoff,type=player] title 
title @s[scores={move=253},tag=!impactframesoff,type=player] title §l



execute as @s[scores={move=249..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1] at @s run tp @s ~ 310 ~
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlue2,type=ds:projectile,r=10,c=1] at @s run tp @s ~ 310 ~
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HRed2,type=ds:projectile,r=10,c=1] at @s run tp @s ~ 310 ~
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlue2,type=ds:projectile,r=10,c=1] at @s run tp @s ~~~ facing @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1]
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HRed2,type=ds:projectile,r=10,c=1] at @s run tp @s ~~~ facing @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1]
execute as @s[scores={move=238..270},type=player] at @s positioned ~ 310 ~ as @e[name=HBlue2,type=ds:projectile,r=10,c=1,scores={Deleter=1..33}] at @s run tp @s ^^^0.171 facing @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1]
execute as @s[scores={move=238..270},type=player] at @s positioned ~ 310 ~ as @e[name=HRed2,type=ds:projectile,r=10,c=1,scores={Deleter=1..33}] at @s run tp @s ^^^0.171 facing @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1]

execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ run playanimation @e[name=HBlue2,type=ds:projectile,r=10,c=1] animation.hollow_blue
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ run playanimation @e[name=HRed2,type=ds:projectile,r=10,c=1] animation.hollow_red
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlue2,type=ds:projectile,r=10,c=1] at @s run particle ds:hollow_blue5 ^0.25^^-0.15
execute as @s[scores={move=238..294},type=player] at @s positioned ~ 310 ~ as @e[name=HRed2,type=ds:projectile,r=10,c=1] at @s run particle ds:hollow_red5 ^0.25^^-0.15
execute as @s[scores={move=249..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1] at @s if entity @e[name=HRed2,type=ds:projectile,r=0.6,c=1] if entity @e[name=HBlue2,type=ds:projectile,r=0.6,c=1] run particle ds:hollow_colliding ~~~
execute as @s[scores={move=249..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1] at @s if entity @e[name=HRed2,type=ds:projectile,r=0.6,c=1] if entity @e[name=HBlue2,type=ds:projectile,r=0.6,c=1] run particle ds:hollow_colliding ~~~
execute as @s[scores={move=249..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1] at @s if entity @e[name=HRed2,type=ds:projectile,r=0.85,c=1] if entity @e[name=HBlue2,type=ds:projectile,r=0.85,c=1] run particle ds:hollow_colliding2 ~~~
execute as @s[scores={move=249..294},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1] at @s if entity @e[name=HRed2,type=ds:projectile,r=0.8,c=1] if entity @e[name=HBlue2,type=ds:projectile,r=0.8,c=1] run particle ds:hollow_colliding3 ~~~
execute as @s[scores={move=249..263},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1,scores={Deleter=1..15}] at @s run particle ds:hollow_colliding5 ^^^0.35
execute as @s[scores={move=249..263},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1,scores={Deleter=1..15}] at @s run particle ds:hollow_colliding4^^^0.35
execute as @s[scores={move=249..263},type=player] at @s positioned ~ 310 ~ as @e[name=HBlueRedTRG2,type=ds:projectile,r=10,c=1,scores={Deleter=1..15}] at @s run particle ds:hollow_absorb ^^^0.35



execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ run summon ds:projectile HBlue2 ^2^^-3.5
execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ run summon ds:projectile HRed2 ^-2.675^^-4
execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ run summon ds:projectile HBlueRedTRG2 ^^^-4.5
execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ positioned ^2^^-3.5 run scoreboard players set @e[name=HBlue2,type=ds:projectile,r=0.15,c=1] Deleter 58
execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ positioned ^-2.675^^-4 run scoreboard players set @e[name=HRed2,type=ds:projectile,r=0.15,c=1] Deleter 58
execute as @s[scores={move=295},type=player] at @s positioned ~ 310 ~ positioned ^^^-4.5 run scoreboard players set @e[name=HBlueRedTRG2,type=ds:projectile,r=0.15,c=1] Deleter 47



title @s[scores={move=295},tag=!impactframesoff,type=player] title 
title @s[scores={move=294},tag=!impactframesoff,type=player] title 
title @s[scores={move=293},tag=!impactframesoff,type=player] title 
title @s[scores={move=292},tag=!impactframesoff,type=player] title §r§l
camera @s[scores={move=97},type=player] clear
execute as @s[scores={move=95}] at @s run playsound music.hollow3 @a[r=160]
execute as @s[scores={move=93},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^25 ^20 ^-12.5 rot ~24 ~32

execute as @s[scores={move=297}] at @s run particle ds:200purple_shockwave1 ~~1~
execute as @s[scores={move=90..215}] at @s run particle ds:200purple_floor ~~0.02~
execute as @s[scores={move=90..175}] at @s run particle ds:200purple_floor2 ~~0.02~
execute as @s[scores={move=287}] at @s run particle ds:200purple_shockwave1 ~~1~
execute as @s[scores={move=247}] at @s run particle ds:200purple_shockwave1 ~~1~
execute as @s[scores={move=207}] at @s run particle ds:200purple_shockwave1 ~~1~
execute as @s[scores={move=170}] at @s run particle ds:200purple_shockwave1 ~~1~
execute as @s[scores={move=170..295}] at @s run camerashake add @a[r=40] 0.15 0.1
execute as @s[scores={move=170..295}] at @s run particle ds:charging_rubble
execute as @s[scores={move=295}] at @s run particle ds:purplelightning_maximpact1
execute as @s[scores={move=165..170}] at @s run particle ds:purplelightning_redblue ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_blue_splash1 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_blue_splash2 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_blue_splash3 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_blue_splash4 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_red_splash1 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_red_splash2 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_red_splash3 ~~1~
execute as @s[scores={move=169..170}] at @s run particle ds:200_red_splash4 ~~1~
execute as @s[scores={move=170..225}] at @s run particle ds:200purple_starsarea ~~1~
execute as @s[scores={move=214..220}] at @s run particle ds:200purple_stars1 ~~1~
execute as @s[scores={move=290..295}] at @s run particle ds:purplelightning_maximum1 ~~1~
execute as @s[scores={move=170..295}] at @s run particle ds:purplelightning_maximum2 ~~1~
execute as @s[scores={move=170..215}] at @s run particle ds:purplelightning_maximum1 ~~1~
execute as @s[scores={move=170..215}] at @s run particle ds:200purple_shockwave2 ~~0.05~
execute as @s[scores={move=170..215}] at @s run particle ds:200purple_shockwave3 ~~0.2~
execute as @s[scores={move=170..287}] at @s run particle ds:200purple_energy1 ~~1~
execute as @s[scores={move=170..287}] at @s run particle ds:200purple_energy2 ~~1~



execute as @s[scores={move=300}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §l§dɴɪɴᴇ ʀᴏᴘᴇꜱ"}]}
execute as @s[scores={move=278}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §l§dᴘᴏʟᴀʀɪᴢᴇᴅ ʟɪɢʜᴛ"}]}
execute as @s[scores={move=249}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §l§dᴄʀᴏᴡ ᴀɴᴅ ᴅᴇᴄʟᴀʀᴀᴛɪᴏɴ,"}]}
execute as @s[scores={move=190}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §l§dʙᴇᴛᴡᴇᴇɴ ꜰʀᴏɴᴛ ᴀɴᴅ ʙᴀᴄᴋ."}]}
execute as @s[scores={move=131}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §l§dʜᴏʟʟᴏᴡ ᴛᴇᴄʜɴɪQᴜᴇ:"}]}
execute as @s[scores={move=92}] run tellraw @a[r=40] {"rawtext":[{"text": "§f<§r"},{"selector": "@s"},{"text": "§f> §o§l§5ᴘᴜʀᴘʟᴇ"}]}

title @s[scores={move=89},tag=!impactframesoff,type=player] title 
title @s[scores={move=88},tag=!impactframesoff,type=player] title 
title @s[scores={move=87},tag=!impactframesoff,type=player] title 
title @s[scores={move=86},tag=!impactframesoff,type=player] title 
title @s[scores={move=85},tag=!impactframesoff,type=player] title 
title @s[scores={move=84},tag=!impactframesoff,type=player] title 
title @s[scores={move=83},tag=!impactframesoff,type=player] title 
title @s[scores={move=80..82},tag=!impactframesoff,type=player] title §r§l
camera @s[scores={move=85},type=player] fade time 0 0.65 2 color 255 245 255
execute as @s[scores={move=80..85}] at @s run camerashake add @a[r=200] 3 0.1

execute as @e[tag=!Frames,r=10,rm=0.5,family=!projectile,family=!damage,family=!inanimate,family=!motionless] at @s run playsound mob.red2 @a[r=100] ~~1~ 9999 2.5 9999
execute as @e[tag=!Frames,r=10,rm=0.5,family=!projectile,family=!damage,family=!inanimate,family=!motionless] at @s run scriptevent ds:knockback -30


execute as @s[scores={move=120}] at @s run summon ds:projectile 200HollowP ^^^16
execute as @s[scores={move=119}] at @s run tag @e[name=200HollowP,type=ds:projectile,tag=!GojoProj] add GojoProj
execute as @s[scores={move=80..120}] at @s positioned ^^^16 run tp @e[name=200HollowP,type=ds:projectile,r=10,c=1] ~~~ facing ^^^100
execute as @s[scores={move=85..120}] at @s positioned ^^^16 run scoreboard players set @e[name=200HollowP,type=ds:projectile,r=1,c=1] Deleter 255
