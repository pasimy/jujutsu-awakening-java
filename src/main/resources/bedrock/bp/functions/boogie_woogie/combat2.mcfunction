playanimation @s[scores={move=25..26}] animation.todo.agile_sweep

scoreboard players set @s[scores={move=20..}] Move 25


playanimation @s[scores={move=20..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=20..,Stun=1..}] move 3

tag @s[scores={move=1..3},tag=wep2] remove wep2


execute as @s[scores={move=18..19}] at @s run scriptevent ds:knockback 3
execute as @s[scores={move=11..16}] at @s run scriptevent ds:knockback 0.15

execute as @s[scores={move=16}] at @s run playsound mob.wither.shoot @a[r=30] ~~~ 99999 0.55 999999




execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true
execute as @s[scores={move=16}] at @s rotated ~ 0 run tp @s ^^^0.6 true


execute as @s[scores={move=16..17}] at @s run playsound mob.enderdragon.flap @a[r=30] ~~~ 99999 1.85 999999
execute as @s[scores={move=16..17}] at @s run particle ds:flashstep1 ~~~

execute as @s[scores={move=17}] at @s run camerashake add @a[r=15] 1 0.15
execute as @s[scores={move=16..17}] at @s run particle ds:ground_slam1 ~~~
execute as @s[scores={move=16..17}] at @s run particle ds:ground_slam2 ~~~
execute as @s[scores={move=16..17}] at @s run particle ds:ground_slam3 ~~~
execute as @s[scores={move=16..17}] at @s run particle ds:dirt0 ~~~


scoreboard players random @s[scores={move=20},tag=!heavenlyrestriction] blackflashchance 1 200
scoreboard players set @s[scores={move=20},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players set @s[scores={move=18}] atk 2
execute as @s[scores={move=17}] at @s positioned ^^^6 run scoreboard players set @e[tag=!Frames,r=5.95,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] knockdown 25
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run tp @s ~~~ facing @e[scores={move=17},r=15,c=1]
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run camerashake add @a[r=15] 4 0.2 rotational
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run particle ds:large_impact1 ~~~
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run particle ds:large_impact2 ~~~
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run playsound mob.wither.break_block @a[r=30] ~~~ 99999 0.75 999999
execute as @s[scores={move=17}] at @s positioned ^^^6 as @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] at @s run playsound mob.punch2 @a[r=30] ~~~ 9999 1.5 9999
execute as @s[scores={move=17}] at @s positioned ^^^6 run damage @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] 6 override entity @s
execute as @s[scores={move=17}] at @s positioned ^^^6 run scoreboard players add @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] Evade 6
execute as @s[scores={move=17}] at @s positioned ^^^6 run scoreboard players add @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] Hit 3
execute as @s[scores={move=17}] at @s positioned ^^^6 run scoreboard players operation @e[tag=!Frames,tag=!unselect,scores={knockdown=25},r=5.95] damage += @s damageadd
execute as @s[scores={move=17}] at @s run function damages/blunt_damage