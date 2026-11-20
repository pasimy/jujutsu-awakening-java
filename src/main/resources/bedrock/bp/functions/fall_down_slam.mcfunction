tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-1~ true
tp @s ~~-0.5~ true
tp @s ~~-0.5~ true
tp @s ~~-0.5~ true
tp @s ~~-0.5~ true
tp @s ~~-0.5~ true
tp @s ~~-0.1~ true
tp @s ~~-0.1~ true
tp @s ~~-0.1~ true
tp @s ~~-0.1~ true
tp @s ~~-0.1~ true
execute if block ~~-0.5~ water run tag @s[tag=!noslam] add noslam
execute if block ~~-0.5~ lava run tag @s[tag=!noslam] add noslam
scoreboard players set @s[tag=!unselect] Frames 5
tag @s[tag=!Frames] add Frames
playanimation @s animation.slamdown

execute if entity @s[tag=!noslam] run particle ds:crater2 ~~~
execute if entity @s[tag=!noslam] run particle ds:ground_slam2
execute if entity @s[tag=!noslam] run particle ds:ground_slam3
execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:ground_slam2
execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:ground_slam2
execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:ground_slam3
execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:dirt4
execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:dirt0
execute if entity @s[scores={falling=6..},tag=!noslam] run playsound mob.wither.break_block @a[r=50] ~~~ 99999 0.4 99999
execute if entity @s[scores={falling=6..},tag=!noslam] run playsound mob.shock1 @a[r=50] ~~~ 99999 1.4 99999

execute if entity @s[scores={falling=6..},tag=!noslam] run particle ds:ground_slam2
execute if entity @s[scores={falling=12..},tag=!noslam] run particle ds:ground_slam2
execute if entity @s[scores={falling=12..},tag=!noslam] run particle ds:ground_slam3
execute if entity @s[scores={falling=12..},tag=!noslam] run particle ds:dirt4
execute if entity @s[scores={falling=12..},tag=!noslam] run particle ds:dirt0
execute if entity @s[scores={falling=12..},tag=!noslam] run playsound mob.wither.break_block @a[r=50] ~~~ 99999 0.3 99999
execute if entity @s[scores={falling=12..},tag=!noslam] run playsound mob.shock1 @a[r=50] ~~~ 99999 1.1 99999
execute if entity @s[scores={falling=12..},tag=!noslam] run camerashake add @a[r=50] 0.15 0.15 rotational

execute if entity @s[scores={falling=35..},tag=!noslam] run particle ds:large_slam1
execute if entity @s[scores={falling=35..},tag=!noslam] run particle ds:large_slam2
execute if entity @s[scores={falling=35..},tag=!noslam] run particle ds:large_slam3
execute if entity @s[scores={falling=35..},tag=!noslam] run particle ds:crater3
execute if entity @s[scores={falling=35..},tag=!noslam] run playsound mob.wither.break_block @a[r=50] ~~~ 99999 0.35 99999
execute if entity @s[scores={falling=35..},tag=!noslam] run playsound mob.shock1 @a[r=50] ~~~ 99999 0.85 99999
execute if entity @s[scores={falling=35..},tag=!noslam] run camerashake add @a[r=50] 2 0.15 rotational
execute if entity @s[tag=!noslam] run particle ds:dirt2
execute if entity @s[tag=!noslam] run particle ds:leap
execute if entity @s[tag=!noslam] run playsound mob.wither.break_block @a[r=50] ~~~ 99999 0.7 99999
execute if entity @s[tag=!noslam] run playsound random.explode @a[r=50] ~~~ 99999 1.2 99999
execute if entity @s[tag=!noslam] run camerashake add @a[r=10] 1 0.15

execute if entity @s[tag=!noslam] run scoreboard players set @e[tag=!Frames,r=5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame] knockdown 25
execute if entity @s[tag=!noslam] run damage @e[tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] 2 override entity @s
execute if entity @s[tag=!noslam] run scoreboard players operation @e[tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] damage += @s damageadd
execute if entity @s[tag=!noslam] run scoreboard players set @e[type=!player,tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] Stun 25
execute if entity @s[tag=!noslam] run scoreboard players add @e[tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] Hit 3
execute if entity @s[tag=!noslam] if entity @e[tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] run scoreboard players operation @s falling /= two Mode
execute if entity @s[tag=!noslam] run scoreboard players operation @e[tag=!Frames,r=5,tag=!unselect,scores={knockdown=25}] damagehalf += @s falling

scoreboard players set @s[scores={falling=!0}] falling 0
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~
execute unless block ~~~ air run tp @s ~~0.1~