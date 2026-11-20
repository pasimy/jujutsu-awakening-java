event entity @s[scores={Deleter=0..1}] ds:disappear
execute as @e[type=!ds:domain_barrier,r=24,tag=!domainlayout,tag=!domainactive] at @s unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run tp @s ^^1^-1.5 facing @e[type=ds:domain_barrier,c=1]

execute if entity @e[scores={atk=1..},r=26] at @s run damage @s 5 suicide 
execute if entity @e[scores={atk=1..},r=26] at @s run playsound mob.distort3 @a[r=100] ~~5~ 99999 1.5 99999
execute as @e[scores={atk=1..},r=26] at @s run particle ds:large_impact1 ^^1^1

execute as @s[name=!"clash_barrier"] at @s unless entity @e[scores={domainstart=1..},r=40] unless entity @e[scores={domain=1..},r=40] positioned ~ 300 ~ unless entity @e[tag=DomainExpansion,r=100] unless entity @e[scores={domainstart=1..},r=40] unless entity @e[scores={domain=1..},r=40] run kill @s
execute as @s[scores={detect_health=0..1},name="clash_barrier"] at @s positioned ~ 300 ~ if entity @e[type=ds:domain_clash_main,r=40] run effect @s instant_health 1 10 true
execute as @s[scores={detect_health=0..1},name="clash_barrier"] at @s positioned ~ 300 ~ if entity @e[type=ds:domain_clash_main,r=40] run scoreboard players set @s detect_health 500


execute if entity @s[scores={detect_health=0..1}] at @s positioned ~ 300 ~ run scoreboard players set @e[family=damage,r=100,scores={Deleter=32..}] Deleter 31
execute if entity @s[scores={detect_health=0..1}] at @s run particle ds:domain_smash1_b
execute if entity @s[scores={detect_health=0..1}] at @s run particle ds:domain_smash2_b
execute if entity @s[scores={detect_health=0..1}] at @s run particle ds:domain_smash3_b
execute if entity @s[scores={detect_health=0..1}] at @s run execute as @a[r=50] at @s run playsound random.glass @a[r=100] ~~1~ 99999 0.5 99999
execute if entity @s[scores={detect_health=0..1}] at @s run event entity @e[family=barrier,r=60] ds:disappear

# Stop People using Domains when a barrier is nearby
execute if entity @e[scores={domainstart=1..},r=48] run execute as @e[scores={domainstart=1..},c=1,r=48] at @s run function cancel_attack

scoreboard players set @e[r=80,scores={domainCD=0..1}] domainCD 100

execute if block ~~-3~ air run tp @s ~~-3~
execute as @s[name="clash_barrier"] at @s run event entity @e[name=!"clash_barrier",family=barrier,type=!ds:domain_clash_main,type=!ds:clash_starting,type=!ds:domain_barrier_inside,family=!domain_clasher,r=50] ds:disappear