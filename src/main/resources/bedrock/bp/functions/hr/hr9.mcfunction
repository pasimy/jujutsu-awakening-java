playanimation @s[scores={move=16}] animation.h_ground_slam
tag @s[scores={move=1..2},tag=form9] remove form9

tag @s[scores={move=11..,Stun=1..},tag=form9] remove form9
playanimation @s[scores={move=11..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=11..,Stun=1..}] move 0

scoreboard players set @s[scores={move=6..11}] Frames 4
scoreboard players set @s[scores={move=6..11}] Move 4
scoreboard players set @s[scores={move=6..11}] Camera 4

execute as @s[scores={move=14..15}] at @s if block ~~-0.1~ air run scriptevent ds:downfall
execute as @s[scores={move=10}] at @s if block ~~-1~ air run tp @s ~~-1~
execute as @s[scores={move=10}] at @s if block ~~-0.4~ air run tp @s ~~-0.4~
execute as @s[scores={move=10}] at @s if block ~~-0.2~ air run tp @s ~~-0.2~
execute as @s[scores={move=10}] at @s if block ~~-0.1~ air run tp @s ~~-0.1~
tp @s[scores={move=1..10}] ~~~

execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run playsound random.explode @a[r=100] ~~~ 99999 0.6 99999
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run playsound random.explode @a[r=100] ~~~ 99999 0.45 99999
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run playsound mob.wither.break_block @a[r=100] ~~~ 99999 0.5 99999
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run playsound mob.wither.break_block @a[r=100] ~~~ 99999 0.35 99999
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run playsound mob.wither.shoot @a[r=100] ~~~ 99999 0.5 99999


execute as @s[scores={move=10}] at @s run function damages/blunt_damage

execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:ground_slam1
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:ground_slam2
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:ground_slam3
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:ground_slam4
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:large_slam2
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:crater3
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run particle ds:leap
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run camerashake add @a[r=20] 3 0.3

execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run tag @e[tag=!Frames,r=4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=!filtered_target] add filtered_target
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run scoreboard players set @e[tag=!Frames,r=2.54,tag=filtered_target,tag=!unselect] knock 40
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run damage @e[tag=!Frames,r=4,tag=filtered_target,tag=!unselect] 7 override entity @s
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run scoreboard players set @e[tag=!Frames,r=4,tag=filtered_target,tag=!unselect] Stun 20
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run scoreboard players add @e[tag=!Frames,r=4,tag=filtered_target,tag=!unselect] Hit 5
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run scoreboard players add @e[tag=!Frames,r=4,tag=filtered_target,tag=!unselect] Evade 8
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run scoreboard players operation @e[tag=!Frames,r=4,tag=filtered_target,tag=!unselect] damage += @s damageadd
execute as @s[scores={move=10}] at @s unless block ~~-0.25~ air run summon ds:knockback ~~~
