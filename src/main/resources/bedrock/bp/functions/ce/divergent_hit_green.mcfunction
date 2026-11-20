playsound random.explode @a[r=40] ~~~ 99999 0.75 99999
playsound random.explode @a[r=40] ~~~ 99999 2.2 99999
playsound random.explode @a[r=40] ~~~ 99999 1.25 99999
playsound random.explode @a[r=40] ~~~ 99999 1.5 99999
playsound random.explode @a[r=40] ~~~ 99999 1.4 99999
playsound random.explode @a[r=40] ~~~ 99999 2.2 99999
playsound mob.stomp @a[r=40] ~~~ 99999 0.35 99999
execute at @s positioned ^^^3 run scoreboard players add @e[tag=!Frames,r=2.95,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame] damage 2
effect @a[r=4] night_vision 1 1 true
camerashake add @a[r=20] 4 0.25 positional
execute at @s run function damages/blunt_damage
particle ds:punch1 ~~~
particle ds:punch2 ~~~
particle ds:punch3 ~~~
particle ds:punch4 ~~~
particle ds:blood ~~0.1~
particle ds:heavy_impact1 ~~~
particle ds:heavy_impact5 ~~~
particle ds:heavy_impact1 ~~~
particle ds:divergent_ac1
particle ds:divergent_acgreen2
particle ds:divergent_acgreen3
particle ds:divergent_ac4
particle ds:divergent_ac5
particle ds:divergent_acgreen6


