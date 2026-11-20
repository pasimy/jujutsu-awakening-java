execute unless entity @s[scores={num=0..}] run scoreboard objectives add num dummy
scoreboard players add @s num 1

scoreboard players set @e[tag=domainclashing,r=50,scores={Stun=0..5}] Stun 30
execute as @s[scores={num=0..}] at @s run execute as @e[tag=domainclashing,r=50] at @s run particle ds:domainclash ~~~
execute as @s[scores={num=0..}] at @s run execute as @e[tag=domainclashing,r=50] at @s run particle ds:domainclash1 ~~~
execute as @s[scores={num=0..}] at @s run execute as @e[tag=domainclashing,r=50] at @s run particle ds:domainclash2 ~~~
execute as @s[scores={num=0..}] at @s run execute as @e[tag=domainclashing,r=50] at @s run particle ds:domainclash3 ~~~
execute as @s[scores={num=0..}] at @s run camerashake add @a[r=33] 0.4 0.08
execute as @s[scores={num=0..}] at @s run scoreboard players set @e[scores={domainstart=4..},r=50] domainstart 3
execute as @s[scores={num=0..}] at @s run scoreboard players set @e[scores={domainCD=0..10},r=50] domainCD 600



execute as @s[scores={num=3}] at @s run camerashake add @a[r=100] 2 0.25 rotational
execute as @s[scores={num=3}] at @s run playsound mob.blasted4 @a[r=100] ~~1~ 99999 0.8 99999
execute as @s[scores={num=3}] at @s run particle ds:domain_clash_shockwave1

execute as @s[scores={num=5}] at @s run camera @a[tag=domainclashing,r=50] set minecraft:free pos ^^3^25 facing ~~~ 
execute as @s[scores={num=5..6}] at @s run camera @a[tag=domainclashing,r=50] set minecraft:free ease 1.33 in_sine pos ^-15^3^15 facing ~~~ 

execute as @s[scores={num=30}] at @s run camera @a[tag=domainclashing,r=50] set minecraft:free pos ^^25^-25 facing ~~~ 
execute as @s[scores={num=30..31}] at @s run camera @a[tag=domainclashing,r=50] set minecraft:free ease 1.33 in_sine pos ^15^25^-15 facing ~~~ 

execute as @s[scores={num=20}] at @s run camerashake add @a[r=100] 2 0.15 rotational
execute as @s[scores={num=20}] at @s run particle ds:domain_clash_shockwave1
execute as @s[scores={num=20}] at @s run particle ds:domain_clash_shockwave2
execute as @s[scores={num=20}] at @s run particle ds:domain_clash_shockwave3
execute as @s[scores={num=20}] at @s run playsound mob.blasted3 @a[r=100] ~~5~ 99999 0.33 99999
execute as @s[scores={num=10}] at @s run playsound mob.fuga_shoot @a[r=100] ~~5~ 99999 0.33 99999

execute as @s[scores={num=30..}] at @s run particle ds:domain_clash_engulf1
execute as @s[scores={num=40..41}] at @s run camera @a[r=48] fade time 0.75 1 1 color 0 0 0

# Summon domain clash main important setup
execute as @s[scores={num=60..65}] at @s positioned ~ 298.85 ~ unless entity @e[type=ds:domain_clash_main,r=48] run summon ds:domain_clash_main ~~~ 
execute as @s[scores={num=60..61}] at @s run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air
execute as @s[scores={num=60..61}] at @s run fill ~33 299 ~33 ~-33 299 ~-33 barrier [] replace air

# Summon barrier on ground
execute as @s[scores={num=63}] at @s run summon ds:domain_barrier "clash_barrier"

# Teleport all players upwards
execute as @s[scores={num=60..64}] at @s run tp @e[tag=!domainclashing,r=50,type=!ds:clash_starting,type=!ds:domain_barrier_white,type=!ds:domain_barrier] ~ 301.5 ~ facing @e[type=ds:domain_clash_main]
execute as @s[scores={num=60..64}] at @s run tp @e[scores={domain_clasher=1},c=1,r=100] ~ 301.5 ~33 facing @e[type=ds:domain_clash_main]
execute as @s[scores={num=60..64}] at @s run tp @e[scores={domain_clasher=2},c=1,r=100] ~ 301.5 ~-33 facing @e[type=ds:domain_clash_main]
execute as @s[scores={num=60..64}] at @s run tp @e[scores={domain_clasher=3},c=1,r=100] ~33 301.5 ~ facing @e[type=ds:domain_clash_main]
execute as @s[scores={num=60..64}] at @s run tp @e[scores={domain_clasher=4},c=1,r=100] ~-33 301.5 ~ facing @e[type=ds:domain_clash_main]


execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_unlimitedvoid] animation.infinite_void_standby2
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_ironmountain] animation.jogo_domain_hold
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_malevolent_shrine] animation.malevolent_shrine_hold
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_incomplete_shrine] animation.incomplete_shrine_hold
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=30,c=4,tag=deploy_perfection] animation.mahito.domain_idle
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_deadly_sentencing] animation.judgeman.domain_hold
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_tempest] animation.kashimo_domain_standby
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_idle] animation.hakari_domain_standby
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_shadow] animation.chimera_domain_standby
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_speech] animation.cursed_speech.domain_hold
execute as @s[scores={num=1..}] at @s run playanimation @e[tag=domainclashing,r=40,c=4,tag=deploy_yuji_domain] animation.yuji_domain_hold

tag @s[tag=!DomainExpansion] add DomainExpansion


# Deploy the domain entities after being teleported up
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=450] at @s run summon ds:infinite_void_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=450] at @s run scoreboard players operation @e[type=ds:infinite_void_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=450] at @s run scoreboard players operation @e[type=ds:infinite_void_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_unlimitedvoid,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=450] at @s run summon ds:malevolent_shrine_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=450] at @s run scoreboard players operation @e[type=ds:malevolent_shrine_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=450] at @s run scoreboard players operation @e[type=ds:malevolent_shrine_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_malevolent_shrine,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=450] at @s run summon ds:incomplete_shrine_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=450] at @s run scoreboard players operation @e[type=ds:incomplete_shrine_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=450] at @s run scoreboard players operation @e[type=ds:incomplete_shrine_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_incomplete_shrine,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=450] at @s run summon ds:iron_mountain_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=450] at @s run scoreboard players operation @e[type=ds:iron_mountain_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=450] at @s run scoreboard players operation @e[type=ds:iron_mountain_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_ironmountain,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=450] at @s run summon ds:perfection_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=450] at @s run scoreboard players operation @e[type=ds:perfection_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=450] at @s run scoreboard players operation @e[type=ds:perfection_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_perfection,r=450] at @s run scoreboard players set @s domainstart 0



execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=450] at @s run summon ds:deadly_sentencing_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=450] at @s run scoreboard players operation @e[type=ds:deadly_sentencing_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=450] at @s run scoreboard players operation @e[type=ds:deadly_sentencing_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_deadly_sentencing,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=450] at @s run summon ds:tempest_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=450] at @s run scoreboard players operation @e[type=ds:tempest_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=450] at @s run scoreboard players operation @e[type=ds:tempest_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_tempest,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=450] at @s run summon ds:idle_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=450] at @s run scoreboard players operation @e[type=ds:idle_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=450] at @s run scoreboard players operation @e[type=ds:idle_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_idle,r=450] at @s run scoreboard players set @s domainstart 0

execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=450] at @s run summon ds:shadow_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=450] at @s run scoreboard players operation @e[type=ds:shadow_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=450] at @s run scoreboard players operation @e[type=ds:shadow_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_shadow,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=450] at @s run summon ds:speech_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=450] at @s run scoreboard players operation @e[type=ds:speech_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=450] at @s run scoreboard players operation @e[type=ds:speech_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_speech,r=450] at @s run scoreboard players set @s domainstart 0


execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=450] at @s run summon ds:yuji_domain_clashing ~~~ facing @e[type=ds:domain_clash_main,c=1]
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=450] at @s run scoreboard players operation @e[type=ds:yuji_domain_clashing,c=1] domain_clasher_id = @s domain_clasher_id
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=450] at @s run scoreboard players operation @e[type=ds:yuji_domain_clashing,c=1] domain_clasher = @s domain_clasher
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=450] at @s run tag @s remove domainlayout
execute as @s[scores={num=65}] at @s run execute as @e[tag=domainclashing,tag=deploy_yuji_domain,r=450] at @s run scoreboard players set @s domainstart 0



event entity @s[scores={num=70..}] ds:disappear
