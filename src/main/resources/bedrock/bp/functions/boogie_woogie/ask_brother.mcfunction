execute as @s[scores={move=100..101},type=!player] at @s unless entity @e[tag=askbrother2,r=20] positioned ^^^5 as @e[family=!purecurse,tag=!unselect,r=4.9,scores={move=0,cutscene=0,detect_health=0..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] run tag @s add askbrother2
execute as @s[scores={move=100..101},type=player] at @s unless entity @e[tag=askbrother2,r=20] positioned ^^^5 as @e[family=!purecurse,tag=!spectator,r=4.9,scores={move=0,cutscene=0,detect_health=0..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] run tag @s add askbrother2
camera @s[scores={move=100..101},type=player] fade time 0 0.15 0.15 color 0 0 0
execute as @s[scores={move=100..101}] at @s run camera @p[tag=askbrother2,r=20] fade time 0 0.15 0.15 color 0 0 0



tag @s[scores={move=99..101},tag=!ask_brother] add ask_brother


scoreboard players set @s[scores={ability12=1..199}] ability12 200
scoreboard players set @s Frames 20
scoreboard players set @e[tag=askbrother2,r=20,c=1] Frames 20
scoreboard players set @s Move 20
scoreboard players set @e[tag=askbrother2,r=20,c=1] Move 20
scoreboard players set @s Camera 20
scoreboard players set @e[tag=askbrother2,r=20,c=1] Camera 20
execute as @s[scores={move=5..101}] at @s run tp @s ~~~~ 0
execute as @s[scores={move=5..101}] at @s at @e[tag=askbrother2,r=20,c=1] run tp @e[tag=askbrother2,r=1,c=1] ~~~ facing @s

camera @s[scores={move=41..99},type=player] set minecraft:free pos ^0.5^1.25^1.5 facing ~~1.4~
execute as @s[scores={move=41..99}] at @s run camera @p[tag=askbrother2,r=20] set minecraft:free pos ^0.5^1.25^1.5 facing ~~1.4~


execute as @s[scores={move=80..98},type=player] at @s unless entity @e[tag=askbrother2,r=20] run tellraw @s {"rawtext":[{"text":"§cWho are you talking to? Theres nobody infront of you, snap out of it."}]}
execute as @s[scores={move=80..98}] at @s unless entity @e[tag=askbrother2,r=20] run scoreboard players set @s move 3



playanimation @s[scores={move=4..101}] animation.todo.what_kinda_girls

execute as @s[scores={move=61..101}] at @s run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fI just have to ask..."}]}
execute as @s[scores={move=100}] at @s run playsound mob.todo_asktype1 @a[r=100] ~~1.2~ 99999 1 99999

execute as @s[scores={move=41..50}] at @s run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fWhat kind of woman is your type!?"}]}
execute as @s[scores={move=50}] at @s run playsound mob.todo_asktype2 @a[r=100] ~~1.2~ 99999 1 99999


execute as @s[scores={move=5..40}] at @s as @p[tag=askbrother2,r=20] at @s run camera @s set minecraft:free pos ^0.5^1.25^1.5 facing ~~1.4~
execute as @s[scores={move=5..40},type=player] at @s at @e[tag=askbrother2,r=20,c=1] run camera @s set minecraft:free pos ^0.5^1.25^1.5 facing ~~1.4~

execute as @s[scores={move=40}] at @s as @e[tag=askbrother2,r=20,c=1] at @s run tellraw @a[r=30] {"rawtext":[{"text":"§f< "},{"selector":"@s"},{"text":" §f> §eUhhh..."}]}
execute as @s[scores={move=39..40}] at @s as @p[tag=askbrother2,r=20,c=1,tag=!womantype1,tag=!womantype2,tag=!womantype3,tag=!womantype4,tag=!womantype5,tag=!womantype6,tag=!womantype7,tag=!womantype8,tag=!womantype9,tag=!womantype10,tag=!womantype_correct] at @s run scriptevent ds:what_is_your_type
execute as @s[scores={move=5..40,scroll=80..}] at @s as @e[tag=askbrother2,r=20,c=1,type=!player] run function boogie_woogie/mob_answers

scoreboard players set @s[scores={move=39..40}] scroll 0
scoreboard players set @s[scores={move=5..40}] move 38
scoreboard players add @s[scores={move=5..40}] scroll 1



execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,tag=womantype_correct,r=20] run scoreboard players set @s move 10001
execute as @s[scores={move=1000..1001}] at @s unless entity @e[tag=askbrother2,tag=womantype_correct,r=20] run playanimation @s animation.todo.decline


camera @s[scores={move=1000..1001},type=player] set minecraft:free pos ^0.35^1.35^2.5 facing ~~1.4~
execute as @s[scores={move=1000..1001}] at @s run camera @p[tag=askbrother2,r=20] set minecraft:free pos ^0.35^1.35^2.5 facing ~~1.4~


execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype1] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fI knew it... you're boring."}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype2] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fYou have good taste, but is that all?"}]}
execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype2b] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fYou have good taste."}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype4] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fI knew it... you're boring. More boring than Fushiguro, how can you not have a type at all?"}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype5] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fMy man you have great taste!"}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype6] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fWhat... you better not be referring to children or I'm gonna beat your a** right here, right now."}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype7] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fUh... good for you I guess."}]}

execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype8] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fYou're asking for it now. I'm gonna bash your skull in."}]}


execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype_sus] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fWhat!? What do you mean you like them small!? Is that why you hide your face in that stupid paper bag you sick person!?"}]}


execute as @s[scores={move=960..1001}] at @s if entity @e[tag=askbrother2,r=20,tag=womantype_weaker] run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fWhat!? You're sick!"}]}



execute as @s[scores={move=925..950}] at @s run camera @p[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20] set minecraft:free pos ^3^1.35^0.67 facing ^^1.25^0.25
execute as @s[scores={move=925..950},type=player] at @s if entity @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20] run camera @s set minecraft:free pos ^3^1.35^0.67 facing ^^1.25^0.25

execute as @s[scores={move=949..950}] at @s if entity @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20] run playanimation @s animation.todo.decline2
execute as @s[scores={move=949..950}] at @s at @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] rotated ~ 0 run tp @s ^^^0.15 facing ~~~
execute as @s[scores={move=949..950}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch1 ~~1~
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch2 ~~1~
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch3 ~~1~
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch4 ~~1~
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run camerashake add @a[r=25] 2 0.15
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run playsound mob.punch1 @a[r=25] ~~~ 99999 2 99999
execute as @s[scores={move=948}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run playsound mob.wither.break_block @a[r=25] ~~~ 99999 1.15 99999

execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch1 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch2 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch3 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run particle ds:punch4 ~~1~
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run camerashake add @a[r=25] 4 0.15
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run playsound mob.shock1 @a[r=25] ~~~ 99999 2 99999
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run playsound mob.wither.break_block @a[r=25] ~~~ 99999 1.15 99999
execute as @s[scores={move=915}] at @s run damage @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] 30 override entity @s
execute as @s[scores={move=915}] at @s run tag @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] add customknockback
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run scriptevent ds:knockback 15
execute as @s[scores={move=915}] at @s run scoreboard players set @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] Flourish 12
execute as @s[scores={move=915}] at @s run camera @p[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20] clear
execute as @s[scores={move=915}] at @s as @e[tag=askbrother2,tag=!womantype2,tag=!womantype2b,tag=!womantype5,tag=!womantype7,tag=!womantype_correct,r=20,c=1] at @s run function boogie_woogie/remove_answers

execute as @s[scores={move=800..900}] at @s unless entity @e[tag=askbrother2,tag=womantype_correct,r=20] run scoreboard players set @s move 3



execute as @s[scores={move=10000..}] at @s if entity @e[tag=askbrother2,tag=womantype_correct,r=20] run playanimation @s animation.todo.acception
execute as @s[scores={move=10000..}] at @s run playsound mob.todo_asktype_good1 @a[r=100] ~~1.2~ 99999 1 99999

camera @s[scores={move=10001},type=player] set minecraft:free pos ^2^0.25^0.15 facing ^^0.25^
camera @s[scores={move=9999..10000},type=player] set minecraft:free pos ^2^1.4^0.15 facing ^^2^
camera @s[scores={move=9980},type=player] fade time 2 1 0.25 color 255 255 255
execute as @s[scores={move=9921..10001}] at @s run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§f..."}]}


camera @s[scores={move=9930},type=player] set minecraft:free pos ^0.5^1.85^0.25 facing ^^1.5^
execute as @s[scores={move=9920}] at @s run playsound mob.todo_asktype_good2 @a[r=100] ~~1.2~ 99999 1 99999
execute as @s[scores={move=9861..9920}] at @s run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fYou never lost to anyone in your hometown, huh?"}]}

playanimation @s[scores={move=9870}] animation.todo.acception2
execute as @s[scores={move=9860}] at @s run playsound mob.todo_asktype_good3 @a[r=100] ~~1.2~ 99999 1 99999
camera @s[scores={move=9860}] set minecraft:free pos ^^1.25^3 facing ^^1.35^
camera @s[scores={move=9859..9860}] set minecraft:free ease 5 in_sine pos ^^1.25^5 facing ^^1.35^
execute as @s[scores={move=9800..9860}] at @s run titleraw @a[r=30] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n§fSeem's like we're best friends!"}]}



execute as @s[scores={move=9850}] at @s run scoreboard players add ID brotherID 1
execute as @s[scores={move=9850}] at @s run scoreboard players operation @s brotherID = ID brotherID
execute as @s[scores={move=9850}] at @s run scoreboard players operation @e[tag=askbrother2,tag=womantype_correct,r=20,c=1] brotherID = @s brotherID

execute as @s[scores={move=9840},type=player] if entity @e[family=yuji,r=20,tag=askbrother2,tag=womantype_correct] run tellraw @s {"rawtext":[{"text":"§aYuji is now your '§eBrother§a'! You can now call on him to perform brother combos! (You can only switch with Yuji if you have no other '§eBrother§a'present in the area)"}]}
execute as @s[scores={move=9840},type=player] if entity @p[r=20,tag=askbrother2,tag=womantype_correct] run tellraw @s {"rawtext":[{"text":"§a"},{"selector":"@p[r=20,tag=askbrother2,tag=womantype_correct]"},{"text":" is now your '§eBrother§a'! You can now call on him to perform brother combos! (You can only switch with "},{"selector":"@p[r=20,tag=askbrother2,tag=womantype_correct]"},{"text":" if you have no other '§eBrother§a'present in the area)"}]}
tag @s[scores={move=9840..9842},tag=yuji_itadori_brother] remove yuji_itadori_brother
tag @s[scores={move=9840..9842},tag=yuji_awakened_brother] remove yuji_awakened_brother
execute as @s[scores={move=9830..9840},tag=!yuji_itadori_brother] at @s if entity @e[type=ds:yuji_itadori,r=20,tag=askbrother2,tag=womantype_correct] run tag @s add yuji_itadori_brother
execute as @s[scores={move=9830..9840},tag=!yuji_awakened_brother] at @s if entity @e[type=ds:yuji_itadori_awakened,r=20,tag=askbrother2,tag=womantype_correct] run tag @s add yuji_awakened_brother


camera @s[scores={move=9840},type=player] fade time 2 1 0.5 color 0 0 0
camera @p[tag=askbrother2,tag=womantype_correct,r=20] fade time 2 1 0.5 color 0 0 0
execute as @s[scores={move=9000..9800}] at @s run scoreboard players set @s move 3



execute as @s[scores={move=1..3}] at @s as @e[tag=askbrother2,r=20,c=1] at @s run function boogie_woogie/removewomantype
scoreboard players set @s[scores={move=1..3,scroll=!0}] scroll 0
tag @s[scores={move=1..3},tag=ask_brother] remove ask_brother