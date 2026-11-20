execute if entity @s[scores={infinity=1..},tag=Frames] run scoreboard players set @s Hit 0

scoreboard players add @s[scores={Hit=1},tag=530kiq] Evade 2
execute as @s[tag=alleycat,scores={Hit=1..,combat=0}] at @s run playsound mob.bat.takeoff @a ~~~ 0.5 1.1
execute as @s[tag=alleycat,scores={Hit=1..,combat=0}] at @s run particle mcdp_v:knockback_roar_particle_2 ~~~
effect @s[tag=alleycat,scores={Hit=1..,combat=0}] speed 15 5 true
execute as @s[scores={Hit=1..},tag=!instant_body] at @s unless entity @s[type=ds:duke,scores={endurance=1..}] run particle ds:blood ~~0.1~
execute as @s[scores={Hit=1..},tag=!instant_body] at @s unless entity @s[type=ds:duke,scores={endurance=1..}] run particle ds:blood_splat ~~0.1~
execute as @s[scores={Hit=1..,damage_taken=15..},tag=instant_body] at @s unless score @s damage_taken = @s detect_health run particle ds:blood ~~0.1~
execute as @s[scores={Hit=1..,damage_taken=15..},tag=instant_body] at @s unless score @s damage_taken = @s detect_health run particle ds:blood_splat ~~0.1~
execute unless entity @s[scores={combat=1..}] run scoreboard players set @s[scores={Hit=1..},tag=!Frames] combat 800
scoreboard players remove @s[scores={Hit=1..}] Hit 1

