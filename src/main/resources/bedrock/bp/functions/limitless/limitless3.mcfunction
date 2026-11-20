playanimation @s[scores={move=40}] animation.reversal_red1


tag @s[scores={move=1..2},tag=form3] remove form3

tag @s[scores={move=32..,Stun=1..},tag=form3] remove form3
playanimation @s[scores={move=32..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=32..,Stun=1..}] move 0

effect @s[scores={move=20..}] slow_falling 1 9 true
scoreboard players set @s[scores={move=1..}] Frames 4
scoreboard players set @s[scores={move=1..}] Move 4

execute as @s[scores={move=18..}] at @s run camerashake add @a[r=15] 0.1 0.1
camera @s[scores={move=38}] fade time 0.1 0.2 0.15 color 0 0 0

execute as @s[scores={move=25}] at @s run camera @a[r=20] fade time 0.45 0 1 color 255 75 75

execute as @s[scores={move=35}] at @s run playsound mob.red1 @a ~~~ 100000 0.5 100000
execute as @s[scores={move=16}] at @s run playsound mob.shock2 @a ~~~ 100000 0.25 100000
execute as @s[scores={move=16}] at @s run playsound mob.shock1 @a ~~~ 100000 1 100000

execute as @s[scores={move=15..16}] at @s run camerashake add @a[r=40] 2 0.15
execute as @s[scores={move=15..22}] at @s run particle ds:red_ex1 ~~1~

execute as @s[scores={move=15..16}] at @s run particle ds:red_ex2 ~~1~
execute as @s[scores={move=15..16}] at @s run particle ds:red_ex3 ~~1~
execute as @s[scores={move=15..16}] at @s run particle ds:red_ex4 ~~1~
execute as @s[scores={move=15..16}] at @s run particle ds:red_ex5 ~~1~
execute as @s[scores={move=15..16}] at @s run particle ds:red_ex6 ~~1~

execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:crater3
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:rubble3 ~~~2
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:rubble3 ~~~-2
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:rubble3 ~2~~
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:rubble3 ~-2~~
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run particle ds:rubble3 ~~~
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run playsound random.explode @a ~~~ 1500 0.3 1500
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run playsound random.explode @a ~~~ 1500 0.7 1500
execute as @s[scores={move=15..16}] at @s unless block ~~-0.25~ air run playsound mob.wither.break_block @a ~~~ 1500 0.44 1500

execute as @s[scores={move=8..14}] at @s run tp @s ~~~
execute as @s[scores={move=14..17}] at @s as @e[r=15,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s run tp @s ~~~ facing @e[scores={move=14..17},r=15,c=1]
execute as @s[scores={move=13}] at @s run scoreboard players set @e[r=15,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] knockdown 95
execute as @s[scores={move=13}] at @s run damage @e[r=15,tag=!Frames,tag=!unselect,scores={knockdown=95}] 35 override entity @s
execute as @s[scores={move=13}] at @s run scoreboard players add @e[r=15,tag=!Frames,tag=!unselect,scores={knockdown=95}] Hit 10
execute as @s[scores={move=13}] at @s run scoreboard players add @e[r=15,tag=!Frames,tag=!unselect,scores={knockdown=95}] Evade 20
execute as @s[scores={move=13}] at @s positioned ~~-7.5~ as @e[r=7.49,tag=!Frames,tag=!unselect,scores={knockdown=95}] at @s if block ~~-1~ air run scoreboard players set @s Flourish 95
execute as @s[scores={move=13}] at @s rotated ~ 0 positioned ^-8.5^-7.5^ as @e[r=7.49,tag=!Frames,tag=!unselect,scores={knockdown=95}] at @s if block ~~-1~ air run scoreboard players set @s Flourish 95
execute as @s[scores={move=13}] at @s rotated ~ 0 positioned ^8.5^-7.5^ as @e[r=7.49,tag=!Frames,tag=!unselect,scores={knockdown=95}] at @s if block ~~-1~ air run scoreboard players set @s Flourish 95
execute as @s[scores={move=13}] at @s positioned ~~7.5~ run effect @e[r=7.5,tag=!Frames,tag=!unselect,scores={knockdown=95}] levitation 1 15 true
execute as @s[scores={move=13}] at @s rotated ~ 0 positioned ^-8.5^7.5^ run effect @e[r=7.5,tag=!Frames,tag=!unselect,scores={knockdown=95}] levitation 1 15 true
execute as @s[scores={move=13}] at @s rotated ~ 0 positioned ^8.5^7.5^ run effect @e[r=7.5,tag=!Frames,tag=!unselect,scores={knockdown=95}] levitation 1 15 true
execute as @s[scores={move=13}] at @s run summon ds:red_reverse ~~~
execute as @s[scores={move=13}] at @s run function damages/explosion_damage
