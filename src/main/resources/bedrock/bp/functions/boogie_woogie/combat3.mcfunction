playanimation @s[scores={move=35..36}] animation.todo.divebomb

scoreboard players set @s[scores={move=30..}] Move 25

playanimation @s[scores={move=30..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=30..,Stun=1..}] move 3

tag @s[scores={move=1..3},tag=wep3] remove wep3

tp @s[scores={move=28..}] ~~-1~ true
tp @s[scores={move=28..}] ~~-0.1~ true
tp @s[scores={move=28..}] ~~-0.2~ true
tp @s[scores={move=28..}] ~~-0.4~ true



execute as @s[scores={move=27}] at @s run camerashake add @a[r=15] 2 0.15
execute as @s[scores={move=27}] at @s run playsound mob.wither.break_block @a[r=30] ~~~ 99999 1 99999
execute as @s[scores={move=27}] at @s run playsound random.explode @a[r=30] ~~~ 99999 1 99999
execute as @s[scores={move=27}] at @s run playsound mob.wither.shoot @a[r=30] ~~~ 99999 2 99999
execute as @s[scores={move=27}] at @s run particle ds:ground_slam1 ~~~
execute as @s[scores={move=27}] at @s run particle ds:ground_slam2 ~~~
execute as @s[scores={move=27}] at @s run particle ds:ground_slam3 ~~~
execute as @s[scores={move=27}] at @s run particle ds:leap ~~~
execute as @s[scores={move=27}] at @s unless block ~~-0.25~ air unless block ~~-0.25~ water run particle ds:rubble3 ~~~
execute as @s[scores={move=27}] at @s unless block ~~-0.25~ air unless block ~~-0.25~ water run particle ds:ground_pound1 ~~~
execute as @s[scores={move=27}] at @s run particle ds:ground_pound3 ~~~
execute as @s[scores={move=27}] at @s run particle ds:ground_pound4 ~~~
execute as @s[scores={move=27}] at @s run scriptevent ds:leapup

execute as @s[scores={move=15..20}] at @s if block ~~-0.5~ air run scriptevent ds:downfall
execute as @s[scores={move=15..20}] at @s if block ~~-0.5~ air run particle ds:dirt03

tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-1~ true
tp @s[scores={move=13..18}] ~~-0.1~ true
tp @s[scores={move=13..18}] ~~-0.2~ true
tp @s[scores={move=13..18}] ~~-0.4~ true
tp @s[scores={move=13..18}] ~~-0.1~ true
tp @s[scores={move=13..18}] ~~-0.2~ true
tp @s[scores={move=13..18}] ~~-0.4~ true



scoreboard players set @s[scores={move=15..17}] Frames 7

scoreboard players random @s[scores={move=19},tag=!heavenlyrestriction] blackflashchance 1 200
scoreboard players set @s[scores={move=19},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7


execute as @s[scores={move=15}] at @s run particle ds:ground_slam1
execute as @s[scores={move=15}] at @s run particle ds:ground_slam2
execute as @s[scores={move=15}] at @s run particle ds:ground_pound1b
execute as @s[scores={move=15}] at @s run particle ds:ground_pound2
execute as @s[scores={move=15}] at @s run particle ds:ground_pound3
execute as @s[scores={move=15}] at @s run particle ds:ground_pound4b
execute as @s[scores={move=15}] at @s run particle ds:large_impact1
execute as @s[scores={move=15}] at @s run particle ds:large_impact2
execute as @s[scores={move=15}] at @s run particle ds:rubble3
execute as @s[scores={move=15..17}] at @s run particle ds:turbo_intensity3 ~~~
execute as @s[scores={move=15}] at @s run playsound mob.wither.break_block @a[r=100] ~~~ 99999 0.5 99999
execute as @s[scores={move=15}] at @s run playsound random.explode @a[r=100] ~~~ 99999 0.85 99999
execute as @s[scores={move=15}] at @s run playsound mob.wither.shoot @a[r=100] ~~~ 99999 0.35 99999
execute as @s[scores={move=17}] at @s run playsound mob.burst @a[r=100] ~~-4~ 99999 2 99999
execute as @s[scores={move=15}] at @s run camerashake add @a[r=25] 4 0.25
execute as @s[scores={move=15}] at @s run scoreboard players set @e[tag=!Frames,r=6,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] knockdown 25
execute as @s[scores={move=15}] at @s run scoreboard players add @e[tag=!Frames,tag=!unselect,r=6,scores={knockdown=25}] Evade 20
execute as @s[scores={move=15}] at @s run scoreboard players set @e[tag=!Frames,tag=!unselect,r=6,scores={knockdown=25}] Hit 5
execute as @s[scores={move=15}] at @s run scoreboard players set @e[tag=!Frames,tag=!unselect,r=6,scores={knockdown=25}] Stun 60
execute as @s[scores={move=15}] at @s run damage @e[tag=!Frames,tag=!unselect,r=6,scores={knockdown=25}] 20 override entity @s
execute as @s[scores={move=15}] at @s run scoreboard players operation @e[tag=!Frames,tag=!unselect,r=6,scores={knockdown=25}] damage += @s damageadd
execute as @s[scores={move=15}] at @s run function damages/blunt_damage

