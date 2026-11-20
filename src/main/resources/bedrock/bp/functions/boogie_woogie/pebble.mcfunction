execute unless entity @s[scores={Deleter=0..}] run scoreboard players set @s Deleter 33
particle ds:cursed_energy_hand1 ~~~
#execute as @e[scores={Stun=5..},type=!ds:pebble,r=4] at @s if block ~~-1~ air if block ~~-2~ air run tp @e[type=ds:pebble,r=5] ~~~
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run summon gg:impact_frame ~~~
execute if entity @s[tag=!pebbleswapped] if entity @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run particle ds:boogie_woogie_tp ~~~
execute if entity @s[tag=!pebbleswapped] if entity @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run particle ds:boogie_woogie_tp2 ~~~
execute if entity @s[tag=!pebbleswapped] run playanimation @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] animation.todo.fast_clap
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run particle ds:boogie_woogie_tp ~~~
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run particle ds:boogie_woogie_tp2 ~~~
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run playsound mob.clap @a[r=100] ~~1~ 99999 1.25 9999
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run summon ds:rift ~~~ facing ^^^10 none swapper_location
execute if entity @s[tag=!pebbleswapped] at @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run event entity @e[name=swapper_location,type=ds:rift,r=1,c=1] ds:disappear
execute if entity @s[tag=!pebbleswapped] run tp @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] ~~~
tp @s[tag=!pebbleswapped] @e[name=swapper_location,type=ds:rift,r=100,c=1]
execute if entity @s[tag=!pebbleswapped] if entity @p[tag=boogie_woogie,scores={punch=1},r=100,tag=!spectator] run tag @s add pebbleswapped