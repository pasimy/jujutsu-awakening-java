scoreboard players set @s[scores={blackflashing=!0}] blackflashing 0
scoreboard players set @s Frames 10
scoreboard players random @s chance 1 2

execute as @s[scores={chance=1..2},tag=limitless] at @s positioned ^^^6 if entity @e[scores={detect_health=0..50},r=5.95,tag=!blackflash1,tag=!blackflash2,tag=!blackflash3,tag=!blackflash4,tag=!nocutscenes,family=!grade4,family=!grade3,tag=filtered_target,tag=!unselect] run tag @s add blackflash_finisher_gojo
execute as @s[scores={chance=1..2},tag=limitless] at @s positioned ^^^6 run tag @e[scores={detect_health=0..50},r=5.95,c=1,tag=!blackflash1,tag=!blackflash2,tag=!blackflash3,tag=!blackflash4,tag=!nocutscenes,family=!grade4,family=!grade3,tag=filtered_target,tag=!unselect] add blackflash_finisher_gojo2

scoreboard players set @s[tag=blackflash_finisher_gojo] cutscene 421
scoreboard players set @s[tag=blackflash_finisher_gojo] Frames 430

scoreboard players set @e[tag=blackflash_finisher_gojo2,r=15,c=1] cutscene 421
scoreboard players set @e[tag=blackflash_finisher_gojo2,r=15,c=1] Frames 430
