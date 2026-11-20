#@s = target
#@e = swapper
#~~~ = swapper location

tag @e[tag=swapper,r=1,c=1,tag=!just_swapped] add just_swapped

#selectswap
execute unless entity @s[scores={Camera=1..},tag=Frames] unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] run tag @s[tag=!swapped] add swapped
execute unless entity @s[scores={cutscene=1..},tag=Frames] unless entity @s[scores={Frames=11..},tag=Frames] unless entity @s[scores={infinity=1..},tag=!limitless] at @s[scores={Camera=1..,move=1..},tag=Frames] unless entity @e[scores={Camera=5..,Stun=5..},r=15,tag=!unselect] run tag @s[tag=!swapped] add swapped

#swap
execute if entity @s[tag=swapped] run scoreboard players set @e[tag=swapper,c=1,tag=swapkick] move 1001

execute if entity @s[tag=swapped] run summon gg:impact_frame ~~~
execute if entity @s[tag=swapped] run particle ds:boogie_woogie_tp ~~~
execute if entity @s[tag=swapped] run particle ds:boogie_woogie_tp2 ~~~
execute at @s[tag=swapped] run particle ds:boogie_woogie_tp ~~~
execute at @s[tag=swapped] run particle ds:boogie_woogie_tp2 ~~~
execute at @s[tag=swapped] run tp @e[tag=swapper,c=1] ~~~
execute at @s[tag=swapped] run tp @e[tag=swapper,c=1,tag=!swapkick] ~~~ facing ^^^10
tp @s[tag=swapped] ~~~
execute unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={knock=1..}] unless entity @s[scores={knockdown=1..}] unless entity @s[scores={Flourish=1..}] unless entity @s[scores={atk=1..}] run tp @s[tag=swapped] ~~~ facing ^^^10

#kill @e[type=ds:pebble,tag=swapped]

#cleanup
tag @e[tag=swapkick] remove swapkick
tag @e[tag=swapper] remove swapper
tag @s[tag=swapped] remove swapped