execute as @e[r=64] at @s run function cancel_attack
event entity @e[r=364] ds:disappear
tag @e[r=64] remove domainlayout
tag @e[r=64] remove domainimmune
scoreboard players set @e[r=64] domain_clasher 0
scoreboard players set @e[r=64] domain_clasher_id 0
scoreboard players set @e[r=64] domain 0
scoreboard players set @e[r=64] domainstart 0
tag @e[r=64] remove domain_winner
tag @e[r=64,tag=deploy_unlimitedvoid] remove deploy_unlimitedvoid
tag @e[r=64,tag=deploy_malevolent_shrine] remove deploy_malevolent_shrine
tag @e[r=64,tag=deploy_incomplete_shrine] remove deploy_incomplete_shrine
tag @e[r=64,tag=deploy_ironmountain] remove deploy_ironmountain
tag @e[r=64,tag=deploy_perfection] remove deploy_perfection
tag @e[r=64,tag=deploy_deadly_sentencing] remove deploy_deadly_sentencing
tag @e[r=64,tag=deploy_tempest] remove deploy_tempest
tag @e[r=64,tag=deploy_idle] remove deploy_idle
tag @e[r=64,tag=deploy_shadow] remove deploy_shadow
tag @e[r=64,tag=deploy_speech] remove deploy_speech
tag @e[r=64,tag=deploy_yuji_domain] remove deploy_yuji_domain
tag @e[r=64] remove domainclashing
function domain_end
stopsound @a[r=64]