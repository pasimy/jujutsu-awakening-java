tag @s[tag=!hasTRG] add hasTRG



execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,knockdown=0,Flourish=0,high=2..,ability3=0,nocts=0},tag=!Frames,tag=!customDashCD,tag=!dodge_red,type=ds:student_gojo2] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=toji,tag=toji_function,scores={EnergyCap=0}] unless entity @e[tag=target,tag=!unselect,r=100,c=1,scores={cutscene=1..}] run tag @s add dodge_red

execute as @s[scores={combat=1..},type=ds:student_gojo2,tag=relax] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=special_grade] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade1] unless entity @a[tag=target,tag=!unselect,r=100,c=1] run tag @s remove relax
execute if entity @e[tag=target,tag=!unselect,r=100,c=1] run scoreboard players set @s[scores={combat=0..200}] combat 800

execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0},tag=!relax] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1] run effect @s slowness 1 1 true
execute if entity @e[tag=target,tag=!unselect,rm=30,r=100,c=1] run effect @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0},tag=!relax] speed 3 0 true
execute if entity @e[tag=target,tag=!unselect,r=5,c=1] run effect @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,infinity=1..,Frames=1..},tag=Frames,tag=!relax] slowness 1 1 true





execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,combat=1..}] at @s if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=7.5,c=1] run scoreboard players random @s chance 3 12
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,combat=1..}] at @s if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,rm=7.5,r=30,c=1] run scoreboard players random @s chance 19 27
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,combat=1..}] at @s if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,rm=30,r=90,c=1] run scoreboard players random @s chance 26 29

scoreboard players set @s[scores={detect_health=0..100,Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,chance=!29,ability4=0},type=ds:student_gojo2] chance 29
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,chance=29,ability4=0},type=ds:student_gojo2] at @s if entity @e[tag=target,tag=!unselect,r=17.5,c=1] run scoreboard players set @s chance 28
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=0,chance=28,ability4=0},type=ds:student_gojo2] at @s unless entity @e[tag=target,tag=!unselect,r=17.5,c=1] run scoreboard players set @s chance 29



execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=0,chance=0,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^1.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=1.8,c=1,tag=!Big] run scoreboard players set @s ability7 200
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=200,chance=0,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^1.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=1.8,c=1,tag=!Big] run scoreboard players random @s chance 1 2
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=200,chance=1..2,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^1.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=1.8,c=1,tag=!Big] run scoreboard players set @s move 23
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=0,chance=0,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^3.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=4.849,c=1,tag=Big] run scoreboard players set @s ability7 200
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=200,chance=0,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^3.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=4.849,c=1,tag=Big] run scoreboard players random @s chance 1 2
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,ability7=200,chance=1..2,combat=1..,bluefist=24..,nocts=0},tag=!relax] at @s positioned ^^^3.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=4.849,c=1,tag=Big] run scoreboard players set @s move 23

execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,chance=0,combat=1..},tag=!relax] if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.25,c=1] run scoreboard players random @s chance 1 2
execute as @s[scores={Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,Disabled=6..,hitCD=0,chance=1..2,combat=1..},tag=!relax] if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.25,c=1] run tag @s add hit

scoreboard players random @s[scores={chance=1..2},tag=hit] hitCD 2 3
execute as @s[scores={chance=1..2},tag=hit] run function m1



#rct
execute as @s[type=ds:student_gojo2,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..240,rctuses=0..799,Energy=2..},tag=!rctCD] at @s unless entity @e[tag=target,tag=!unselect,r=10,c=1] run effect @s slowness 1 3 true
execute as @s[type=ds:student_gojo2,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..240,rctuses=0..799,Energy=2..},tag=!rctCD] at @s unless entity @e[tag=target,tag=!unselect,r=10,c=1] run scoreboard players add @s reversecursedCD 8
execute as @s[type=ds:student_gojo2,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=6..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,rct=0..150,reversecursedCD=0..248,rctuses=0..799,Energy=2..},tag=!rctCD] at @s unless entity @e[tag=target,tag=!unselect,r=10,c=1] run scoreboard players add @s rct 6
execute as @s[type=ds:student_gojo2,scores={dying=0,Stun=0,combat=1..,Hit=0,Disabled=5..,move=0,cutscene=0,flashstep=0,chance=0,detect_health=61..225,reversecursedCD=241..,rctuses=0..799,Energy=2..},tag=!rctCD] at @s unless entity @e[tag=target,tag=!unselect,r=10,c=1] run tag @s add rctCD



#-----melee-----


execute as @s[scores={chance=3,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^3 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.95,c=1] run scoreboard players set @s move 26


execute as @s[scores={chance=4,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^3.75 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=3.7,c=1] run scoreboard players set @s move 26


execute as @s[scores={chance=5,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!simpledomain_protecting,rxm=-30,rx=30,tag=!relax] at @s unless block ~~-0.2~ air at @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,family=!small,r=14,c=1] unless block ~~-0.2~ air run scoreboard players set @s move 31
execute as @s[scores={chance=5,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=simpledomain_protecting,rxm=-30,rx=30,tag=!relax] at @s unless block ~~-0.2~ air facing entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,family=!small,r=14,c=1] feet positioned as @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,family=!small,r=14,c=1] unless block ~~-0.2~ air positioned ^^^-1.5 if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 31
execute as @s[scores={chance=5,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=simpledomain_protecting,rxm=-30,rx=30,tag=!relax] at @s unless block ~~-0.2~ air facing entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,family=!small,r=14,c=1] feet positioned as @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,family=!small,r=14,c=1] unless block ~~-0.2~ air positioned ^^^-1.5 unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 31
tp @s[scores={chance=5,Stun=0,move=28..29}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


execute as @s[scores={chance=6,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^2.5 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.45,c=1] run scoreboard players set @s move 19


execute as @s[scores={chance=7,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^6.25 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=6.2,c=1] run scoreboard players set @s move 21


execute as @s[scores={chance=8..9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,infinity=1..,Frames=1..,nocts=0},tag=Frames,tag=!bluefist,tag=!relax] at @s unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,hasitem={item=ds:inverted_spear,location=slot.weapon.mainhand},scores={strength=20..}] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,hasitem={item=ds:inverted_spear,location=slot.weapon.mainhand},scores={damageadd=4..}] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,hasitem={item=ds:inverted_spear,location=slot.hotbar},scores={strength=20..}] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,hasitem={item=ds:inverted_spear,location=slot.hotbar},scores={damageadd=4..}] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,scores={strength=20..,domainamp=1..}] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,scores={damageadd=4..,domainamp=1..}] run tag @s add bluefist
execute as @s[scores={chance=8..9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,nocts=0},tag=!bluefist,tag=!relax] unless entity @s[scores={infinity=1..,Frames=1..},tag=Frames] at @s unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,scores={strength=20..,Stun=0..10,Move=0..10,Disabled=0..10},tag=!heavenlyrestriction] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,scores={damageadd=4..,Stun=0..10,Move=0..10,Disabled=0..10},tag=!heavenlyrestriction] unless entity @e[tag=target,tag=!unselect,r=7.5,c=1,scores={damageadd=4..,Move=0..30,Disabled=0..30},tag=heavenlyrestriction] run tag @s add bluefist
scoreboard players set @s[scores={chance=8..9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0},tag=bluefist,tag=!relax] move 21
execute as @s[scores={chance=8..9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=24..,nocts=0},tag=!bluefist,tag=!relax] at @s positioned ^^^1.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=1.8,c=1,tag=!Big] run scoreboard players set @s move 23
execute as @s[scores={chance=8..9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=24..,nocts=0},tag=!bluefist,tag=!relax] at @s positioned ^^^3.85 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=4.849,c=1,tag=Big] run scoreboard players set @s move 23
execute as @s[scores={chance=8..9,Stun=0,move=1..},tag=bluefist] at @s unless entity @e[tag=target,tag=!unselect,r=5,c=1] run effect @s speed 2 1 true


execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability6=0,nocts=0},type=ds:student_gojo2] at @s if block ~~~ air if block ~~-1~ air if block ~~-2~ air run scoreboard players set @s move 41


execute as @s[scores={chance=11,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^2.5 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.45,c=1] run scoreboard players set @s move 26
tp @s[scores={chance=11,Stun=0,move=19..20}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


execute as @s[scores={chance=12,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!relax] at @s positioned ^^^3 if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=2.95,c=1] run scoreboard players set @s move 36


#-----ranged-----


execute as @s[scores={chance=19,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,ability8=0,nocts=0},type=ds:student_gojo2] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 51
execute as @s[scores={chance=19,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,ability8=0,nocts=0},tag=domainimmune,type=ds:student_gojo2] at @s if entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 51
execute as @s[scores={chance=19,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,ability8=0,nocts=0},tag=domainimmune,type=ds:student_gojo2] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] if entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion,r=200] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 51


execute as @s[scores={chance=20,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,bluefist=0,nocts=0},tag=!relax] at @s if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=14,c=1] run scoreboard players set @s move 21


execute as @s[scores={chance=21,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=!relax] at @s if entity @e[tag=!infinity,tag=!countering,tag=target,tag=!unselect,r=25,c=1] run scoreboard players set @s move 16
tp @s[scores={chance=21,Stun=0,move=9..10}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=21,Stun=0,move=5..6}] positioned ^^^50 if entity @e[tag=target,tag=!unselect,r=50,c=1] at @s run tp @s ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


scoreboard players set @s[scores={chance=22,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=!relax] move 16


scoreboard players set @s[scores={chance=23,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=!simpledomain_protecting,tag=!relax] move 36
execute as @s[scores={chance=23,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=simpledomain_protecting,tag=!relax] at @s at @e[tag=!Frames,tag=target,tag=!unselect,r=50,c=1] rotated ~ 0 positioned ^0.3^0.4^-1 if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 36
execute as @s[scores={chance=23,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=simpledomain_protecting,tag=!relax] at @s at @e[tag=!Frames,tag=target,tag=!unselect,r=50,c=1] rotated ~ 0 positioned ^0.3^0.4^-1 unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 36
tp @s[scores={chance=23,Stun=0,move=30..31}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]
tp @s[scores={chance=23,Stun=0,move=25..26}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=23,Stun=0,move=25}] at @s run tag @e[tag=target,tag=!unselect,r=60,c=1,tag=!Frames,family=!flyhead,type=!ds:leech_curse,type=!ds:kiss_fish,type=!ds:ember_insect,type=!ds:centipede_curse,tag=!warp] add warp


scoreboard players set @s[scores={chance=24,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=!relax] move 21
tp @s[scores={chance=24,Stun=0,move=13..14},tag=!relax] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]



execute as @s[scores={chance=25,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,nocts=0},tag=!relax] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 15


execute as @s[scores={chance=26,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability2=0,nocts=0},tag=!relax] at @s if entity @e[tag=target,tag=!unselect,rm=10,r=26.5,c=1] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] run scoreboard players set @s move 141
tp @s[scores={chance=26,Stun=0,move=100..101}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


execute as @s[scores={chance=27,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability3=0,nocts=0},type=ds:student_gojo2] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=toji,tag=toji_function,scores={EnergyCap=0}] unless entity @e[tag=target,tag=!unselect,r=100,c=1,scores={cutscene=1..}] run scoreboard players set @s move 51
execute as @s[scores={chance=27,Stun=0,move=49},type=ds:student_gojo2] at @s at @e[tag=target,tag=!unselect,r=100,c=1] rotated ~ 0 if block ^^1^-3.5 air if block ^^2^-3.5 air run tp @s ^^1^-3.5 facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=27,Stun=0,move=49},type=ds:student_gojo2] at @s at @e[tag=target,tag=!unselect,r=100,c=1] rotated ~ 0 if block ^^1^-3.5 water if block ^^2^-3.5 water run tp @s ^^1^-3.5 facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=27,Stun=0,move=49},type=ds:student_gojo2] at @s at @e[tag=target,tag=!unselect,r=100,c=1] rotated ~ 0 positioned ^^^-3.5 unless entity @s[r=1] run spreadplayers ~~ 0 1 @s
execute as @s[scores={chance=27,Stun=0,move=49},type=ds:student_gojo2] at @s run tp @s ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=27,Stun=0,move=15..16},type=ds:student_gojo2] unless entity @s[rxm=-25,rx=25] at @s run tp @s ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]
execute as @s[scores={chance=27,Stun=0,move=15..16},type=ds:student_gojo2,rxm=-25,rx=25] at @s facing entity @e[tag=target,tag=!unselect,r=100,c=1] feet rotated ~ 0 run tp @s ~~~ facing ^^^100
execute as @s[scores={chance=27,Stun=0,move=35..49},type=ds:student_gojo2] at @s run scoreboard players set @e[tag=target,tag=!unselect,r=100,c=1] Stun 35
execute as @s[scores={chance=27,Stun=0,move=35..49},type=ds:student_gojo2] at @s run scoreboard players set @e[tag=target,tag=!unselect,r=100,c=1] Camera 35
execute as @s[scores={chance=27,Stun=0,move=35..49},type=ds:student_gojo2] at @s run scoreboard players set @e[tag=target,tag=!unselect,r=100,c=1,scores={move=0..,cutscene=0..}] Move 25
execute as @s[scores={chance=27,Stun=0,move=11..49},type=ds:student_gojo2] at @s run tag @e[tag=target,tag=!unselect,r=100,c=1,type=!player,scores={Move=1..,move=0..,cutscene=0..},tag=!unlimited_hit] add unlimited_hit
execute as @s[scores={chance=27,Stun=0,move=25..49},type=ds:student_gojo2] at @s run effect @e[tag=target,tag=!unselect,r=100,c=1,type=!player] slowness 1 30 true
execute as @s[scores={chance=27,Stun=0,move=25..49},type=ds:student_gojo2] at @s run effect @a[tag=target,tag=!unselect,r=100,c=1] slowness 1 1 true


execute as @s[scores={chance=28,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability4=0,nocts=0},type=ds:student_gojo2] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade2] run scoreboard players set @s move 101


execute as @s[scores={chance=29,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,ability4=0,nocts=0},type=ds:student_gojo2] at @s unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade4] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade3] unless entity @e[tag=target,tag=!unselect,r=100,c=1,family=grade2] run scoreboard players set @s move 120

execute as @s[scores={chance=28..29,move=1..100},type=ds:student_gojo2] at @s run effect @e[tag=target,tag=!unselect,r=100,c=1,type=!player] slowness 1 1 true
execute as @s[scores={chance=28..29,move=1..100},type=ds:student_gojo2] at @s run tp @s ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]