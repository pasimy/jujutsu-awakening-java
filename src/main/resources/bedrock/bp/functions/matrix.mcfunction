execute in overworld positioned 99999 320 99999 run tp @p[tag=matrix,rm=3000] ~ 330 ~
particle ds:matrix_floor ~ 319.9 ~
particle ds:matrix_floor ~ 360 ~
fill ~6 319 ~6 ~-6 319 ~-6 barrier [] replace
time set midnight
effect @s darkness 20 1 true
fog @s push minecraft:fog_soulsand_valley Matrix
effect @s clear night_vision
scoreboard players set @s[scores={Disabled=0..20}] Disabled 100
scoreboard players set @s[scores={Disabled2=0..20}] Disabled2 100