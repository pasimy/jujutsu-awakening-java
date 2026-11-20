playanimation @s[scores={move=40..41}] animation.delusional.ab1
execute as @s[scores={move=40..41}] at @s run playanimation @e[type=ds:takada_chan,r=10,c=1] animation.delusional.ab1

tag @s[scores={move=40..41},tag=!delusional1] add delusional1



scoreboard players set @s[scores={move=5..32}] Frames 6
scoreboard players set @s[scores={move=5..32}] Move 5
scoreboard players set @s[scores={move=5..32}] Camera 5
tp @s[scores={move=1..}] ~~~
execute as @s[scores={move=1..}] at @s rotated ~ 0 run tp @e[type=ds:takada_chan,r=10,c=1] ^-0.5^^-0.85 facing ^^^5



execute as @s[scores={move=35},type=player] at @s positioned ^^^1.5 run playsound music.sparkle @s ~~~ 9999 0.5 9999
execute as @s[scores={move=25..35}] at @s run scriptevent ds:delusional_small 0,0,0
execute as @s[scores={move=31}] at @s positioned ^^^1.5 run playsound mob.witch.throw @a ~~~ 9999 0.75 9999
execute as @s[scores={move=30}] at @s positioned ^^^1.5 run camerashake add @a[r=33] 2 0.15
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players set @e[tag=!Frames,r=2.4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] knockdown 90
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.shock1 @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional 0,0,0
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional_hit 0,0,0
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run damage @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] 10 override entity @s
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players operation @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] damage += @s damageadd
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] Evade 10
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] Hit 7
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players set @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] Stun 30
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run tag @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4,tag=!noStunnedAnim] add noStunnedAnim
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run effect @e[scores={knockdown=90},tag=!Frames,tag=!unselect,r=2.4] levitation 1 17 true

execute as @s[scores={move=28..30}] at @s run summon ds:knockback ~~~

execute as @s[scores={move=30}] at @s run event entity @e[type=ds:takada_chan,r=10,c=1] takada_face_lookright



camera @s[scores={move=30},type=player] fade time 0 0 0.15 color 255 255 255
execute as @s[scores={move=29},type=player] at @s rotated ~ 0 run camera @s set minecraft:free pos ^1.5^1.5^0.1 facing ^^1.5^0.1
execute as @s[scores={move=29}] at @s run summon ds:takada_background ~~~
execute as @s[scores={move=29}] at @s run event entity @e[type=ds:takada_background,r=1,c=1] colour_2

camera @s[scores={move=7},type=player] fade time 0.15 0 0.15 color 255 255 255



execute as @s[scores={move=5}] run event entity @e[type=ds:takada_background,c=1] ds:disappear
execute as @s[scores={move=1..5}] at @s run event entity @e[type=ds:takada_chan,r=10,c=1] takada_face_default
camera @s[scores={move=1..5},type=player] clear
tag @s[scores={move=1..3},tag=delusional1] remove delusional1