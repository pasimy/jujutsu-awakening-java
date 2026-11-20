# Setup stuff
scoreboard players random @s[scores={move=8..}] chance2 1 3


# Clapped animation
playanimation @s[scores={move=8..,chance2=1}] animation.todo.clap1
playanimation @s[scores={move=8..,chance2=2}] animation.todo.clap2
playanimation @s[scores={move=8..,chance2=3}] animation.todo.clap3

tag @s[scores={move=4..},tag=itemUse:ds:boogie_woogie3,tag=!feinted] add feinted



execute as @s[scores={move=4}] at @s run playsound mob.clap @a[r=100] ~~1~ 999999 1 999999
execute as @s[scores={move=4},tag=feinted] at @s run playsound mob.wither.shoot @a[r=50] ~~1~ 99999 3 99999
scoreboard players set @s[scores={move=3..4},tag=feinted] move 2

tag @s[scores={move=3},tag=!swapper] add swapper

execute as @s[scores={move=3,brotherID=1..}] at @s positioned ~~~ as @e[scores={brotherID=1..},r=100,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] if score @s brotherID = @e[tag=swapper,r=1,c=1] brotherID run function boogie_woogie/swap_brother

execute as @s[scores={move=3},tag=yuji_itadori_brother,tag=!yuji_awakened_brother,tag=!just_swapped] at @s positioned ~~~ as @e[type=ds:yuji_itadori,r=100,c=1,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/swap_brother
execute as @s[scores={move=3},tag=yuji_awakened_brother,tag=!yuji_itadori_brother,tag=!just_swapped] at @s positioned ~~~ as @e[type=ds:yuji_itadori_awakened,r=100,c=1,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/swap_brother
execute as @s[scores={move=3},tag=yuji_awakened_brother,tag=yuji_itadori_brother,tag=!just_swapped] at @s positioned ~~~ as @e[family=yuji,r=100,c=1,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/swap_brother

tag @s[scores={move=3},tag=swapper] remove swapper
tag @s[scores={move=3},tag=just_swapped] remove just_swapped


scoreboard players set @s[scores={move=1..2,chance2=!0}] chance2 0
tag @s[scores={move=1..2},tag=feinted] remove feinted
tag @s[scores={move=1..2},tag=form5] remove form5

