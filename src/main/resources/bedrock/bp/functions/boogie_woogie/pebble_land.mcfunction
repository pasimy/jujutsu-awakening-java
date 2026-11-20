execute if block ~~-1~ air if block ~~-2~ air run scoreboard players set @e[r=2.5,tag=!pebblethrown,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] aircom 60
scoreboard players set @e[r=2.5,tag=!pebblethrown,tag=!unselect,scores={aircom=60}] Stun 45
particle ds:large_impact1 ~~0.15~

playanimation @e[tag=pebblethrown,r=100,c=1] animation.todo.fast_clap
execute as @e[tag=pebblethrown,r=100,c=1] at @s run playsound mob.clap @a[r=100] ~~1~ 9999 1 9999
execute as @e[tag=pebblethrown,r=100,c=1] at @s run camerashake add @a[r=100] 0.15 0.15
execute as @e[tag=pebblethrown,r=100,c=1] at @s run summon gg:impact_frame ~~~

execute as @e[tag=pebblethrown,r=100,c=1] at @s run particle ds:boogie_woogie_tp ~~~
execute as @e[tag=pebblethrown,r=100,c=1] at @s run particle ds:boogie_woogie_tp2 ~~~
particle ds:boogie_woogie1 ~~~
particle ds:boogie_woogie1 ~~~
particle ds:boogie_woogie2 ~~~
particle ds:boogie_woogie2 ~~~

execute as @e[tag=pebblethrown,r=100,c=1] at @s run summon ds:rift ~~~ facing ^^^10 none swapper_location
execute as @e[tag=pebblethrown,r=100,c=1] at @s run event entity @e[name=swapper_location,type=ds:rift,r=1,c=1] ds:disappear
execute positioned ~~~ run tp @e[tag=pebblethrown,r=100,c=1] ~~~
execute positioned ~~~ run tp @e[tag=pebblethrown,r=100,c=1] ~~~ facing @e[r=2.5,tag=!pebblethrown,tag=!unselect,scores={aircom=60}]
tp @s @e[name=swapper_location,type=ds:rift,r=100,c=1]
execute as @e[tag=pebblethrown,r=100,c=1] at @s if block ~~-1~ air if block ~~-2~ air run scoreboard players set @s aircom 60
particle ds:dirt03 ~~~
tag @e[tag=pebblethrown,c=1] remove pebblethrown
tag @s[tag=!pebbleswapped] add pebbleswapped
#kill @s