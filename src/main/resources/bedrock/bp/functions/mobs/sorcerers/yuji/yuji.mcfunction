tag @s[tag=!hasTRG] add hasTRG



#This is to make yuji to use backflip to approach target
scoreboard players set @s[scores={DashCD=!0}] DashCD 0

execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0,DashCD=!-201},rxm=-25,rx=25] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,r=200,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion] facing entity @e[tag=target,tag=!unselect,rm=7.5,r=90,c=1] feet rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^1 air if block ^^1^1 air if block ^^^2 air if block ^^1^2 air if block ^^^3 air if block ^^1^3 air if block ^^^4 air if block ^^1^4 air if block ^^^5 air if block ^^1^5 air if block ^^^6 air if block ^^1^6 air run scoreboard players set @s DashCD -201
execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0,DashCD=!-201},rxm=-25,rx=25,tag=simpledomain_protecting] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=ChimeraGarden1] facing entity @e[tag=target,tag=!unselect,rm=7.5,r=90,c=1] feet rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^1 air if block ^^1^1 air if block ^^^2 air if block ^^1^2 air if block ^^^3 air if block ^^1^3 air if block ^^^4 air if block ^^1^4 air if block ^^^5 air if block ^^1^5 air if block ^^^6 air if block ^^1^6 air positioned ^^^6 if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s DashCD -201
execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0,DashCD=!-201},rxm=-25,rx=25,tag=simpledomain_protecting] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=ChimeraGarden1] facing entity @e[tag=target,tag=!unselect,rm=7.5,r=90,c=1] feet rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^1 air if block ^^1^1 air if block ^^^2 air if block ^^1^2 air if block ^^^3 air if block ^^1^3 air if block ^^^4 air if block ^^1^4 air if block ^^^5 air if block ^^1^5 air if block ^^^6 air if block ^^1^6 air positioned ^^^6 unless entity @e[type=ds:simple_domain,r=20,tag=shadow_style] if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s DashCD -201

tag @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0},rxm=-25,rx=25,tag=!customDashCD] add customDashCD
execute as @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0},tag=customDashCD] at @s rotated ~ 0 positioned ^^^-45 facing entity @e[tag=target,tag=!unselect,r=45,c=1] eyes rotated ~ 0 positioned as @s run tp @s ~~~ facing ^^^-1
execute as @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0},tag=customDashCD] at @s rotated ~ 0 positioned ^^^45 if entity @e[tag=target,tag=!unselect,r=45,c=1] at @s run tp @s ~~~~180 0
scoreboard players add @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0..5,ability3=0,DashCD_mob=0},tag=customDashCD] Disabled 15
scoreboard players random @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,ability3=0,DashCD_mob=0},tag=customDashCD] ability3 25 40
effect @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=customDashCD] slowness 1 1 true
execute as @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=customDashCD] at @s run function _hitdodge





execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0}] at @s if entity @e[tag=!infinity,r=7.5,tag=target,tag=!unselect] run scoreboard players random @s chance 3 14

execute as @s[scores={Hit=0,hitCD=0,Stun=0,Disabled=6..,move=0,cutscene=0,chance=0,flashstep=0},tag=!hit] at @s if entity @e[tag=!infinity,r=2.25,tag=target,tag=!unselect] run tag @s add hit
scoreboard players random @s[scores={Hit=0,hitCD=0,Stun=0,Disabled=6..,move=0,cutscene=0,chance=0,flashstep=0},tag=hit] chance 1 2

scoreboard players random @s[scores={chance=1..2,thezone=0},tag=hit] hitCD 2 3
scoreboard players set @s[scores={chance=1..2,thezone=1..},tag=hit] hitCD 2
execute as @s[scores={chance=1..2},tag=hit] run function m1



#moves------
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=!14,blackflash_amount=1..,ability4=0},has_property={property:yuji_face=3},tag=!confiscation] at @s positioned ^^^2 if entity @e[tag=!Frames,tag=target,tag=!unselect,r=1.95,c=1,family=!grade4,family=!grade3] run scoreboard players set @s chance 14


#prevent yuji from use manji kick on stunned mob or player
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=3}] at @s unless entity @e[tag=!infinity,tag=target,tag=!unselect,scores={Stun=21..},r=10] unless entity @e[tag=!infinity,tag=target,tag=!unselect,scores={Stun=5..,Hit=0},r=10] unless entity @a[tag=!infinity,tag=target,tag=!unselect,scores={Stun=5..},r=10] run scoreboard players set @s move 16


execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=4},tag=undying] at @s unless block ~~-0.2~ air if entity @e[tag=!infinity,tag=target,tag=!unselect,r=4,c=1] run scoreboard players set @s move 16

execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=5}] at @s positioned ^^^4.5 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=2.45,c=1] run scoreboard players set @s move 19


#this is to make it so yuji faces the right entity when he use triple kick, and also prevent yuji run out from the simple domain
scoreboard players set @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=6},tag=!simpledomain_protecting] move 16
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=6},tag=simpledomain_protecting] at @s at @e[tag=!infinity,tag=target,tag=!unselect,r=13.5,c=1] if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 16
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=6},tag=simpledomain_protecting] at @s at @e[tag=!infinity,tag=target,tag=!unselect,r=13.5,c=1] unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 16
tp @s[scores={chance=6,Stun=0,move=15..16}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


#prevent yuji run out from the simple domain
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=7,ability2=0},tag=!simpledomain_protecting] at @s positioned ^^^7 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=3.5,c=1] run scoreboard players set @s move 23
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=7,ability2=0},tag=simpledomain_protecting] at @s positioned ^^^7 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=3.5,c=1] if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 23
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=7,ability2=0},tag=simpledomain_protecting] at @s positioned ^^^7 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=3.5,c=1] unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 23


#this is to make it so yuji faces the right entity when he use fierce barrage, and also prevent yuji run out from the simple domain
scoreboard players set @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=8},tag=!simpledomain_protecting] move 51
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=8},tag=simpledomain_protecting] at @s at @e[tag=!infinity,tag=target,tag=!unselect,r=18.5,c=1] if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 51
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=8},tag=simpledomain_protecting] at @s at @e[tag=!infinity,tag=target,tag=!unselect,r=18.5,c=1] unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 51
tp @s[scores={chance=8,Stun=0,move=50..51}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


#this is to make it so yuji faces the right entity when he use divergent strike
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=9,ability1=0},tag=!confiscation] at @s positioned ^^^3 if entity @e[tag=target,tag=!unselect,r=3.45,family=!grade4,family=!grade3] run scoreboard players set @s move 26
tp @s[scores={chance=9,Stun=0,move=19..20}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]


execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=10},tag=undying] at @s positioned ^^^2.6 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=2.55,c=1] run scoreboard players set @s move 61


scoreboard players set @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=11}] move 26


#enrage moves
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=12},tag=undying,tag=!simpledomain_protecting] at @s positioned ^^^2 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=1.95,c=1] run scoreboard players set @s move 46
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=12},tag=undying,tag=simpledomain_protecting] at @s positioned ^^^2 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=1.95,c=1] at @s positioned ^^^7.5 if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 46
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=12},tag=undying,tag=simpledomain_protecting] at @s positioned ^^^2 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=1.95,c=1] at @s positioned ^^^7.5 unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 46


#this is to make it so yuji faces the right entity when he use deadly pursuit
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=13},tag=undying,tag=!confiscation] at @s positioned ^^^2.5 if entity @e[tag=!infinity,tag=target,tag=!unselect,r=2.45,c=1] run scoreboard players set @s move 16
tp @s[scores={chance=13,Stun=0,move=999..1000}] ~~~ facing @e[tag=target,tag=!unselect,c=1]


#this is to make that yuji only uses this ability when he already land a black flash, in order to balance
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=14,blackflash_amount=1..,ability4=0},has_property={property:yuji_face=3},tag=!confiscation] at @s positioned ^^^2 if entity @e[tag=!Frames,tag=target,tag=!unselect,r=1.95,c=1,family=!grade4,family=!grade3] run scoreboard players set @s move 16




