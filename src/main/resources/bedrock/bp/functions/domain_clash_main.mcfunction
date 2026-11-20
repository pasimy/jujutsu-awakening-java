execute as @e[rm=35,r=60,family=!motionless,family=!damage] at @s run tp @s ^^7^7 facing @e[type=ds:domain_clash_main,c=1]


# save people from falling out or flying in

execute positioned ~~-35~ run tp @e[r=34,family=!damage,family=!inanimate,family=!barrier,family=!projectile] ~~38~
scoreboard players set @a[r=60,rm=35,scores={dashCD=0}] DashCD 99
effect @a[r=60,rm=35,scores={dashCD=0}] clear levitation

execute as @e[r=60,family=!motionless,family=!damage,family=!projectile] at @s if block ~~~ barrier run tp @s ~ 301.5 ~

camerashake add @a[r=60] 0.2 0.08 
execute as @e[family=motionless,r=60] at @s run playsound mob.wither.shoot @a[r=100] ~~-15~ 99999 0.15 99999
execute as @e[family=motionless,r=60] at @s run playsound mob.fuga_appear @a[r=100] ~~-15~ 99999 0.35 99999

execute unless entity @s[scores={num=0..}] run scoreboard objectives add num dummy
scoreboard players add @s num 1
fill ~30 299 ~30 ~-30 300 ~-30 barrier [] replace air

scoreboard players set @e[scores={combat=0,detect_health=0..},r=80] combat 600

tp @e[type=ds:domain_barrier,r=70] ~~-80~


execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:infinite_void_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]
execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:iron_mountain_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=6..10}] at @s run execute as @e[type=ds:malevolent_shrine_clashing,r=60] at @s run fill ~5~6~5~-5~-1~-5 barrier [] replace air
execute as @s[scores={num=6..15}] at @s run execute as @e[type=ds:malevolent_shrine_clashing,r=60] at @s run tp @e[tag=domainclashing,r=22,c=1] ^^7.5^3 facing ^^7.5^10

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:incomplete_shrine_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^7 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:perfection_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^16 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:deadly_sentencing_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^2 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:tempest_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:idle_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:shadow_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:speech_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]

execute as @s[scores={num=0..5}] at @s run execute as @e[type=ds:yuji_domain_clashing] at @s run tp @e[tag=domainclashing,r=5,c=1] ^^^14 facing @e[type=ds:domain_clash_main]




execute as @s[scores={num=6..10}] at @s run execute as @e[r=64,tag=domainclashing] at @s run scriptevent ds:knockback 1.5
execute as @s[scores={num=11..12}] at @s run tp @s ~~~~ 0

execute as @s[scores={num=1..120}] at @s run scoreboard players set @e[r=64,scores={Stun=0..10}] Stun 30

execute as @s[scores={num=16}] at @s run camera @a[r=64] set minecraft:free pos ^5 ^15 ^-15 rot ~-15 ~-35
execute as @s[scores={num=17}] at @s run camera @a[r=64] set minecraft:free ease 1 in_out_circ pos ^6 ^16 ^-14 rot ~30 ~65

execute as @s[scores={num=34}] at @s run camera @a[r=64] set minecraft:free pos ^-15 ^3 ^15 rot ~15 ~135
execute as @s[scores={num=35}] at @s run camera @a[r=64] set minecraft:free ease 1 in_out_circ pos ^-6 ^1 ^14 rot ~ ~225

execute as @s[scores={num=1..150}] at @s run title @a[tag=!impactframesoff,r=64] title 

execute as @s[scores={num=5}] at @s run execute as @e[r=100] at @s run playsound music.domainclash1 @s ~~~ 9999 1 9999



execute as @s[scores={num=65}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1},r=64] at @s run tp @s ~~~~ 0
execute as @s[scores={num=65}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1},r=64] at @s run playsound mob.whoosh3 @a[r=100] ~~1~ 99999 1 99999
execute as @s[scores={num=65}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1},r=64] at @s run camera @a[r=64] set minecraft:free pos ^^1.4^2 facing ^4^1.4^
execute as @s[scores={num=66}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1},r=64] at @s run camera @a[r=64] set minecraft:free ease 0.25 in_out_circ pos ^^1.4^1.5 facing ^^1.4^

execute as @s[scores={num=75}] at @s run execute as @e[family=!barrier,scores={domain_clasher=2},r=64] at @s run camera @a[r=64] set minecraft:free pos ^^1.4^2 facing ^4^1.4^
execute as @s[scores={num=75}] at @s run execute as @e[family=!barrier,scores={domain_clasher=2},r=64] at @s run playsound mob.whoosh3 @a[r=100] ~~1~ 99999 1 99999
execute as @s[scores={num=76}] at @s run execute as @e[family=!barrier,scores={domain_clasher=2},r=64] at @s run camera @a[r=64] set minecraft:free ease 0.25 in_out_circ pos ^^1.4^1.5 facing ^^1.4^

execute as @s[scores={num=85}] at @s unless entity @e[family=!barrier,scores={domain_clasher=3},r=64] run scoreboard players set @s num 97
execute as @s[scores={num=85}] at @s run execute as @e[family=!barrier,scores={domain_clasher=3},r=64] at @s run camera @a[r=64] set minecraft:free pos ^^1.4^2 facing ^4^1.4^
execute as @s[scores={num=85}] at @s run execute as @e[family=!barrier,scores={domain_clasher=3},r=64] at @s run playsound mob.whoosh3 @a[r=100] ~~1~ 99999 1 99999
execute as @s[scores={num=86}] at @s run execute as @e[family=!barrier,scores={domain_clasher=3},r=64] at @s run camera @a[r=64] set minecraft:free ease 0.25 in_out_circ pos ^^1.4^1.5 facing ^^1.4^

execute as @s[scores={num=95}] at @s unless entity @e[family=!barrier,scores={domain_clasher=4},r=64] run scoreboard players set @s num 97
execute as @s[scores={num=95}] at @s run execute as @e[family=!barrier,scores={domain_clasher=4},r=64] at @s run camera @a[r=64] set minecraft:free pos ^^1.4^2 facing ^4^1.4^
execute as @s[scores={num=95}] at @s run execute as @e[family=!barrier,scores={domain_clasher=4},r=64] at @s run playsound mob.whoosh3 @a[r=100] ~~1~ 99999 1 99999
execute as @s[scores={num=96}] at @s run execute as @e[family=!barrier,scores={domain_clasher=4},r=64] at @s run camera @a[r=64] set minecraft:free ease 0.25 in_out_circ pos ^^1.4^1.5 facing ^^1.4^


execute as @s[scores={num=115}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1..},r=64,c=1,tag=limitless] at @s if entity @e[family=malevolentshrine,r=64] run camera @a[r=64] set minecraft:free pos ^2^1.4^4 facing @e[family=malevolentshrine]
execute as @s[scores={num=115}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1..},r=64,c=1,tag=limitless] at @s if entity @e[family=malevolentshrine,r=64] run playsound mob.whoosh3 @a[r=100] ~~1~ 99999 1 99999
execute as @s[scores={num=116}] at @s run execute as @e[family=!barrier,scores={domain_clasher=1..},r=64,c=1,tag=limitless] at @s if entity @e[family=malevolentshrine,r=64] run camera @a[r=64] set minecraft:free ease 0.25 in_out_circ pos ^-1.5^0.5^-3 facing @e[family=malevolentshrine]



execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:infinite_void_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.infinite_void_standby2

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:iron_mountain_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.jogo_domain_hold

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:malevolent_shrine_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.malevolent_shrine_hold


execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:incomplete_shrine_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.incomplete_shrine_hold

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:perfection_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=30,c=1] animation.mahito.domain_idle
execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:perfection_clashing,r=60] at @s run playanimation @e[tag=idle_transfig,c=1,r=30] animation.mahito.domain_idle

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:deadly_sentencing_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.judgeman.domain_hold

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:tempest_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.kashimo_domain_standby

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:idle_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.hakari_domain_standby

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:shadow_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.chimera_domain_standby

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:speech_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.cursed_speech.domain_hold

execute as @s[scores={num=50..135}] at @s run execute as @e[type=ds:yuji_domain_clashing,r=60] at @s run playanimation @e[tag=domainclashing,r=22,c=1] animation.yuji_domain_hold

scoreboard players random @s[scores={num=120}] Mode 1 4
execute as @s[scores={num=120,Mode=1}] at @s run execute as @a[r=60] at @s run playsound music.domainclashing @s ~~~ 99999 0.9 99999
execute as @s[scores={num=120,Mode=2}] at @s run execute as @a[r=60] at @s run playsound music.prowess @s ~~~ 99999 1 99999
execute as @s[scores={num=120,Mode=3}] at @s run execute as @a[r=60] at @s run playsound music.mahoraga @s ~~~ 99999 1 99999
execute as @s[scores={num=120,Mode=4}] at @s run execute as @a[r=60] at @s run playsound music.toji @s ~~~ 99999 1 99999
scoreboard players reset @s[scores={num=121}] Mode 

execute as @s[scores={num=140}] at @s run camera @a[r=64] fade time 0.45 0.1 0.1





# Malevolent Shrine Damaging
execute as @s[tag=domain_clashing_commence] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80,scores={domain_clasher=1}] at @s run scoreboard players remove @e[tag=domainclashing,scores={domain_clasher=!1},r=80] domain_resistance 1
execute as @s[tag=domain_clashing_commence] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80,scores={domain_clasher=2}] at @s run scoreboard players remove @e[tag=domainclashing,scores={domain_clasher=!2},r=80] domain_resistance 1
execute as @s[tag=domain_clashing_commence] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80,scores={domain_clasher=3}] at @s run scoreboard players remove @e[tag=domainclashing,scores={domain_clasher=!3},r=80] domain_resistance 1
execute as @s[tag=domain_clashing_commence] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80,scores={domain_clasher=4}] at @s run scoreboard players remove @e[tag=domainclashing,scores={domain_clasher=!4},r=80] domain_resistance 1


execute as @s[scores={num=1001..2110}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:malevolent_shrine_outside_barrier

execute as @s[scores={num=3001..3087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:malevolent_shrine_outside_barrier
execute as @s[scores={num=3001..3087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run camerashake add @a[r=100] 0.05 0.08 rotational
execute as @s[scores={num=3001..3087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run playsound mob.shrine_slashes @a[r=400] ~~~ 99999 1 99999
execute as @s[scores={num=3088..3102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:slashes_destroy_barrier1
execute as @s[scores={num=3088..3102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:slashes_destroy_barrier2
execute as @s[scores={num=3102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash1_b
execute as @s[scores={num=3102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash2_b
execute as @s[scores={num=3102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash3_b

execute as @s[scores={num=4001..4087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:malevolent_shrine_outside_barrier
execute as @s[scores={num=4001..4087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run camerashake add @a[r=100] 0.05 0.08 rotational
execute as @s[scores={num=4001..4087}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run playsound mob.shrine_slashes @a[r=400] ~~~ 99999 1 99999
execute as @s[scores={num=4088..4102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:slashes_destroy_barrier1
execute as @s[scores={num=4088..4102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:slashes_destroy_barrier2
execute as @s[scores={num=4102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash1_b
execute as @s[scores={num=4102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash2_b
execute as @s[scores={num=4102}] at @s run  execute as @e[family=malevolentshrine,family=domain_clasher,r=80] at @s positioned ~~-300~ run execute as @e[name="clash_barrier",family=barrier,c=1,r=400] at @s run particle ds:domain_smash3_b





# Apply Resistance Scores to each clasher before fight starts
execute as @s[scores={num=148..150}] at @s run scoreboard objectives add domain_resistance dummy
execute as @s[scores={num=148..150}] at @s run scoreboard objectives add domain_resistancecap dummy



execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_unlimitedvoid] domain_resistance 700
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_unlimitedvoid] domain_resistancecap 700

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_malevolent_shrine] domain_resistance 250
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_malevolent_shrine] domain_resistancecap 250

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_incomplete_shrine] domain_resistance 200
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_incomplete_shrine] domain_resistancecap 200

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_ironmountain] domain_resistance 600
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_ironmountain] domain_resistancecap 600

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_perfection] domain_resistance 600
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_perfection] domain_resistancecap 600

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_deadly_sentencing] domain_resistance 600
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_deadly_sentencing] domain_resistancecap 600

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_tempest] domain_resistance 650
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_tempest] domain_resistancecap 650

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_idle] domain_resistance 800
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_idle] domain_resistancecap 800

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_shadow] domain_resistance 600
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_shadow] domain_resistancecap 600

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_speech] domain_resistance 550
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_speech] domain_resistancecap 550

execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_yuji_domain] domain_resistance 600
execute as @s[scores={num=148..151}] at @s run scoreboard players set @e[tag=domainclashing,r=50,tag=deploy_yuji_domain] domain_resistancecap 600


tag @s[tag=!DomainExpansion] add DomainExpansion

execute as @s[scores={num=150..151}] at @s run tag @s add domain_clashing_commence
execute as @s[scores={num=150..151}] at @s run camera @a[r=64] clear
execute as @s[scores={num=150..151}] at @s run scoreboard players set @e[scores={domainstart=1..},r=64] domainstart 0
execute as @s[scores={num=150..151}] at @s run scoreboard players set @e[scores={Stun=1..},r=64] Stun 0
execute as @s[scores={num=150..151}] at @s run tag @e[tag=domainlayout,r=64] remove domainlayout


# Despawn Domains if death
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=1}] at @s unless entity @e[tag=domainclashing,scores={domain_clasher=1},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=2}] at @s unless entity @e[tag=domainclashing,scores={domain_clasher=2},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=3}] at @s unless entity @e[tag=domainclashing,scores={domain_clasher=3},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=4}] at @s unless entity @e[tag=domainclashing,scores={domain_clasher=4},r=100] run function domain_clasher_failed


execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=1}] at @s if entity @e[tag=domainclashing,scores={domain_clasher=1,domain_resistance=0},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=2}] at @s if entity @e[tag=domainclashing,scores={domain_clasher=2,domain_resistance=0},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=3}] at @s if entity @e[tag=domainclashing,scores={domain_clasher=3,domain_resistance=0},r=100] run function domain_clasher_failed
execute as @s[tag=domain_clashing_commence] at @s run execute as @e[family=barrier,type=!ds:domain_clash_main,type=!ds:domain_barrier_inside,type=!ds:domain_barrier,type=!ds:domain_barrier_white,scores={domain_clasher=4}] at @s if entity @e[tag=domainclashing,scores={domain_clasher=4,domain_resistance=0},r=100] run function domain_clasher_failed


scoreboard players set @s[scores={num=152..160}] num 999
execute as @s[scores={num=1000}] at @s run tellraw @a {"rawtext":[{"text":"§c- You have entered into a Domain Clash, play on the offensive or defensive, taking Damage will cause you to lose control of your Domain's barrier resistance!"}]}



execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=60] at @s run tag @s remove deploy_unlimitedvoid
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=60] at @s run tag @s remove deploy_malevolent_shrine
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=60] at @s run tag @s remove deploy_incomplete_shrine
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=60] at @s run tag @s remove deploy_ironmountain
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=60] at @s run tag @s remove deploy_perfection
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=60] at @s run tag @s remove deploy_deadly_sentencing
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=60] at @s run tag @s remove deploy_tempest
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=60] at @s run tag @s remove deploy_idle
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=60] at @s run tag @s remove deploy_shadow
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=60] at @s run tag @s remove deploy_speech
execute as @s[scores={num=999..1000}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=60] at @s run tag @s remove deploy_yuji_domain

execute as @s[scores={num=1000..}] at @s run tag @e[r=60,family=!projectile,family=!damage,family=!barrier,family=!inanimate,tag=Frames] remove Frames

execute as @s[scores={num=1000..}] at @s run scoreboard players set @e[scores={infinity=1..},r=60,family=!projectile,family=!damage,family=!barrier,family=!inanimate] infinity 0
execute as @s[scores={num=1000..}] at @s run scoreboard players set @e[scores={domainamp=1..},r=60,family=!projectile,family=!damage,family=!barrier,family=!inanimate] domainamp 0

scoreboard players set @e[scores={domainCD=0..20},r=50] domainCD 600

execute as @s[scores={num=1001..1593}] at @s run execute as @e[family=domain_clasher] at @s unless entity @e[family=domain_clasher,r=80,rm=1] run scoreboard players set @e[type=ds:domain_clash_main,scores={num=1001..1593},c=1,r=80] num 1594


execute as @s[scores={num=1599..1605}] at @s run scoreboard players set @e[tag=domain_clasher,r=80,scores={move=4..}] move 3
execute as @s[scores={num=1599..1605}] at @s run playanimation @e[tag=domain_clasher,r=80,scores={move=4..}] animation.stunned 
execute as @s[scores={num=1599..1605}] at @s run scoreboard players set @e[tag=domain_clasher,r=80,scores={Stun=0..4}] Stun 20


execute as @s[scores={num=1600}] at @s run stopsound @a[r=60]
execute as @s[scores={num=1595}] at @s run camera @a[r=60] fade time 0.25 1 0.5 color 255 255 255


execute as @s[scores={num=1600}] at @s run scriptevent ds:clash_winner

execute as @s[scores={num=1605}] at @s run execute as @e[tag=domain_winner] at @s run scoreboard players set @e[tag=domainclashing,tag=!domain_winner] domain_resistance 0









execute as @s[scores={num=1608..1610}] at @s unless entity @e[tag=domain_winner,r=80] run execute as @e[family=domain_clasher,scores={domain_clasher=1}] at @s run tag @e[scores={domain_clasher=1},c=1,tag=domainclashing,family=!barrier,family=!domain_clasher,family=!damage] add domain_winner
execute as @s[scores={num=1608..1610}] at @s unless entity @e[tag=domain_winner,r=80] run execute as @e[family=domain_clasher,scores={domain_clasher=2}] at @s run tag @e[scores={domain_clasher=2},c=1,tag=domainclashing,family=!barrier,family=!domain_clasher,family=!damage] add domain_winner
execute as @s[scores={num=1608..1610}] at @s unless entity @e[tag=domain_winner,r=80] run execute as @e[family=domain_clasher,scores={domain_clasher=3}] at @s run tag @e[scores={domain_clasher=3},c=1,tag=domainclashing,family=!barrier,family=!domain_clasher,family=!damage] add domain_winner
execute as @s[scores={num=1608..1610}] at @s unless entity @e[tag=domain_winner,r=80] run execute as @e[family=domain_clasher,scores={domain_clasher=4}] at @s run tag @e[scores={domain_clasher=4},c=1,tag=domainclashing,family=!barrier,family=!domain_clasher,family=!damage] add domain_winner


# Unlimited Void Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run tag @e[tag=domain_winner,c=1,tag=limitless,r=80] remove quickdomain
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,tag=limitless,r=80] domain 105
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run execute as @e[type=ds:domain_clash_main,scores={num=1610..1611},c=1,r=80] at @s run summon ds:domain_barrier_inside UnlimitedVoid
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run scoreboard players add @e[name=UnlimitedVoid,r=80,c=1] Deleter 731
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run scoreboard players operation @e[name=UnlimitedVoid,r=80,c=1] Deleter += @e[tag=domain_winner,c=1,tag=limitless,r=80] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s run scoreboard players operation @e[tag=domain_winner,c=1,tag=limitless,r=80] domainactive = @e[name=UnlimitedVoid,r=80,c=1] Deleter
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier_white UnlimitedBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,tag=limitless,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:infinite_void_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear



# Iron Mountain Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,tag=flames,r=80] domain 151
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier CoffinBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=CoffinBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=CoffinBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,tag=flames,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=CoffinBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:iron_mountain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


# Perfection Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s run  tag  @e[tag=domain_winner,c=1,tag=idle_transfig,r=80] remove domain_start
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s run  tag  @e[tag=domain_winner,c=1,tag=idle_transfig,r=80] add mahito_domain
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s run execute as @a[r=100] at @s run playsound music.perfection @s ~~~ 9999 1 9999
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,tag=idle_transfig,r=80] domain 281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier PerfectionBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:perfection_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


# Deadly Sentencing Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s run tag @e[c=1,tag=domainclashing,r=80,tag=!domain_winner] add on_trial
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s run tp @e[tag=on_trial] ^^^25
execute as @s[scores={num=1610}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s run tellraw @a[r=80] {"rawtext": [{"selector": "@e[tag=on_trial,c=1,r=80]"},{"text": " §gis now on Trial."}]}

execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s run playanimation @e[tag=domain_winner,c=1,r=80] animation.judgeman.domain2
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 68
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier deadlysentencingBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:deadly_sentencing_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear



# Idle Death Gamble Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:idle_clashing] at @s run camera @a[r=80] fade time 0.1 1 0.25 color 255 255 255
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:idle_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 451
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:idle_clashing] at @s run execute as @e[r=80,family=!barrier] at @s run function tpdown
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:idle_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:idle_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear



# Yuji Domain Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 153
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier YujiBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=YujiBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=YujiBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=YujiBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:yuji_domain_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear



# Kashimo Domain Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 191
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier StormBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=StormBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=StormBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=StormBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:tempest_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


# Chimera Shadow Garden Domain Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run tag @e[tag=domain_winner,c=1,r=80] add shadowgardendomain2
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run tag @e[tag=domain_winner,c=1,r=80] remove shadowgardendomain
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run tag @e[tag=domain_winner,c=1,r=80] remove shadowgardendomain1
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run playanimation  @e[tag=domain_winner,c=1,r=80] animation.chimera_domain3
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run camera @a[r=80] fade time 0.25 2 0.5 color 0 0 0
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 261
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier ChimeraBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=ChimeraBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=ChimeraBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=ChimeraBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:shadow_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


# Speech Domain Winner
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s run scoreboard players set @e[tag=domain_winner,c=1,r=80] domain 151
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_barrier_overtake ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run summon ds:domain_barrier SpeechBarrier ~~~
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=SpeechBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players operation @e[name=SpeechBarrier,r=0.15,c=1] Deleter += @e[tag=domain_winner,c=1,r=480] Energy
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run scoreboard players set @e[name=SpeechBarrier,r=0.15,c=1] Energy 35
execute as @s[scores={num=1610..1611}] at @s run execute as @e[family=domain_clasher,type=ds:speech_clashing] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear




# MALEVOLENT SHRINE WINNER
execute as @s[scores={num=1611..1700}] at @s if entity @e[family=domain_clasher,type=ds:malevolent_shrine_clashing] run scoreboard players set @s num 3000

execute as @s[scores={num=1610..1612}] at @s run execute as @e[family=domain_clasher,type=ds:malevolent_shrine_clashing] at @s run execute as @a[r=400] at @s run playsound music.malevolent_kitchen @s ~~~ 99999 1 99999

execute as @s[scores={num=3000}] at @s positioned ^12^20^20 run particle ds:barrier_cracking1
execute as @s[scores={num=3000}] at @s positioned ^12^20^20 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=3000}] at @s positioned ^12^20^20 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=3000}] at @s positioned ^12^20^20 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=3000}] at @s positioned ^12^20^20 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=3010}] at @s positioned ^4^-5^-20 run particle ds:barrier_cracking1
execute as @s[scores={num=3010}] at @s positioned ^4^-5^-20 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=3010}] at @s positioned ^4^-5^-20 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=3010}] at @s positioned ^4^-5^-20 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=3010}] at @s positioned ^4^-5^-20 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=3024}] at @s positioned ^-7^2^4 run particle ds:barrier_cracking1
execute as @s[scores={num=3024}] at @s positioned ^-7^2^4 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=3024}] at @s positioned ^-7^2^4 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=3024}] at @s positioned ^-7^2^4 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=3024}] at @s positioned ^-7^2^4 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=3030}] at @s run camera @a[r=100] fade time 0.25 1 0.25 color 255 255 255

execute as @s[scores={num=3035..3100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camera @a[r=400] set minecraft:free pos ^35^35^35 facing ~~~
execute as @s[scores={num=3035..3100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camerashake add @a[r=400] 0.3 0.08 rotational
execute as @s[scores={num=3088..3100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run playsound mob.slash1 @a ^25^25^25 99999 1.2 99999
execute as @s[scores={num=3100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run execute as @a[r=400] at @s run playsound music.domainbreak @s ~~~ 9999 1 9999

execute as @s[scores={num=3035}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30

execute as @s[scores={num=3075}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30


execute as @s[scores={num=3098}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame
execute as @s[scores={num=3100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame_black

execute as @s[scores={num=3118}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame
execute as @s[scores={num=3120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame_black


execute as @s[scores={num=3118..3120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30
execute as @s[scores={num=3118..3120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash1_b
execute as @s[scores={num=3118..3120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash2_b
execute as @s[scores={num=3118..3120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash3_b

execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear1 ~~10~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear2 ~~7.5~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear3 ~~7.5~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear4 ~~7.5~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear5 ~~7.5~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:dirt4
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:dirt02
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:large_slam1
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:large_slam3
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camerashake add @a[r=100] 4 0.25 rotational
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_kitchen_orbs ~~4~
execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_kitchen_orbs2 ~~7.5~


execute as @s[scores={num=3120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon ds:malevolent_kitchen ~ ~ ~ facing ^^^25 none "malevolent_kitchen"
execute as @s[scores={num=3120..3200}] at @s positioned ~ ~-200 ~ run scoreboard players operation @e[type=ds:malevolent_kitchen,c=1,name="malevolent_kitchen"] Deleter = @e[tag=sukuna,scores={domainactive=1..},c=1] domainactive


execute as @s[scores={num=3000..3002}] at @s run scoreboard players set @e[tag=domain_winner,tag=sukuna] domainactive 3200


execute as @s[scores={num=3121..3200}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[type=ds:malevolent_kitchen,c=1] Evade 150

tag @s[scores={num=3000..3002}] remove domain_clashing_commence
execute as @s[scores={num=3119..3120}] at @s positioned ~ ~-200 ~ run tag @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] remove domainclasher
execute as @s[scores={num=3119}] at @s positioned ~ ~-200 ~ run scoreboard players add @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domainactive 600
execute as @s[scores={num=3119..3120}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domain_resistancecap 0
execute as @s[scores={num=3119..3120}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domain_resistance 0
execute as @s[scores={num=3120..3122}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~9~3~9 ~-9~~-9 barrier [] replace air
execute as @s[scores={num=3120..3122}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~5~21~5 ~-5~~-5 barrier [] replace air
execute as @s[scores={num=3120..3122}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~10~2~10 ~-10~~-10 barrier [] replace air
execute as @s[scores={num=3120..3122}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~11~1~11 ~-11~~-11 barrier [] replace air
execute as @s[scores={num=3120..3122}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~12~~12 ~-12~~-12 barrier [] replace air
execute as @s[scores={num=3120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run fill ~~1~ ~~~ air [] replace barrier

execute as @s[scores={num=3120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run  tp @e[tag=domain_winner,tag=sukuna,c=1] ^^22^1 facing ^^22^10
execute as @s[scores={num=3120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run playanimation @e[tag=domain_winner,tag=sukuna,c=1] animation.malevolent_shrine_hold


execute as @s[scores={num=3121..3123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain1
execute as @s[scores={num=3121..3123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain2
execute as @s[scores={num=3121..3123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain3
execute as @s[scores={num=3121..3123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run playsound mob.red2 @a ~~5~ 99999 0.8 99999
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run execute as @a[r=300] at @s run playsound music.red2 @s ~~~ 99999 0.8 99999
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run camerashake add @a[r=300] 4 1 rotational
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run particle ds:malevolent_kitchen_slashes1 
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run particle ds:malevolent_kitchen_slashes1 
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run particle ds:malevolent_shockwave1 ~~7~
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run particle ds:malevolent_shockwave2 ~~7~
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s if entity @e[tag=griefable] run function shockwave
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run effect @a[r=400] night_vision 1 1 true
execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:malevolent_kitchen,c=1] at @s run camera @a[r=400] clear

execute as @s[scores={num=3130}] at @s positioned ~ ~-200 ~ run camera @a[r=400] fade time 0.2 0.25 0.25


execute as @s[scores={num=3130}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={num=3133}] at @s run summon gg:impact_frame_black ~~~
execute as @s[scores={num=3135..}] at @s run fill ~2~2~2~-2~-2~-2 air [] replace light_block

execute as @s[scores={num=3135}] at @s if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=3135}] at @s positioned ~~~45 if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=3135}] at @s positioned ~~~-45 if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=3135}] at @s positioned ~45~~ if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=3135}] at @s positioned ~-45~~ if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30

# SUKUNAS END
execute as @s[scores={num=3141..3200}] at @s run camera @a[r=400] clear
execute as @s[scores={num=3141..3200}] at @s run scoreboard players set @e[r=480] domain_clasher 0
execute as @s[scores={num=3141..3200}] at @s run scoreboard players set @e[r=480] domain_clasher_id 0
execute as @s[scores={num=3141..3200}] at @s run scoreboard players set @e[r=480] domain_resistancecap 0
execute as @s[scores={num=3141..3200}] at @s run scoreboard players set @e[r=480] domain_resistance 0
execute as @s[scores={num=3141..3200}] at @s run tag @e[r=480] remove domainclashing
execute as @s[scores={num=3141..3200}] at @s run event entity @e[family=domain_clasher,r=80] ds:disappear
execute as @s[scores={num=3141..3200}] at @s run execute as @e[r=480,family=!barrier,type=!ds:malevolent_kitchen] at @s run function tpdown
execute as @s[scores={num=3141..3200}] at @s run tag @e[r=480] remove domain_winner
execute as @s[scores={num=3141..3200}] at @s run event entity @s ds:disappear






# MALEVOLENT SHRINE WINNER  INCOMPLETE 
execute as @s[scores={num=1611..1700}] at @s if entity @e[family=domain_clasher,type=ds:incomplete_shrine_clashing] run scoreboard players set @s num 4000

execute as @s[scores={num=1610..1612}] at @s run execute as @e[family=domain_clasher,type=ds:incomplete_shrine_clashing] at @s run execute as @a[r=400] at @s run playsound music.incomplete_shrine @s ~~~ 99999 1 99999

execute as @s[scores={num=4000}] at @s positioned ^12^20^20 run particle ds:barrier_cracking1
execute as @s[scores={num=4000}] at @s positioned ^12^20^20 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=4000}] at @s positioned ^12^20^20 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=4000}] at @s positioned ^12^20^20 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=4000}] at @s positioned ^12^20^20 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=4010}] at @s positioned ^4^-5^-20 run particle ds:barrier_cracking1
execute as @s[scores={num=4010}] at @s positioned ^4^-5^-20 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=4010}] at @s positioned ^4^-5^-20 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=4010}] at @s positioned ^4^-5^-20 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=4010}] at @s positioned ^4^-5^-20 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=4024}] at @s positioned ^-7^2^4 run particle ds:barrier_cracking1
execute as @s[scores={num=4024}] at @s positioned ^-7^2^4 run particle ds:burst_impact1 ~~~
execute as @s[scores={num=4024}] at @s positioned ^-7^2^4 run playsound mob.slash1 @a[r=100] ~~~ 99999 0.75 99999
execute as @s[scores={num=4024}] at @s positioned ^-7^2^4 run playsound mob.blasted4 @a[r=100] ~~~ 99999 1.75 99999
execute as @s[scores={num=4024}] at @s positioned ^-7^2^4 run camerashake add @a[r=100] 2 0.25

execute as @s[scores={num=4030}] at @s run camera @a[r=100] fade time 0.25 1 0.25 color 255 255 255

execute as @s[scores={num=4035..4100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camera @a[r=400] set minecraft:free pos ^35^35^35 facing ~~~
execute as @s[scores={num=4035..4100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camerashake add @a[r=400] 0.3 0.08 rotational
execute as @s[scores={num=4088..4100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run playsound mob.slash1 @a ^25^25^25 99999 1.2 99999
execute as @s[scores={num=4100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run execute as @a[r=400] at @s run playsound music.domainbreak @s ~~~ 9999 1 9999

execute as @s[scores={num=4035}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30

execute as @s[scores={num=4075}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30


execute as @s[scores={num=4098}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame
execute as @s[scores={num=4100}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame_black

execute as @s[scores={num=4118}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame
execute as @s[scores={num=4120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon gg:impact_frame_black


execute as @s[scores={num=4118..4120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:invert ^30^30^30
execute as @s[scores={num=4118..4120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash1_b
execute as @s[scores={num=4118..4120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash2_b
execute as @s[scores={num=4118..4120}] at @s run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:domain_smash3_b

execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear1 ~~10~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear2 ~~7.5~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear3 ~~7.5~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear4 ~~7.5~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_appear5 ~~7.5~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:dirt4
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:dirt02
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:large_slam1
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:large_slam3
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run camerashake add @a[r=100] 4 0.25 rotational
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_kitchen_orbs ~~4~
execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run particle ds:malevolent_kitchen_orbs2 ~~7.5~


execute as @s[scores={num=4120}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:domain_barrier,c=1,name="clash_barrier"] at @s run summon ds:incomplete_shrine ~ ~ ~ facing ^^^25 none "malevolent_kitchen"
execute as @s[scores={num=4120..4200}] at @s positioned ~ ~-200 ~ run scoreboard players operation @e[type=ds:incomplete_shrine,c=1,name="malevolent_kitchen"] Deleter = @e[tag=sukuna,scores={domainactive=1..},c=1] domainactive


execute as @s[scores={num=4000..4002}] at @s run scoreboard players set @e[tag=domain_winner,tag=sukuna] domainactive 3200


execute as @s[scores={num=4121..4200}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[type=ds:incomplete_shrine,c=1] Evade 150

tag @s[scores={num=4000..4002}] remove domain_clashing_commence
execute as @s[scores={num=4119..4120}] at @s positioned ~ ~-200 ~ run tag @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] remove domainclasher
execute as @s[scores={num=4119}] at @s positioned ~ ~-200 ~ run scoreboard players add @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domainactive 600
execute as @s[scores={num=4119..4120}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domain_resistancecap 0
execute as @s[scores={num=4119..4120}] at @s positioned ~ ~-200 ~ run scoreboard players set @e[tag=sukuna,tag=domainclasher,tag=domain_winner,c=1] domain_resistance 0

execute as @s[scores={num=4120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run fill ~~1~ ~~~ air [] replace barrier

execute as @s[scores={num=4120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run  tp @e[tag=domain_winner,tag=sukuna,c=1] ^^1.74^6 facing ^^1.75^10
execute as @s[scores={num=4120..}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run playanimation @e[tag=domain_winner,tag=sukuna,c=1] animation.incomplete_shrine_hold


execute as @s[scores={num=4121..4123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain1
execute as @s[scores={num=4121..4123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain2
execute as @s[scores={num=4121..4123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s run tag @e[tag=domain_winner,c=1,tag=sukuna,r=80] remove sukunadomain3
execute as @s[scores={num=4121..4123}] at @s run execute as @e[family=domain_clasher,family=malevolentshrine] at @s positioned ~ ~-300 ~ run execute as @e[family=barrier,c=1,name="clash_barrier"] at @s run event entity @s ds:disappear


execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run playsound mob.red2 @a ~~5~ 99999 0.8 99999
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run execute as @a[r=300] at @s run playsound music.red2 @s ~~~ 99999 0.8 99999
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run camerashake add @a[r=300] 4 1 rotational
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run particle ds:incomplete_shrine_slashes1 
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run particle ds:incomplete_shrine_slashes1 
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run particle ds:malevolent_shockwave1 ~~7~
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run particle ds:malevolent_shockwave2 ~~7~
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s if entity @e[tag=griefable] run function shockwave
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run effect @a[r=400] night_vision 1 1 true
execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run execute as @e[type=ds:incomplete_shrine,c=1] at @s run camera @a[r=400] clear

execute as @s[scores={num=4130}] at @s positioned ~ ~-200 ~ run camera @a[r=400] fade time 0.2 0.25 0.25


execute as @s[scores={num=4130}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={num=4133}] at @s run summon gg:impact_frame_black ~~~
execute as @s[scores={num=4135..}] at @s run fill ~2~2~2~-2~-2~-2 air [] replace light_block

execute as @s[scores={num=4135}] at @s if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=4135}] at @s positioned ~~~45 if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=4135}] at @s positioned ~~~-45 if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=4135}] at @s positioned ~45~~ if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30
execute as @s[scores={num=4135}] at @s positioned ~-45~~ if entity @e[tag=griefable] run function sukuna/attacks/domains/fill_area_30

# SUKUNAS END 2
execute as @s[scores={num=4141..4200}] at @s run camera @a[r=400] clear
execute as @s[scores={num=4141..4200}] at @s run scoreboard players set @e[r=480] domain_clasher 0
execute as @s[scores={num=4141..4200}] at @s run scoreboard players set @e[r=480] domain_clasher_id 0
execute as @s[scores={num=4141..4200}] at @s run scoreboard players set @e[r=480] domain_resistancecap 0
execute as @s[scores={num=4141..4200}] at @s run scoreboard players set @e[r=480] domain_resistance 0
execute as @s[scores={num=4141..4200}] at @s run tag @e[r=480] remove domainclashing
execute as @s[scores={num=4141..4200}] at @s run event entity @e[family=domain_clasher,r=80] ds:disappear
execute as @s[scores={num=4141..4200}] at @s run execute as @e[r=480,family=!barrier,type=!ds:incomplete_shrine] at @s run function tpdown
execute as @s[scores={num=4141..4200}] at @s run tag @e[r=480] remove domain_winner
execute as @s[scores={num=4141..4200}] at @s run event entity @s ds:disappear

















# END
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run scoreboard players set @e[r=80,tag=domainclashing] domain_clasher 0
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run scoreboard players set @e[r=80,tag=domainclashing] domain_clasher_id 0
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run scoreboard players set @e[r=80,tag=domainclashing] domain_resistancecap 0
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run scoreboard players set @e[r=80,tag=domainclashing] domain_resistance 0
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run tag @e[r=80] remove domainclashing
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run tag @e[r=80] remove domain_winner
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run event entity @e[family=domain_clasher,r=80] ds:disappear
execute as @s[scores={num=1611..1700}] at @s unless entity @e[family=domain_clasher,family=malevolentshrine] if entity @e[scores={domain=1..},r=80] run event entity @s ds:disappear




