execute as @e[type=ds:yuji_itadori,c=16] unless entity @s[scores={Energy=0..}] run scoreboard players add @s Energy 0
execute as @e[scores={Energy=0},type=ds:yuji_itadori,c=16] unless entity @s[scores={guilty_score=666..}] run scoreboard players set @s guilty_score 666
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] chance 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] hitCD 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] DashCD_mob 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Stun 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] move 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Move 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Camera 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Disabled 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] endurance 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] cutscene 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Flourish 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] knockdown 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Hit 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] DashCD 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] hitdodge 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] flashstep 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] blackflash_amount 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] blackflashcount 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] enrage 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] insanity 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] insanityCD 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] antiheal 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] ability1 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] ability2 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] ability3 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] ability4 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] damageadd 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] damageinsurance 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] strength 0
scoreboard players add @e[scores={Energy=0},type=ds:yuji_itadori,c=16] punch 0
scoreboard players set @e[scores={Energy=0,damageadd=0},type=ds:yuji_itadori,c=16] damageadd 7
scoreboard players set @e[scores={Energy=0,damageinsurance=0},type=ds:yuji_itadori,c=16] damageinsurance 7
scoreboard players set @e[scores={Energy=0,strength=0},type=ds:yuji_itadori,c=16] strength 36
scoreboard players set @e[scores={Energy=0,punch=0},tag=!punch0,type=ds:yuji_itadori,c=16] punch 1
execute as @e[scores={Energy=0},type=ds:yuji_itadori,c=16] unless entity @s[scores={blackflashlearn=1..}] run scoreboard players set @s blackflashlearn 1
tag @e[scores={Energy=0},type=ds:yuji_itadori,c=16,tag=!has_sukuna] add has_sukuna
tag @e[scores={Energy=0},type=ds:yuji_itadori,c=16,tag=!soul_learned] add soul_learned
tag @e[scores={Energy=0},type=ds:yuji_itadori,c=16,tag=!basic_behavior] add basic_behavior
scoreboard players set @e[scores={Energy=0},type=ds:yuji_itadori,c=16] Energy 2400

tag @e[scores={blackflash_amount=1..},type=ds:yuji_itadori,c=16,tag=!undying] add undying
scoreboard players remove @e[scores={thezone=1..,ability1=2..},type=ds:yuji_itadori,c=16] ability1 2
scoreboard players remove @e[scores={thezone=1..,ability3=1..},type=ds:yuji_itadori,c=16] ability3 1
scoreboard players remove @e[scores={thezone=1..,Disabled=1..},type=ds:yuji_itadori,c=16] Disabled 1
scoreboard players add @e[scores={thezone=3..,damageadd=7},type=ds:yuji_itadori,c=16] damageadd 2
scoreboard players add @e[scores={thezone=3..,damageadd=7},type=ds:yuji_itadori,c=16] damageinsurance 2
scoreboard players add @e[scores={thezone=3..,damageadd=2},type=ds:yuji_itadori,c=16] damageadd 2
scoreboard players add @e[scores={thezone=3..,damageadd=2},type=ds:yuji_itadori,c=16] damageinsurance 2
scoreboard players remove @e[scores={damageadd=2..,thezone=1},type=ds:yuji_itadori,c=16] damageadd 2
scoreboard players remove @e[scores={damageinsurance=2..,thezone=1},type=ds:yuji_itadori,c=16] damageinsurance 2





scoreboard players set @e[scores={DashCD=!0},type=ds:yuji_itadori,c=16] DashCD 0
execute as @e[scores={Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] positioned ^^^-3 facing entity @s feet positioned as @s rotated ~180 ~180 positioned ^^^3 as @e[scores={atk=1..},r=2.95,tag=!unselect] unless entity @s[family=todo,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] positioned ^^^-3 run scoreboard players random @e[scores={Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=1,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16,tag=!sukuna,tag=!rogue_sorcerer,tag=curse] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] positioned ^^^-3 facing entity @s feet positioned as @s rotated ~180 ~180 positioned ^^^3 as @e[scores={atk=1..},r=2.95,tag=!unselect] unless entity @s[family=todo,tag=!sukuna,tag=!rogue_sorcerer,tag=curse] positioned ^^^-3 run scoreboard players random @e[scores={Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=1,tag=!sukuna,tag=!rogue_sorcerer,tag=curse] DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=arrow,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=thrown_trident,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=small_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=dragon_fireball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=fireworks_rocket,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=fishing_hook,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=ender_pearl,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=splash_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=lingering_potion,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[type=area_effect_cloud,r=9] positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0,combat=1..},type=ds:yuji_itadori,c=16] at @s at @e[type=snowball,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0,combat=1..},type=ds:yuji_itadori,c=16] at @s at @e[type=egg,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0,combat=1..},type=ds:yuji_itadori,c=16] at @s at @e[type=xp_bottle,r=9] if block ~~-0.15~ air if block ^^^0.15 air positioned ^^^4.5 if entity @s[r=4.5] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s at @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=6,c=1] positioned ^^^3 if entity @s[r=3] run scoreboard players random @s DashCD 1 10
execute as @e[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] at @s if entity @e[name=!ImaginaryP,name=!HollowP,name=!200HollowP,name=!ImaginaryPTRG2,name=!HollowPTRG,name=!200HollowPTRG,family=projectile,family=!despawncito,family=!motionless,tag=!cube_landed,tag=!wall_landed,tag=!itemdrop,tag=!DomainExpansion,type=!ds:wcs,type=!ds:wcs2,r=6,c=1,scores={atk=1..}] run scoreboard players random @s DashCD 1 10
scoreboard players random @e[scores={DashCD=1..7,Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:yuji_itadori,c=16] DashCD -203 -202
tag @e[scores={DashCD=-203..-202,Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0},tag=!customDashCD,type=ds:yuji_itadori,c=16] add customDashCD
execute as @e[scores={DashCD=-203..-202,Hit=0,flashstep=0,Stun=0..20,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,DashCD_mob=0,DashCD_mob=0},tag=customDashCD,type=ds:yuji_itadori,c=16] at @s run function _hitdodge

execute as @e[scores={Hit=1..2,cutscene=0,Stun=0..20,flashstep=0,move=0,Move=0,knockdown=0,Flourish=0,DashCD_mob=0},tag=!customDashCD,type=ds:yuji_itadori,c=16] at @s run function _hitdodge



event entity @e[scores={detect_health=251..},has_property={property:yuji_face=!0},type=ds:yuji_itadori,c=16] yuji_faceoff
event entity @e[scores={detect_health=176..250},has_property={property:yuji_face=!1},type=ds:yuji_itadori,c=16] yuji_face1
event entity @e[scores={detect_health=76..175},has_property={property:yuji_face=!2},type=ds:yuji_itadori,c=16] yuji_face2
event entity @e[scores={detect_health=0..75},has_property={property:yuji_face=!3},type=ds:yuji_itadori,c=16] yuji_face3
execute as @e[has_property={property:yuji_face=3},tag=undying,type=ds:yuji_itadori,c=16] at @s run function undyingwill





#moves------

scoreboard players set @e[scores={chance=3,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 35


scoreboard players set @e[scores={chance=4,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 35


scoreboard players set @e[scores={chance=5,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 35


scoreboard players set @e[scores={chance=6,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 35


scoreboard players set @e[scores={chance=7,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 40
scoreboard players set @e[scores={chance=7,Stun=0,move=1..,ability2=0},type=ds:yuji_itadori,c=16] ability2 500


scoreboard players set @e[scores={chance=8,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 38


scoreboard players set @e[scores={chance=9,Stun=0,move=1..,ability1=0},type=ds:yuji_itadori,c=16] Disabled 18
scoreboard players set @e[scores={chance=9,Stun=0,move=1..,ability1=0},type=ds:yuji_itadori,c=16] ability1 200


scoreboard players set @e[scores={chance=10,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 25


scoreboard players set @e[scores={chance=11,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 25


#enrage moves
scoreboard players set @e[scores={chance=12,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 25


scoreboard players set @e[scores={chance=13,Stun=0,move=1..},type=ds:yuji_itadori,c=16] Disabled 25


scoreboard players set @e[scores={chance=14,Stun=0,move=1..,Disabled=0..24},type=ds:yuji_itadori,c=16] Disabled 25
scoreboard players set @e[scores={chance=14,move=1..},type=ds:yuji_itadori,c=16] ability4 2400



#-----functions-----

execute as @e[scores={chance=3,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/yuji/manji_kick
execute as @e[scores={chance=4,move=1..},type=ds:yuji_itadori,c=16] at @s run function hr/hr9
execute as @e[scores={chance=5,move=1..},type=ds:yuji_itadori,c=16] at @s run function hr/hr1
execute as @e[scores={chance=6,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/yuji/triple_kick
execute as @e[scores={chance=7,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/yuji/dive_kick
execute as @e[scores={chance=8,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/yuji/fierce_barrage
execute as @e[scores={chance=9,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/yuji/divergent_strike
execute as @e[scores={chance=10,move=1..},type=ds:yuji_itadori,c=16] at @s run function hr/hr7
execute as @e[scores={chance=11,move=1..},type=ds:yuji_itadori,c=16] at @s run function hr/deadly_strike
#enrage
execute as @e[scores={chance=12,move=1..},type=ds:yuji_itadori,c=16] at @s run function fighting/calamity_claws/left_right
execute as @e[scores={chance=13,move=1..},type=ds:yuji_itadori,c=16] at @s run function yuji/deadly_pursuit
execute as @e[scores={chance=14,move=1..},type=ds:yuji_itadori,c=16] at @s run function yuji/vengeance_fists

scoreboard players set @e[scores={move=1..2,chance=1..},type=ds:yuji_itadori,c=16] chance 0
tag @e[tag=hasTRG,type=ds:yuji_itadori,c=16] remove hasTRG
