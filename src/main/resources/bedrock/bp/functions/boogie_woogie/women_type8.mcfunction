scoreboard players set @e[tag=ask_brother,r=20,c=1,scores={move=1..101}] move 1001
tellraw @a[r=30] {"rawtext":[{"text":"§f< "},{"selector":"@s"},{"text":" §f> §eYour mother."}]}
tag @s[tag=!womantype8] add womantype8
