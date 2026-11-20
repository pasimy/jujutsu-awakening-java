fill ~33~1~33~-33~-1~-33 stone [] replace diamond_ore
fill ~33~1~33~-33~-1~-33 stone [] replace emerald_ore
fill ~33~1~33~-33~-1~-33 netherrack [] replace ancient_debris
fill ~15~15~15~-15~-15~-15 stone [] replace diamond_ore
fill ~15~15~15~-15~-15~-15 stone [] replace emerald_ore
fill ~15~15~15~-15~-15~-15 netherrack [] replace ancient_debris


playsound random.orb @s[type=player] ~~~ 9999 0.5 9999
scoreboard players set @s[scores={chance=!0}] chance 0
tellraw @s[type=player] {"rawtext":[{"text":"§d+1 Miracle"}]}
scoreboard players add @s miracles 1
scoreboard players set @s[scores={miracles=7..}] miracles 6
