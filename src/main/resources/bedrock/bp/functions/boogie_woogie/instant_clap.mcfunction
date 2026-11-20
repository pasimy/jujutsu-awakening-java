# Setup stuff
scoreboard players random @s chance2 1 3

# Clapped animation
playanimation @s[scores={chance2=1}] animation.todo.clap1
playanimation @s[scores={chance2=2}] animation.todo.clap2
playanimation @s[scores={chance2=3}] animation.todo.clap3

tag @s[tag=itemUse:ds:boogie_woogie1,tag=!feinted] add feinted

playsound mob.clap @a[r=100] ~~1~ 999999 1 999999
execute if entity @s[tag=feinted] run playsound mob.wither.shoot @a[r=50] ~~1~ 99999 3 99999

tag @s[tag=!swapper] add swapper

# Swap logic
execute as @s[scores={move=3,BoogieSelfID=1..}] at @s positioned ~~~ as @e[scores={BoogieTargetID=1..},r=100,tag=!unselect,tag=!heavenlyrestriction,tag=!swapper] if score @s BoogieTargetID = @e[tag=swapper,r=1,c=1] BoogieSelfID run function boogie_woogie/swap
execute if entity @s[tag=!just_swapped] positioned ^^^5.05 run function boogie_woogie/swap_notarget

# Cleanup
tag @s[tag=swapper] remove swapper
tag @s[tag=feinted] remove feinted
tag @s[tag=just_swapped] remove just_swapped
scoreboard players add @s Disabled 5