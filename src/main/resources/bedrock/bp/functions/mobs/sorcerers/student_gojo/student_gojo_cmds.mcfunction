tag @e[type=ds:student_gojo,tag=!gojo_function,c=16] add gojo_function
tag @e[type=ds:student_gojo2,tag=!gojo_function,c=16] add gojo_function
execute as @e[family=gojo,tag=gojo_function,c=16] unless entity @s[scores={Energy=0..}] run scoreboard players add @s Energy 0
execute as @e[scores={Energy=0},type=ds:student_gojo2,c=16] unless entity @e[scores={high=0..}] run scoreboard objectives add high dummy
execute as @e[scores={Energy=0},type=ds:student_gojo2,c=16] unless entity @e[scores={atkdetect=0..}] run scoreboard objectives add atkdetect dummy
execute as @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] unless entity @s[scores={guilty_score=0..}] run scoreboard players set @s guilty_score 5
execute as @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] unless entity @s[scores={simpledomainown=1..}] run scoreboard players set @s simpledomainown 1
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] domain 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] chance 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] hitCD 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] DashCD_mob 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Stun 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] move 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Move 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Camera 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Disabled 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] endurance 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] simpledomainCD 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] cutscene 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability1 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability2 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability3 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability4 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability5 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability6 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability7 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability8 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability9 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability10 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability11 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] ability12 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] nocts 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Hit 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] flashstep 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] knockdown 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Flourish 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] dying 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] combat 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] levitate 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] bluefist 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] BasicM1s 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] BasicM1 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] DashCD 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] damageadd 0
scoreboard players set @e[scores={Energy=0,damageadd=0..7},family=gojo,tag=gojo_function,c=16] damageadd 8
scoreboard players set @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] punch 1
scoreboard players set @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] strength 40
scoreboard players set @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] infinity 2000
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] blackflashlearn 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] thezone 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,type=ds:student_gojo2] rct 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,type=ds:student_gojo2] rctuses 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,type=ds:student_gojo2] reversecursedCD 0
scoreboard players add @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,type=ds:student_gojo2] high 200
tag @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,tag=!basic_behavior] add basic_behavior
tag @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,tag=!havingcts] add havingcts
tag @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,tag=!limitless] add limitless
tag @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16,tag=!yujis_friend] add yujis_friend
scoreboard players set @e[scores={Energy=0},family=gojo,tag=gojo_function,c=16] Energy 9999

execute unless entity @a[tag=limitless] run function limitless/limitless

scoreboard players remove @e[scores={high=1..,detect_health=..299},type=ds:student_gojo2,c=16] high 1
scoreboard players remove @e[scores={high=201..,detect_health=300..},type=ds:student_gojo2,c=16] high 1
scoreboard players remove @e[scores={ability3=1..,high=1..},type=ds:student_gojo2,c=16,tag=!confiscation] ability3 1
scoreboard players remove @e[scores={ability4=1..,high=1..},type=ds:student_gojo2,c=16,tag=!confiscation] ability4 1
scoreboard players remove @e[scores={ability6=1..,high=1..},type=ds:student_gojo2,c=16,tag=!confiscation] ability6 1
scoreboard players add @e[scores={Energy=1..9998,high=1..},type=ds:student_gojo2,c=16] Energy 1
scoreboard players add @e[scores={Energy=1..9998},family=gojo,tag=gojo_function,c=16] Energy 1
scoreboard players add @e[scores={combat=0,Energy=1..3333},family=gojo,tag=gojo_function,c=16] Energy 5
scoreboard players add @e[scores={combat=0,Energy=3334..6666},family=gojo,tag=gojo_function,c=16] Energy 7
scoreboard players add @e[scores={combat=0,Energy=6667..9990},family=gojo,tag=gojo_function,c=16] Energy 9
tag @e[scores={combat=0,ability3=0,nocts=0,detect_health=300..},tag=!relax,type=ds:student_gojo2,c=16] add relax
tag @e[scores={nocts=1..},tag=relax,type=ds:student_gojo2,c=16] remove relax
tag @e[scores={ability3=1..},tag=relax,type=ds:student_gojo2,c=16] remove relax
tag @e[scores={detect_health=0..299},tag=relax,type=ds:student_gojo2,c=16] remove relax

execute as @e[scores={cutscene=0,knockdown=0,Flourish=0,levitate=0,nocts=0},tag=!Frames,family=gojo,tag=gojo_function,c=16] at @s if block ~~-0.15~ air unless block ~~-2~ air unless block ~~-2~ water run effect @s slow_falling 1 0 true

effect @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0},tag=relax,type=ds:student_gojo2,c=16] slowness 1 2 true





scoreboard players set @e[scores={DashCD=!0,high=1..},type=ds:student_gojo2,c=16] DashCD 0
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=6,rm=0.15,tag=!unselect] unless score @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] atkdetect = @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={atkdetect=0..,blackflashchance=0..},r=0.15,c=1] blackflashchance positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s as @e[family=!heavenlyrestriction,tag=!heavenlyrestriction,scores={blackflashchance=0..},r=7,rm=0.15,tag=!unselect] unless score @s atkdetect = @s blackflashchance run scoreboard players operation @s atkdetect = @s blackflashchance
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=arrow,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=thrown_trident,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=small_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=dragon_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=fireworks_rocket,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=fishing_hook,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=ender_pearl,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=splash_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=lingering_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=area_effect_cloud,r=9] positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=hasTRG,tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=snowball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=hasTRG,tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=egg,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=hasTRG,tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[type=xp_bottle,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s at @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,tag=!GojoProj,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=12,c=1] positioned ^^^6 if entity @s[r=6] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] at @s if entity @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,tag=!GojoProj,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=6,c=1,scores={atk=1..}] run scoreboard players random @s DashCD 1 10
scoreboard players random @e[scores={DashCD=1..9,flashstep=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,type=ds:student_gojo2,c=16] DashCD -203 -202
execute as @e[scores={DashCD=-203..-202,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=2..,DashCD_mob=0,ability3=0,nocts=0,chance=!27},tag=!Frames,tag=!customDashCD,tag=hasTRG,tag=dodge_red,type=ds:student_gojo2,c=16] at @s run scoreboard players set @s chance 27
execute as @e[scores={DashCD=-203..-202,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=2..,DashCD_mob=0,ability3=0,nocts=0,chance=27},tag=!Frames,tag=!customDashCD,tag=hasTRG,tag=dodge_red,type=ds:student_gojo2,c=16] at @s run scoreboard players set @s move 51
tag @e[scores={DashCD=-203..-202,flashstep=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,tag=!customDashCD,type=ds:student_gojo2,c=16] add customDashCD
execute as @e[scores={DashCD=-203..-202,flashstep=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=1..,DashCD_mob=0},tag=!Frames,tag=customDashCD,type=ds:student_gojo2,c=16] at @s run function _hitdodge

execute as @e[scores={Hit=1..2,cutscene=0,Stun=0..20,flashstep=0,move=0,Move=0,knockdown=0,Flourish=0,DashCD_mob=0},family=gojo,tag=gojo_function,c=16] at @s run function _hitdodge





execute as @e[scores={cutscene=0,move=0,infinity=4..},tag=infinity,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[type=ds:gojo_knockback,r=20] at @e[family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,tag=!infinity,tag=!domainamplification,hasitem={item=ds:inverted_spear,location=slot.weapon.mainhand,quantity=0},tag=!blackflash1,tag=!blackflash2,tag=!blackflash3,tag=!blackflash4,tag=!blackflashyuji,r=6,c=1,scores={atk=1..2}] unless entity @e[family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect,tag=!infinity,tag=!domainamplification,hasitem={item=ds:inverted_spear,location=slot.weapon.mainhand,quantity=0},tag=!blackflash1,tag=!blackflash2,tag=!blackflash3,tag=!blackflash4,tag=!blackflashyuji,r=0.15,c=1,scores={atk=1..2,blackflashchance=7}] positioned ^^^3 if entity @s[r=3] at @s run summon ds:gojo_knockback
execute as @e[scores={infinity=4..},tag=Frames,family=gojo,tag=gojo_function,c=16] at @s at @e[type=ds:knife,r=3.5] positioned as @s run tp @e[type=ds:knife,r=3.5] ^^^-3.5
execute as @e[scores={infinity=4..},tag=Frames,family=gojo,tag=gojo_function,c=16] at @s at @e[type=ds:knives,r=3.5] positioned as @s run tp @e[type=ds:knives,r=3.5] ^^^-3.5
execute as @e[scores={infinity=4..},tag=Frames,family=gojo,tag=gojo_function,c=16] at @s run kill @e[type=ds:dismantle,r=4]
execute as @e[scores={infinity=4..},tag=Frames,family=gojo,tag=gojo_function,c=16] at @s run kill @e[type=ds:dismantle_small,r=4]
effect @e[scores={infinity=4..,detect_health=200..},tag=Frames,type=ds:student_gojo,c=16] instant_health 1 5 true
effect @e[scores={infinity=4..,detect_health=300..},tag=Frames,type=ds:student_gojo2,c=16] instant_health 1 5 true

scoreboard players add @e[scores={infinity=1},family=gojo,tag=gojo_function,c=16] ability1 600
scoreboard players add @e[scores={infinity=1..3},family=gojo,tag=gojo_function,c=16] ability1 1

execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run camerashake add @a[r=10] 4 0.15
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run playsound mob.elderguardian.curse @a ~~~ 1 2.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run playsound mob.elderguardian.curse @a ~~~ 1 1.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run particle ds:infinity_1 ~~1~
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run particle ds:infinity_2 ~~1~
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] run camerashake add @a[r=10] 4 0.15
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] run playsound mob.elderguardian.curse @a ~~~ 1 2.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] run playsound mob.elderguardian.curse @a ~~~ 1 1.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] run particle ds:infinity_1 ~~1~
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] run particle ds:infinity_2 ~~1~
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run camerashake add @a[r=10] 4 0.15
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run playsound mob.elderguardian.curse @a ~~~ 1 2.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run playsound mob.elderguardian.curse @a ~~~ 1 1.5
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run particle ds:infinity_1 ~~1~
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run particle ds:infinity_2 ~~1~

execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0..1750,ability1=0},family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=!ChimeraGarden1] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run scoreboard players set @s infinity 2000
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0..1750,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55,name=!ChimeraGarden1] run scoreboard players set @s infinity 2000
execute as @e[scores={Hit=0,flashstep=0,Stun=0,infinity=0..1750,ability1=0},tag=domainimmune,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=!ChimeraGarden1] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] run scoreboard players set @s infinity 2000



tag @e[tag=hit,family=gojo,tag=gojo_function,c=16] remove hit
execute as @e[scores={chance=1..2,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function mobs/sorcerers/student_gojo/blue_m1s



#rct
tag @e[scores={reversecursedCD=0},tag=rctCD,type=ds:student_gojo2,c=16] remove rctCD
scoreboard players add @e[scores={combat=1..,reversecursedCD=1..},tag=!rctCD,type=ds:student_gojo2,c=16] reversecursedCD 1
scoreboard players remove @e[scores={combat=0,rctuses=1..},type=ds:student_gojo2,c=16] rctuses 1
effect @e[scores={dying=0,combat=0,detect_health=0..225,rctuses=0..799,Energy=2..},type=ds:student_gojo2,c=16] slowness 1 3 true
scoreboard players set @e[scores={dying=0,combat=0,detect_health=0..225,rctuses=0..799,Energy=2..},type=ds:student_gojo2,c=16] rct 5
effect @e[scores={dying=0,detect_health=0..60,rct=0,rctuses=0..799,Energy=2..},type=ds:student_gojo2,c=16] slowness 1 3 true
scoreboard players set @e[scores={dying=0,detect_health=0..60,rct=0,rctuses=0..799,Energy=2..},type=ds:student_gojo2,c=16] rct 120

execute as @e[tag=!hasTRG,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..240,rctuses=0..799,Energy=2..},tag=!rctCD,type=ds:student_gojo2,c=16] at @s unless entity @e[rm=0.15,r=10,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,family=!hero,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=curse,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=sukuna,c=1] run effect @s slowness 1 3 true
execute as @e[tag=!hasTRG,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..240,rctuses=0..799,Energy=2..},tag=!rctCD,type=ds:student_gojo2,c=16] at @s unless entity @e[rm=0.15,r=10,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,family=!hero,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=curse,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=sukuna,c=1] run scoreboard players add @s reversecursedCD 8
execute as @e[tag=!hasTRG,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..248,rctuses=0..799,Energy=2..},tag=!rctCD,type=ds:student_gojo2,c=16] at @s unless entity @e[rm=0.15,r=10,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,family=!hero,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=curse,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=sukuna,c=1] run scoreboard players add @s rct 6
execute as @e[tag=!hasTRG,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=5..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,reversecursedCD=241..,rctuses=0..799,Energy=2..},tag=!rctCD,type=ds:student_gojo2,c=16] at @s unless entity @e[rm=0.15,r=10,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand,family=!hero,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=curse,c=1] unless entity @e[rm=0.15,r=10,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,tag=!unselect,family=hero,tag=sukuna,c=1] run tag @s add rctCD



#simple domain
execute as @e[scores={Disabled=0,cutscene=0,Stun=0,Hit=0,simpledomainCD=0,move=0,flashstep=0},tag=!domainimmune,tag=!simpledomain,tag=!domainactive,family=gojo,tag=gojo_function,c=16] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55,name=!ChimeraGarden1] unless entity @e[tag=simpledomain,scores={move=1..},r=10,type=!ds:kusakabe,hasitem={item=ds:shadow_style_katana,quantity=0}] unless entity @e[tag=simpledomain,scores={move=1..},r=20,type=ds:kusakabe] unless entity @e[tag=simpledomain,scores={move=1..},r=20,hasitem={item=ds:shadow_style_katana}] run tag @s add simpledomain
execute as @e[scores={Disabled=0,cutscene=0,Stun=0,Hit=0,simpledomainCD=0,move=0,flashstep=0},tag=!domainimmune,tag=!simpledomain,tag=!domainactive,family=gojo,tag=gojo_function,c=16] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=!ChimeraGarden1] at @e[family=damage,family=projectile,family=boss,tag=DomainExpansion,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,c=1] if entity @e[tag=sukuna,scores={domainactive=1..},r=200] at @s unless entity @e[tag=simpledomain,scores={move=1..},type=!ds:kusakabe,hasitem={item=ds:shadow_style_katana,quantity=0},r=10,c=1] unless entity @e[tag=simpledomain,scores={move=1..},type=ds:kusakabe,r=20,c=1] unless entity @e[tag=simpledomain,scores={move=1..},hasitem={item=ds:shadow_style_katana},r=20,c=1] run tag @s add simpledomain
scoreboard players set @e[scores={Disabled=0,cutscene=0,Stun=0,Hit=0,simpledomainCD=0,move=0,flashstep=0},tag=!domainimmune,tag=simpledomain,tag=!domainactive,family=gojo,tag=gojo_function,c=16] move 61

execute as @e[tag=simpledomain,scores={move=1..},family=gojo,tag=gojo_function,c=16] at @s run tp @s ~~~~ 0
scoreboard players set @e[tag=simpledomain,scores={move=1..},family=gojo,tag=gojo_function,c=16] Disabled 25
scoreboard players set @e[tag=simpledomain,scores={move=1..},family=gojo,tag=gojo_function,c=16] simpledomainCD 700
execute as @e[tag=simpledomain,scores={move=1..},family=gojo,tag=gojo_function,c=16] at @s run function ce/simpledomain



#hiddeninventory
execute as @e[scores={cutscene=1..},tag=hidden_inventory_cutscene,family=gojo,tag=gojo_function,c=16] at @s run function mobs/hidden_inventory_cutscene
execute as @e[scores={cutscene=1..},tag=hidden_inventory_cutscene,family=gojo,tag=gojo_function,c=16] at @s as @e[type=!player,r=35,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] at @s run tp @s ~~~



#-----melee-----


scoreboard players set @e[scores={chance=3,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 10


scoreboard players set @e[scores={chance=4,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 15


scoreboard players set @e[scores={chance=5,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 15


scoreboard players set @e[scores={chance=6,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 20


scoreboard players set @e[scores={chance=7,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 25


scoreboard players set @e[scores={chance=8..9,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 31


scoreboard players set @e[scores={chance=10,Stun=0,move=1..},type=ds:student_gojo2,c=16] Disabled 55
scoreboard players set @e[scores={chance=10,Stun=0,move=1..},type=ds:student_gojo2,c=16] ability6 200
scoreboard players set @e[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability3=0,nocts=0},type=ds:student_gojo2,c=16] move 51
scoreboard players set @e[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=51,ability3=0,nocts=0},type=ds:student_gojo2,c=16] chance 27


scoreboard players set @e[scores={chance=11,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 15


scoreboard players set @e[scores={chance=12,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 25


#-----ranged-----


scoreboard players set @e[scores={chance=19,Stun=0,move=1..},type=ds:student_gojo2,c=16] Disabled 10
scoreboard players set @e[scores={chance=19,Stun=0,move=1..},type=ds:student_gojo2,c=16] ability8 600


scoreboard players set @e[scores={chance=20,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 31


effect @e[scores={chance=21,Stun=0,move=16},family=gojo,tag=gojo_function,c=16] slowness 1 0 true
scoreboard players set @e[scores={chance=21,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 45


scoreboard players set @e[scores={chance=22,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 56


scoreboard players set @e[scores={chance=23,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 75


scoreboard players set @e[scores={chance=24,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 31



effect @e[scores={chance=25,Stun=0,move=15},family=gojo,tag=gojo_function,c=16] slowness 1 2 true
scoreboard players set @e[scores={chance=25,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 45


scoreboard players set @e[scores={chance=26,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] Disabled 100
scoreboard players set @e[scores={chance=26,Stun=0,move=1..},family=gojo,tag=gojo_function,c=16] ability2 2000


execute as @e[scores={chance=27,Stun=0,move=25..49},type=ds:student_gojo2,c=16] at @s run effect @e[r=64,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!lightning_bolt,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame] slow_falling 1 30 true
execute as @e[scores={chance=27,Stun=0,move=17..49},type=ds:student_gojo2,c=16] at @s run scriptevent ds:knockback -0.2
scoreboard players set @e[scores={chance=27,Stun=0,move=1..,levitate=0..9},type=ds:student_gojo2,c=16] levitate 10
scoreboard players set @e[scores={chance=27,Stun=0,move=1..},type=ds:student_gojo2,c=16] Disabled 100
scoreboard players set @e[scores={chance=27,Stun=0,move=1..},type=ds:student_gojo2,c=16] ability3 2000


scoreboard players set @e[scores={chance=28,Stun=0,move=1..},type=ds:student_gojo2,c=16] Disabled 125
scoreboard players set @e[scores={chance=28,Stun=0,move=1..},type=ds:student_gojo2,c=16] ability4 6000


scoreboard players set @e[scores={chance=29,Stun=0,move=1..},type=ds:student_gojo2,c=16] Disabled 125
scoreboard players set @e[scores={chance=29,Stun=0,move=1..},type=ds:student_gojo2,c=16] ability4 6000



#-----moves-----

execute as @e[scores={chance=3,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function bosses/finger_bearer/punch1
execute as @e[scores={chance=4,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function hr/deadly_strike
execute as @e[scores={chance=5,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function fighting/basic/rush
execute as @e[scores={chance=6,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function hr/hr1
execute as @e[scores={chance=7,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/shockwave_punch
execute as @e[scores={chance=8..9,move=1..},tag=bluefist,family=gojo,tag=gojo_function,c=16] at @s run function limitless/bluefists
execute as @e[scores={chance=8..9,move=1..},tag=!bluefist,family=gojo,tag=gojo_function,c=16] at @s run function mobs/sorcerers/student_gojo/blue_m1s
execute as @e[scores={chance=10,move=1..},type=ds:student_gojo2,c=16] at @s run function limitless/limitless3
execute as @e[scores={chance=11,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function fighting/yuji/divergent_strike
execute as @e[scores={chance=12,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function bosses/finger_bearer/punch2

execute as @e[scores={chance=19,move=1..},type=ds:student_gojo2,c=16] at @s run function mobs/sorcerers/student_gojo/high
execute as @e[scores={chance=20,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/bluefists
#spatial
execute as @e[scores={chance=21,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless4
execute as @e[scores={chance=22,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless4b
execute as @e[scores={chance=23,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless4c
#blues
execute as @e[scores={chance=24,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless2c
execute as @e[scores={chance=25,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless2
#max
execute as @e[scores={chance=26,move=1..},family=gojo,tag=gojo_function,c=16] at @s run function limitless/limitless2b
execute as @e[scores={chance=27,move=1..},type=ds:student_gojo2,c=16] at @s run function limitless/limitless3c
execute as @e[scores={chance=28,move=1..},type=ds:student_gojo2,c=16] at @s run function limitless/limitless5
execute as @e[scores={chance=29,move=1..},type=ds:student_gojo2,c=16] at @s run function mobs/sorcerers/student_gojo/levitate_purple



scoreboard players random @e[scores={high=1..,thezone=1..,blackflashchance=100..},type=ds:student_gojo2,c=16] blackflashchance 1 99
scoreboard players random @e[scores={high=1..,thezone=0,blackflashchance=200..},type=ds:student_gojo2,c=16] blackflashchance 1 199



tag @e[scores={move=1..2},tag=bluefist,family=gojo,tag=gojo_function,c=16] remove bluefist
scoreboard players set @e[scores={move=1..2,chance=1..},family=gojo,tag=gojo_function,c=16] chance 0
tag @e[tag=dodge_red,family=gojo,tag=gojo_function,c=16] remove dodge_red
tag @e[tag=hasTRG,family=gojo,tag=gojo_function,c=16] remove hasTRG