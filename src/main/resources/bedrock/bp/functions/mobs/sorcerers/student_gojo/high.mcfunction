playanimation @s[scores={move=50}] animation.gojo_high
execute as @s[scores={move=3..41,Stun=1..},tag=!noStunnedAnim] at @s run stopsound @a[r=30] mob.gojo_high
playanimation @s[scores={move=3..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=3..,Stun=1..}] move 2

scoreboard players set @s[scores={move=1..}] Move 4
execute as @s[scores={move=42}] at @s run playsound mob.gojo_high @a[r=30] ~~~ 99999 1 99999
effect @s[scores={move=35..40}] levitation 1 2 true
execute as @s[scores={move=15..,levitate=0..9}] at @s if block ~~-0.25~ air run scoreboard players set @s levitate 10

execute as @s[scores={move=15..34,levitate=0}] at @s unless block ~~-0.25~ air run particle ds:levitate_1 ~~~
execute as @s[scores={move=15..34,levitate=0}] at @s unless block ~~-0.25~ air run particle ds:levitate_2 ~~~
execute as @s[scores={move=15..34}] at @s run particle ds:honored ~~1~
execute as @s[scores={move=15..34}] at @s run particle ds:honored2 ~~1~
scoreboard players add @s[scores={move=15..34}] high 26
scoreboard players add @s[scores={move=15..34,Energy=1..9975}] Energy 24
scoreboard players set @s[scores={move=15..34,ability2=1..23}] ability2 0
scoreboard players set @s[scores={move=15..34,ability3=1..23}] ability3 0
scoreboard players set @s[scores={move=15..34,ability4=1..23}] ability4 0
scoreboard players set @s[scores={move=15..34,ability5=1..23}] ability5 0
scoreboard players set @s[scores={move=15..34,ability6=1..23}] ability6 0
scoreboard players set @s[scores={move=15..34,ability7=1..23}] ability7 0
scoreboard players set @s[scores={move=15..34,simpledomainCD=1..23}] simpledomainCD 0
scoreboard players set @s[scores={move=15..34,reversecursedCD=1..5}] reversecursedCD 0
scoreboard players set @s[scores={move=15..34,rctuses=1..5}] rctuses 0
scoreboard players remove @s[scores={move=15..34,ability2=24..}] ability2 24
scoreboard players remove @s[scores={move=15..34,ability3=24..}] ability3 24
scoreboard players remove @s[scores={move=15..34,ability4=24..}] ability4 24
scoreboard players remove @s[scores={move=15..34,ability5=24..}] ability5 24
scoreboard players remove @s[scores={move=15..34,ability6=24..}] ability6 24
scoreboard players remove @s[scores={move=15..34,ability7=24..}] ability7 24
scoreboard players remove @s[scores={move=15..34,simpledomainCD=24..}] simpledomainCD 24
scoreboard players remove @s[scores={move=15..34,reversecursedCD=6..}] reversecursedCD 6
scoreboard players remove @s[scores={move=15..34,rctuses=6..}] rctuses 6



scoreboard players set @s[scores={DashCD=1..10}] DashCD 0

execute as @s[scores={move=3..,DashCD=!1..10,ability3=0}] at @s at @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=6,rm=0.15] unless score @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] atkdetect = @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] blackflashchance positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10,ability3=0}] at @s at @e[scores={atk=1..},r=6,rm=0.15] positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10,ability3=1..},tag=!Frames] at @s at @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=6,rm=0.15] unless score @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] atkdetect = @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] blackflashchance positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10,ability3=1..},tag=!Frames] at @s at @e[scores={atk=1..},r=6,rm=0.15] positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=arrow,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=thrown_trident,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=small_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=dragon_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=fireworks_rocket,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=fishing_hook,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=ender_pearl,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=splash_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=lingering_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[type=area_effect_cloud,r=9] positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames,tag=hasTRG] at @s at @e[type=snowball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames,tag=hasTRG] at @s at @e[type=egg,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames,tag=hasTRG] at @s at @e[type=xp_bottle,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s at @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=12,c=1] positioned ^^^6 if entity @s[r=6] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s if entity @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=3.5,c=1] run scoreboard players random @s DashCD 1 10
execute as @s[scores={move=3..,DashCD=!1..10},tag=!Frames] at @s if entity @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=6,c=1,scores={atk=1..}] run scoreboard players random @s DashCD 1 10

execute as @s[scores={DashCD=1..10,chance=!25,move=3..42,ability3=0}] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run stopsound @a[r=30] mob.gojo_high
execute as @s[scores={DashCD=1..10,chance=!25,move=3..,ability3=0}] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s chance 25
execute as @s[scores={DashCD=1..10,chance=25,move=!51,ability3=0}] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 51

execute as @s[scores={move=3..42,DashCD=1..10,chance=!25,ability3=1..},tag=!customDashCD] at @s run stopsound @a[r=30] mob.gojo_high
tag @s[scores={move=3..,DashCD=1..10,chance=!25,ability3=1..},tag=!customDashCD] add customDashCD
scoreboard players random @s[scores={move=3..,DashCD=1..10,chance=!25,ability3=1..},tag=customDashCD] DashCD -203 -202
scoreboard players set @s[scores={move=3..,DashCD=-203..-202,chance=!25,ability3=1..},tag=customDashCD] move 2
execute as @s[scores={DashCD=-203..-202,chance=!25,ability3=1..},tag=customDashCD] at @s run function _hitdodge

scoreboard players set @s[scores={DashCD=1..10}] DashCD 0

execute as @s[scores={move=3..,chance=!25}] at @s as @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={blackflashchance=0..},r=7,rm=0.15] unless score @s atkdetect = @s blackflashchance run scoreboard players operation @s atkdetect = @s blackflashchance