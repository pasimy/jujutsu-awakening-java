tag @s[tag=!hasTRG] add hasTRG





scoreboard players set @s[scores={DashCD=!0}] DashCD 0

execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD=!-201,DashCD_mob=0},tag=!ability1CD] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55] unless entity @e[family=damage,family=projectile,family=boss,r=200,scores={EnergyCap=0..,Energy=0..,energystat=0..},tag=DomainExpansion] at @e[tag=target,tag=!unselect,r=7.5,c=1,family=!grade4,family=!grade3] unless entity @e[tag=target,tag=!unselect,r=0.15,c=1,family=!grade4,family=!grade3,scores={Stun=10..}] at @s rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^-1 air if block ^^1^-1 air if block ^^^-2 air if block ^^1^-2 air if block ^^^-3 air if block ^^1^-3 air positioned ^^^-6 run scoreboard players set @s DashCD -201
execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD=!-201,DashCD_mob=0},tag=!ability1CD,tag=simpledomain_protecting] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=ChimeraGarden1] at @e[tag=target,tag=!unselect,r=7.5,c=1,family=!grade4,family=!grade3] unless entity @e[tag=target,tag=!unselect,r=0.15,c=1,family=!grade4,family=!grade3,scores={Stun=10..}] at @s rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^-1 air if block ^^1^-1 air if block ^^^-2 air if block ^^1^-2 air if block ^^^-3 air if block ^^1^-3 air positioned ^^^-6 if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s DashCD -201
execute as @s[scores={Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD=!-201,DashCD_mob=0},tag=!ability1CD,tag=simpledomain_protecting] at @s unless entity @e[family=projectile,tag=DomainExpansion,r=55,name=ChimeraGarden1] at @e[tag=target,tag=!unselect,r=7.5,c=1,family=!grade4,family=!grade3] unless entity @e[tag=target,tag=!unselect,r=0.15,c=1,family=!grade4,family=!grade3,scores={Stun=10..}] at @s rotated ~ 0 unless block ~~-0.2~ air if block ~~~ air if block ~~1~ air if block ^^^-1 air if block ^^1^-1 air if block ^^^-2 air if block ^^1^-2 air if block ^^^-3 air if block ^^1^-3 air positioned ^^^-6 unless entity @e[type=ds:simple_domain,r=20,tag=shadow_style] if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s DashCD -201

tag @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD_mob=0},tag=!ability1CD,tag=!customDashCD] add customDashCD
execute as @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] at @s facing entity @e[tag=target,tag=!unselect,r=100,c=1] eyes rotated ~ 0 run tp @s ~~~ facing ^^^1
scoreboard players add @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,Disabled=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] Disabled 10
scoreboard players random @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] DashCD 25 35
scoreboard players operation @s[scores={DashCD=20..35,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] ability1 += @s DashCD
scoreboard players set @s[scores={DashCD=20..35,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] DashCD -201
effect @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] slowness 1 3 true
execute as @s[scores={DashCD=-201,Hit=0,flashstep=0,Stun=0,Move=0,move=0,cutscene=0,DashCD_mob=0},tag=!ability1CD,tag=customDashCD] at @s run function _hitdodge





execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,combat=1..}] at @s if entity @e[tag=!infinity,tag=!countering,r=5,c=1,tag=target,tag=!unselect] run scoreboard players random @s chance 3 4

execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,combat=1..},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0}] at @s if entity @e[tag=!infinity,rm=5,r=14,c=1,tag=target,tag=!unselect] run scoreboard players random @s chance 5 10
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,combat=1..},hasitem={item=ds:megaphone,location=slot.weapon.mainhand}] at @s if entity @e[tag=!infinity,rm=5,r=50,c=1,tag=target,tag=!unselect] run scoreboard players random @s chance 5 10



execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts] at @s unless entity @e[tag=shikigami,r=50,c=1,tag=!spectator] positioned ^^^7.05 at @e[family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=6.99,c=1] unless entity @e[tag=shikigami,r=50,c=1,tag=!spectator] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts] at @s if entity @e[tag=shikigami,tag=target,tag=!unselect] positioned ^^^7.05 at @e[family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=6.99,c=1] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts] at @s positioned ^^^7.05 if entity @e[tag=target,family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=6.99,c=1] run scoreboard players set @s chance 99

execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts] at @s positioned ^^^7.05 if entity @e[tag=target,family=shikigami_other,type=!ds:bag_head,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,r=6.99,c=1] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts] at @s positioned ^^^7.05 if entity @e[type=ds:bag_head,tag=bagclone,tag=!unselect,r=6.99,c=1] run scoreboard players set @s chance 99



execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts] at @s unless entity @e[tag=shikigami,r=50,c=1,tag=!spectator] positioned ^^^25 at @e[family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=24.9,c=1] unless entity @e[tag=shikigami,r=50,c=1,tag=!spectator] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts] at @s if entity @e[tag=shikigami,tag=target,tag=!unselect] positioned ^^^25 at @e[family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=24.9,c=1] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts] at @s positioned ^^^25 if entity @e[tag=target,family=shikigami,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,family=!mahoraga,type=!ds:agito,r=24.9,c=1] run scoreboard players set @s chance 99

execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts] at @s positioned ^^^25 if entity @e[tag=target,family=shikigami_other,type=!ds:bag_head,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,r=24.9,c=1] run scoreboard players set @s chance 99
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0,chance=1..98},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts] at @s positioned ^^^25 if entity @e[type=ds:bag_head,tag=bagclone,tag=!unselect,r=24.9,c=1] run scoreboard players set @s chance 99



execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0,Disabled=6..,chance=0,combat=1..}] if entity @e[tag=!infinity,r=2.25,c=1,tag=target,tag=!unselect] run scoreboard players random @s chance 1 2
execute as @s[scores={cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0,Disabled=6..,chance=0,combat=1..},tag=!hit] if entity @e[tag=!infinity,r=2.25,c=1,tag=target,tag=!unselect] run tag @s add hit

scoreboard players random @s[scores={chance=1..2},tag=hit] hitCD 2 5
execute as @s[scores={chance=1..2},tag=hit] run function m1


#------------
execute as @s[scores={chance=3,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0}] at @s if entity @e[tag=!infinity,r=4,c=1,tag=target,tag=!unselect] run scoreboard players set @s move 21

execute as @s[scores={chance=4,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!simpledomain_protecting] at @s if entity @e[tag=!infinity,r=14,c=1,tag=target,tag=!unselect,family=!small] run scoreboard players set @s move 31
execute as @s[scores={chance=4,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=simpledomain_protecting] at @s facing entity @e[tag=!infinity,r=14,c=1,tag=target,tag=!unselect,family=!small] feet rotated ~ 0 positioned as @e[tag=!infinity,r=14,c=1,tag=target,tag=!unselect,family=!small] positioned ^^^-1.5 if entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run scoreboard players set @s move 31
execute as @s[scores={chance=4,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=simpledomain_protecting] at @s facing entity @e[tag=!infinity,r=14,c=1,tag=target,tag=!unselect,family=!small] feet rotated ~ 0 positioned as @e[tag=!infinity,r=14,c=1,tag=target,tag=!unselect,family=!small] positioned ^^^-1.5 unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] if entity @e[type=ds:simple_domain,r=20,tag=shadow_style] run scoreboard players set @s move 31
tp @s[scores={chance=4,Stun=0,move=28..29}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#dontmove
scoreboard players set @s[scores={chance=5,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 31
tp @s[scores={chance=5,Stun=0,move=20..21}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#break
scoreboard players set @s[scores={chance=6,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 26
tp @s[scores={chance=6,Stun=0,move=20..21}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#blastaway
scoreboard players set @s[scores={chance=7,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 51
tp @s[scores={chance=7,Stun=0,move=30..31}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#getcrushed
scoreboard players set @s[scores={chance=8,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 31
tp @s[scores={chance=8,Stun=0,move=20..21}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#plummet
scoreboard players set @s[scores={chance=9,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 71
tp @s[scores={chance=9,Stun=0,move=40..41}] ~~~ facing @e[tag=target,tag=!unselect,r=100,c=1]

#runaway
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=special_grade,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..3}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..3}] run scoreboard players set @s move 31
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=grade1,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..2}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..2}] run scoreboard players set @s move 31
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=grade2,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}] run scoreboard players set @s move 31
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=special_grade,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..3}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=..3}] run scoreboard players set @s move 31
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=grade1,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=..2}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=..2}] run scoreboard players set @s move 31
execute as @s[scores={chance=10,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!nocts,tag=!simpledomain_protecting,tag=!curse,tag=!sukuna] at @s unless entity @e[family=projectile,r=55,tag=DomainExpansion] unless entity @e[family=damage,family=projectile,family=boss,scores={EnergyCap=0..,Energy=0..,energystat=0..},r=200,tag=DomainExpansion] at @e[type=!player,family=grade2,tag=target,tag=!unselect,r=50,c=1] if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}] at @s if entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=1}] run scoreboard players set @s move 31
tp @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0}] ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}]
execute as @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0}] at @s unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}] run tp @s ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=2}]
execute as @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0}] at @s unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=1}] unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=2}] run tp @s ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=14,c=1,tag=!target,tag=!unselect,scores={grade=3}]
tp @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand}] ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=1}]
execute as @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand}] at @s unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=1}] run tp @s ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=2}]
execute as @s[scores={chance=10,Stun=0,move=20..21},hasitem={item=ds:megaphone,location=slot.weapon.mainhand}] at @s unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=1}] unless entity @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=2}] run tp @s ~~~ facing @a[tag=!curse,tag=!sukuna,tag=!infinity,r=50,c=1,tag=!target,tag=!unselect,scores={grade=3}]

#return
scoreboard players set @s[scores={chance=99,cutscene=0,Hit=0,flashstep=0,Disabled=0,Stun=0,move=0},tag=!nocts] move 31



tag @s[tag=hasTRG] remove hasTRG
