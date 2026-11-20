tickingarea remove malevolentshrine
execute as @s run tickingarea add ~33 ~ ~33 ~-33 ~ ~-33 malevolentshrine

tag @s[tag=!DomainExpansion] add DomainExpansion


# save people from falling out or flying in

execute positioned ~~-35~ run tp @e[r=34,family=!damage,family=!inanimate,family=!barrier,family=!projectile] ~~38~
scoreboard players set @a[r=60,rm=35,scores={dashCD=0}] DashCD 99
effect @a[r=60,rm=35,scores={dashCD=0}] clear levitation



execute as @a[scores={domainactive=1..,Energy=0..1,domain=0,Disabled=0,Disabled2=0}] at @s run scoreboard players set @e[r=50,c=1,scores={Deleter=32..}] Deleter 31

execute as @s[scores={Deleter=33..}] at @s unless entity @e[tag=sukuna,scores={domainactive=1..},r=55] run scoreboard players set @s Deleter 32

execute as @s[scores={Deleter=1..}] at @s as @e[type=item,r=60] at @s unless entity @e[type=ds:simple_domain,r=20,tag=shadow_style] unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run kill @s
execute as @s[scores={Deleter=1..}] at @s as @e[type=arrow,r=60] at @s unless entity @e[type=ds:simple_domain,r=20,tag=shadow_style] unless entity @e[type=ds:simple_domain,r=10,tag=!shadow_style] run kill @s

execute as @s[scores={Deleter=1..}] at @s run execute as @e[c=1,family=mahoraga,r=50] at @s run function damages/sukuna_domain
execute as @s[scores={Deleter=1..}] at @s run execute as @e[c=1,scores={domain=0,domainactive=0,wheelactive=1..},r=50] at @s positioned ^^^2 run function damages/sukuna_domain
execute as @s[scores={Deleter=1..}] at @s run execute as @e[c=1,scores={domain=0,domainactive=0,wheelactive=1..},r=50] at @s positioned ^^^2 run function damages/slash_damage
execute as @s[scores={Deleter=1..}] at @s run execute as @e[c=1,scores={domain=0,domainactive=0,wheelactive=1..},r=50] at @s positioned ^^^2 run function damages/cleave_damage

execute as @s[scores={Deleter=1..}] at @s run scoreboard players set @e[scores={infinity=4..},r=60,tag=!domainactive,tag=!domainimmune] infinity 3

execute as @s[scores={Deleter=1..}] at @s run tag @e[tag=domainactive,scores={domain=0},r=50,tag=sukuna,tag=sukunadomain1] remove sukunadomain1

execute as @s[scores={Deleter=31..,Evade=0..,Energy=1..3}] at @s run scoreboard players add @p[tag=domainactive,tag=sukuna,r=50] fuga 1

execute as @s[scores={Deleter=31..}] at @s unless entity @s[scores={Evade=0..}] run playanimation @s animation.malevolent_shrine_domain_inside0
execute as @s[scores={Deleter=31..,Evade=0..}] at @s run playanimation @s animation.malevolent_shrine_domain_inside
execute as @s[scores={Deleter=31..,Evade=0..}] at @s run camerashake add @a[r=60] 0.1 0.08

execute as @s[scores={Deleter=31..,Evade=125}] at @s run particle ds:malevolent_shrine_slashes9 ~~1~
execute as @s[scores={Deleter=31..,Evade=75}] at @s run particle ds:malevolent_shrine_slashes9 ~~1~
execute as @s[scores={Deleter=31..,Evade=55}] at @s run particle ds:malevolent_shrine_slashes9 ~~1~
execute as @s[scores={Deleter=31..,Evade=15}] at @s run particle ds:malevolent_shrine_slashes9 ~~1~



execute as @s[scores={Deleter=31..,Evade=0..,Energy=1}] at @s run playsound mob.shrine_slashes @a[r=50] ^^4^ 99999 1.35 99999
execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run playsound mob.shrine_slashes @a[r=50] ^^4^-12 99999 1.5 99999
execute as @s[scores={Deleter=31..,Evade=0..,Energy=2}] at @s run playsound mob.shrine_slashes @a[r=50] ^12 ^ ^ 99999 1.75 99999
execute as @s[scores={Deleter=31..,Evade=0..,Energy=3}] at @s run playsound mob.shrine_slashes @a[r=50] ^^4^6 99999 1.35 99999
execute as @s[scores={Deleter=31..,Evade=0..,Energy=4}] at @s run playsound mob.shrine_slashes @a[r=50] ^-7 ^8 ^3 99999 2 99999

execute unless entity @s[scores={Energy=0..}] run scoreboard players add @s[scores={Deleter=1..}] Energy 0
scoreboard players remove @s[scores={Energy=1..}] Energy 1

execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run execute as @e[tag=!domainactive,family=!projectile,family=!damage,family=!despawncito,tag=!heavenlyrestriction,tag=!domainimmune,family=!heavenlyrestriction,r=40,type=!xp_orb,type=!ds:projectile,tag=!unselect] at @s run playsound mob.sword @a[r=50] ~~~ 99999 2 99999
execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run execute as @e[tag=!domainactive,family=!projectile,family=!damage,family=!despawncito,tag=!heavenlyrestriction,tag=!domainimmune,family=!heavenlyrestriction,r=40,type=!xp_orb,type=!ds:projectile,tag=!unselect] at @s run particle ds:carve1 ~~1~
execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run execute as @e[tag=!domainactive,family=!projectile,family=!damage,family=!despawncito,tag=!heavenlyrestriction,tag=!domainimmune,family=!heavenlyrestriction,r=40,type=!xp_orb,type=!ds:projectile,tag=!unselect] at @s run particle ds:malevolent_shrine_slashes10 ~~1~
execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run damage @e[tag=!domainactive,family=!projectile,family=!damage,family=!despawncito,tag=!heavenlyrestriction,tag=!domainimmune,family=!heavenlyrestriction,r=40,type=!xp_orb,type=!ds:projectile,tag=!unselect] 3 override
execute as @s[scores={Deleter=31..,Evade=0..,Energy=0}] at @s run scoreboard players set @e[tag=!domainactive,family=!projectile,family=!damage,family=!despawncito,tag=!heavenlyrestriction,tag=!domainimmune,family=!heavenlyrestriction,r=40,type=!xp_orb,type=!ds:projectile,tag=!unselect] Hit 2

scoreboard players random @s[scores={Energy=0}] Energy 1 4


tp @s ~ 301.05 ~

scoreboard players remove @s[scores={Evade=1..}] Evade 1
scoreboard players set @s[scores={Evade=0}] Evade 150

execute as @s[scores={Evade=0..1}] at @s run fill ~1 ~8 ~1 ~-1 ~ ~-1 barrier [] replace air
execute as @s[scores={Evade=0..1}] at @s run fill ~3 ~6 ~3 ~-3 ~ ~-3 barrier [] replace air
execute as @s[scores={Evade=0..1}] at @s run fill ~5 ~ ~5 ~-5 ~1 ~-5 barrier [] replace air
execute as @s[scores={Deleter=26..}] at @s run fill ~30 300 ~30 ~-30 300 ~-30 barrier [] replace air
execute as @s[scores={Deleter=26..}] at @s run fill ~30 299 ~30 ~-30 299 ~-30 barrier [] replace air
execute as @s[scores={Deleter=26..}] at @s run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air
execute as @s[scores={Deleter=26..}] at @s run fill ~33 299 ~33 ~-33 299 ~-33 barrier [] replace air
execute as @s[scores={Deleter=26..}] at @s run fill ~ ~ ~ ~ ~1 ~ air [] replace barrier


execute as @s[scores={Deleter=1..21}] at @s run execute as @e[r=44] at @s run fill ~15 ~ ~15 ~-15 -15 ~-15 air [] replace barrier

execute as @s[scores={Deleter=1..}] at @s run execute as @e[type=!item,type=!xp_orb,r=40,rm=28,type=!ds:projectile] at @s run tp @s @s
execute as @s[scores={Deleter=1..}] at @s run execute as @e[type=!item,type=!xp_orb,r=40,rm=28,type=!ds:projectile] at @s run tp @s ^^^ facing @e[c=1]
execute as @s[scores={Deleter=1..}] at @s run execute as @e[type=!item,type=!xp_orb,r=40,rm=28,type=!ds:projectile] at @s run tp @s ^^1^1.5 facing @e[c=1]

execute as @s[scores={Deleter=1..}] at @s run tp @s @s

execute as @s[scores={Deleter=1..}] at @s if entity @e[scores={domainactive=1..,ab=1..,move=1..},tag=sukuna,r=90] run scoreboard players add @s Deleter 1

execute as @s[scores={Deleter=1..30}] at @s run scoreboard players set @e[r=90] Stun 6
execute as @s[scores={Deleter=26..27}] at @s run tp @e[scores={domainactive=1..},tag=sukuna,r=100] ~ ~1~
execute as @s[scores={Deleter=25}] at @s run camera @a[r=90] fade time 0.25 0.95 1.5 color 255 255 255
execute as @s[scores={Deleter=9..15}] at @s run title @a[tag=!impactframesoff,r=90] title 
execute as @s[scores={Deleter=1..2}] at @s run title @a[tag=!impactframesoff,r=90] title §l
execute as @s[scores={Deleter=1..21}] at @s run execute as @e[r=50] at @s run fill ~30 301 ~33 ~-30 301 ~-30 air [] replace barrier
execute as @s[scores={Deleter=1..21}] at @s run execute as @e[r=50] at @s run fill ~30 300 ~33 ~-30 300 ~-30 air [] replace barrier
execute as @s[scores={Deleter=1..21}] at @s run execute as @e[r=50] at @s run fill ~30 299 ~33 ~-30 299 ~-30 air [] replace barrier

execute as @s[scores={Deleter=1..22}] at @s run execute as @e[r=50] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 air [] replace barrier

execute as @s[scores={Deleter=1..21}] at @s run fill ~30 301 ~30 ~-30 301 ~-30 air
execute as @s[scores={Deleter=1..21}] at @s run fill ~30 300 ~30 ~-30 300 ~-30 air
execute as @s[scores={Deleter=1..21}] at @s run fill ~30 299 ~30 ~-30 299 ~-30 air
execute as @s[scores={Deleter=1..21}] at @s run fill ~34 301 ~34 ~-34 301 ~-34 air
execute as @s[scores={Deleter=1..21}] at @s run fill ~34 300 ~34 ~-34 300 ~-34 air
execute as @s[scores={Deleter=1..21}] at @s run fill ~34 299 ~34 ~-34 299 ~-34 air
execute as @s[scores={Deleter=1..15}] at @s run camerashake add @a[r=100] 1 2
execute as @s[scores={Deleter=1..20}] at @s run stopsound @a[r=90] ambient.nether_wastes.loop
execute as @s[scores={Deleter=20}] at @s run playsound music.domainbreak @a[r=90] ~~~ 100000 1 10000
execute as @s[scores={Deleter=1..15}] at @s positioned ~~-200~-0 run execute as @e[name=ShrineBarrier,c=1] at @s run particle ds:domain_smash1_b
execute as @s[scores={Deleter=1..15}] at @s positioned ~~-200~-0 run execute as @e[name=ShrineBarrier,c=1] at @s run particle ds:domain_smash2_b
execute as @s[scores={Deleter=1..15}] at @s positioned ~~-200~-0 run execute as @e[name=ShrineBarrier,c=1] at @s run particle ds:domain_smash3_b
execute as @s[scores={Deleter=9..12}] at @s positioned ~~-200~-0 run kill @e[name=ShrineBarrier,c=1] 
execute as @s[scores={Deleter=9..10}] at @s run scoreboard players set @e[scores={domainactive=1..},r=90] domainactive 2

execute as @s[scores={Deleter=5..8}] at @s run execute as @e[r=360,type=!ds:projectile] at @s run tp @s ~~0.8~-0

execute as @s[scores={Deleter=9..30}] at @s unless entity @e[scores={tpdown=0..},c=1] run scoreboard objectives add tpdown dummy
execute as @s[scores={Deleter=1..10}] at @s run scoreboard players set @e[r=90,type=!ds:projectile] tpdown 4

