execute if entity @s[scores={move=100..}] run hud @p[tag=plusultra_victim,r=100] hide hotbar
execute if entity @s[scores={move=100..}] run hud @p[tag=plusultra_victim,r=100] hide progress_bar
execute if entity @s[scores={move=100..}] run hud @p[tag=plusultra_victim,r=100] hide hunger

execute if entity @s[scores={move=8790..}] run scoreboard players set @e[tag=plusultra_victim,r=100,c=1] Stun 25
execute if entity @s[scores={move=8790..}] run scoreboard players set @e[tag=plusultra_victim,r=100,c=1] Camera 25
execute if entity @s[scores={move=8790..}] as @e[tag=plusultra_victim,r=100,c=1] unless entity @s[scores={infinity=11..}] run scoreboard players set @s infinity 20

execute if entity @s[scores={move=8790..}] as @e[tag=plusultra_victim,r=100,c=1] at @s run tp @s ~~~