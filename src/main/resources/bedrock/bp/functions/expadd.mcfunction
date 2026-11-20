execute unless score exp_multiplier Mode = one Mode unless score exp_multiplier Mode = eleven Mode run scoreboard players operation @s expadd *= exp_multiplier Mode
execute unless score exp_multiplier Mode = eleven Mode run scoreboard players operation @s Exp += @s expadd

scoreboard players set @s[scores={expadd=1..}] expadd 0

