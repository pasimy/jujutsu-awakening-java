playanimation @s[scores={move=59..60}] animation.delusional.ab3
camera @s[scores={move=60},type=player] fade time 0 0 0.15 color 255 255 255
execute as @s[scores={move=59}] at @s run summon ds:takada_background ~~~
execute as @s[scores={move=59}] at @s run event entity @e[type=ds:takada_background,r=1,c=1] colour_2

tag @s[scores={move=59..60},tag=!delusional3] add delusional3

scoreboard players set @s[scores={move=5..}] Frames 6
scoreboard players set @s[scores={move=5..}] Camera 5
scoreboard players set @s[scores={move=5..}] Move 5

execute as @s[scores={move=1..}] at @s run tp @s ~~~~ 0
execute as @s[scores={move=1..}] at @s run tp @e[type=ds:takada_chan,r=10,c=1] ^-0.5^^-5 facing ^^^10
execute as @s[scores={move=6..}] at @s run tp @e[type=ds:takada_background,r=100,c=1] ^^^-1
execute as @s[scores={move=31..49}] at @s positioned ^^^2.5 run tp @e[scores={damage=0..,Stun=1..},tag=!Frames,tag=!unselect,r=5,c=1] ~~~ facing @s

execute as @s[scores={move=46..}] at @s if block ~~-1~ air run tp @s ~~-1~
execute as @s[scores={move=46..}] at @s if block ~~-0.1~ air run tp @s ~~-0.1~
execute as @s[scores={move=46..}] at @s if block ~~-0.2~ air run tp @s ~~-0.2~
execute as @s[scores={move=46..}] at @s if block ~~-0.4~ air run tp @s ~~-0.4~



camera @s[scores={move=5..},type=player] set minecraft:free pos ^1^1.5^0.1 facing ^^1.5^0.1

scoreboard players set @s[scores={move=51}] atk 2

execute as @s[scores={move=50}] at @s run scriptevent ds:delusional_hit 0,1,1
execute as @s[scores={move=50}] at @s run scriptevent ds:delusional_small 0,1,1
execute as @s[scores={move=50}] at @s positioned ^^^1.5 run playsound mob.wither.shoot @a ~~~ 9999 1.75 9999
execute as @s[scores={move=50}] at @s positioned ^^^1.5 run playsound mob.witch.throw @a ~~~ 9999 0.75 9999
execute as @s[scores={move=50}] at @s positioned ^^^1.5 run camerashake add @a[r=33] 2 0.15
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run scoreboard players operation @e[tag=!Frames,r=2.4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] damage += @s damageadd
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.shock1 @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.punch @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional 0,0,0
execute as @s[scores={move=50}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional_hit 0,0,0
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run damage @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] 10 override entity @s
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run scoreboard players operation @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] damage += @s damageadd
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Evade 10
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run scoreboard players set @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Stun 40
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Hit 7
execute as @s[scores={move=50}] at @s positioned ^^^2.5 run playanimation @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] animation.stunned
execute as @s[scores={move=50},type=player] at @s positioned ^^^1.5 run playsound music.sparkle @s ~~~ 9999 2.5 9999
tp @s[scores={move=50}] ^^^0.5 true


scoreboard players set @s[scores={move=46}] atk 2

execute as @s[scores={move=45}] at @s run scriptevent ds:delusional_hit 0,1,1
execute as @s[scores={move=45}] at @s run scriptevent ds:delusional_small 0,1,1
execute as @s[scores={move=45}] at @s positioned ^^^1.5 run playsound mob.wither.shoot @a ~~~ 9999 1.75 9999
execute as @s[scores={move=45}] at @s positioned ^^^1.5 run playsound mob.witch.throw @a ~~~ 9999 0.75 9999
execute as @s[scores={move=45}] at @s positioned ^^^1.5 run camerashake add @a[r=33] 2 0.15
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run scoreboard players operation @e[tag=!Frames,r=2.4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] damage += @s damageadd
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.shock1 @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.punch @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional 0,0,0
execute as @s[scores={move=45}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional_hit 0,0,0
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run damage @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] 10 override entity @s
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Evade 10
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Hit 7
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run scoreboard players set @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Stun 40
execute as @s[scores={move=45}] at @s positioned ^^^2.5 run playanimation @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] animation.stunned
execute as @s[scores={move=45},type=player] at @s positioned ^^^1.5 run playsound music.sparkle @s ~~~ 9999 2.5 9999
tp @s[scores={move=45}] ^^^0.5 true


scoreboard players set @s[scores={move=31}] atk 2

execute as @s[scores={move=30}] at @s run scriptevent ds:delusional_hit 0,1,1
execute as @s[scores={move=30}] at @s run scriptevent ds:delusional_small 0,1,1
execute as @s[scores={move=30}] at @s positioned ^^^1.5 run playsound mob.wither.shoot @a ~~~ 9999 1.75 9999
execute as @s[scores={move=30}] at @s positioned ^^^1.5 run playsound mob.witch.throw @a ~~~ 9999 0.75 9999
execute as @s[scores={move=30}] at @s positioned ^^^1.5 run camerashake add @a[r=33] 2 0.15
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players operation @e[tag=!Frames,r=2.4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] damage += @s damageadd
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.shock1 @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run playsound mob.punch @a[r=33] ~~~ 99999 2 999999
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional 0,0,0
execute as @s[scores={move=30}] at @s positioned ^^^2.5 as @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] at @s run scriptevent ds:delusional_hit 0,0,0
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run damage @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] 15 override entity @s
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Evade 15
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Hit 7
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players set @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Stun 40
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run scoreboard players add @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] Flourish 4
execute as @s[scores={move=30}] at @s positioned ^^^2.5 run playanimation @e[scores={damage=0..},tag=!Frames,tag=!unselect,r=2.4] animation.stunned
execute as @s[scores={move=30},type=player] at @s positioned ^^^1.5 run playsound music.sparkle @s ~~~ 9999 2 9999
tp @s[scores={move=30}] ^^^0.5 true





execute as @s[scores={move=7},type=player] at @s run camera @s fade time 0.15 0 0.15 color 255 255 255
camera @s[scores={move=1..5},type=player] clear
execute as @s[scores={move=1..5},tag=delusional3] at @s run event entity @e[type=ds:takada_background,c=1] ds:disappear
tag @s[scores={move=1..3},tag=delusional3] remove delusional3