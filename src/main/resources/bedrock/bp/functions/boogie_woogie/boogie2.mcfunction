# Setup stuff
scoreboard players random @s[scores={move=8..}] chance2 1 3


# Clapped animation
playanimation @s[scores={move=8..,chance2=1}] animation.todo.clap1
playanimation @s[scores={move=8..,chance2=2}] animation.todo.clap2
playanimation @s[scores={move=8..,chance2=3}] animation.todo.clap3

tag @s[scores={move=4..},tag=itemUse:ds:boogie_woogie1,tag=!feinted] add feinted

execute as @s[scores={move=4}] at @s run playsound mob.clap @a[r=100] ~~1~ 999999 1 999999
execute as @s[scores={move=4},tag=feinted] at @s run playsound mob.wither.shoot @a[r=50] ~~1~ 99999 3 99999
scoreboard players set @s[scores={move=3..4},tag=feinted] move 2

tag @s[scores={move=3},tag=!swapper] add swapper

execute as @s[scores={move=3,BoogieSelfID=1..},tag=!target_defined] at @s as @e[scores={BoogieTargetID=1..},r=100,tag=!unselect,tag=!heavenlyrestriction,tag=!swapper] if score @s BoogieTargetID = @e[tag=swapper,r=1,c=1] BoogieSelfID run tag @e[tag=swapper,r=1,c=1] add target_defined
tellraw @s[scores={move=3},tag=!target_defined] {"rawtext":[{"text":"§cYou need to select a target for this first and then face the other target you want to swap.\n( §aPunch §c)."}]}


execute as @s[scores={move=3,BoogieSelfID=1..}] at @s as @e[scores={BoogieTargetID=1..},r=100,tag=!unselect,tag=!heavenlyrestriction,tag=!swapper] if score @s BoogieTargetID = @e[tag=swapper,r=1,c=1] BoogieSelfID unless entity @s[scores={Camera=1..},tag=Frames] unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] positioned ^^^5.05 run function boogie_woogie/swap_others
execute as @s[scores={move=3,BoogieSelfID=1..},tag=!just_swapped] at @s as @e[scores={BoogieTargetID=1..},r=100,tag=!unselect,tag=!heavenlyrestriction,tag=!swapper] if score @s BoogieTargetID = @e[tag=swapper,r=1,c=1] BoogieSelfID unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] at @s[scores={Camera=1..,move=1..},tag=Frames] unless entity @e[scores={Camera=5..,Stun=5..},r=15,tag=!unselect] positioned ^^^5.05 run function boogie_woogie/swap_others

tag @s[scores={move=3},tag=target_defined] remove target_defined
tag @s[scores={move=3},tag=swapper] remove swapper
tag @s[scores={move=3},tag=just_swapped] remove just_swapped

scoreboard players set @s[scores={move=1..2,chance2=!0}] chance2 0
tag @s[scores={move=1..2},tag=feinted] remove feinted
tag @s[scores={move=1..2},tag=form2] remove form2

