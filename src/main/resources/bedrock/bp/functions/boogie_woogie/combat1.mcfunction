playanimation @s[scores={move=30..}] animation.todo.hefty_blow

scoreboard players set @s[scores={move=30..}] Move 25


playanimation @s[scores={move=20..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=20..,Stun=1..}] move 3

tag @s[scores={move=1..3},tag=wep1] remove wep1

camerashake add @s[scores={move=28},type=player] 0.25 0.3
execute as @s[scores={move=28}] at @s run playsound mob.enderdragon.flap @a[r=30] ~~~ 99999 1.15 999999

execute as @s[scores={move=28..}] at @s run scriptevent ds:knockback 3
execute as @s[scores={move=18..25}] at @s run scriptevent ds:knockback 0.15

execute as @s[scores={move=16}] at @s run playsound mob.wither.shoot @a[r=30] ~~~ 99999 0.55 999999


scoreboard players random @s[scores={move=20},tag=!heavenlyrestriction] blackflashchance 1 169
scoreboard players set @s[scores={move=20},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

scoreboard players set @s[scores={move=17}] atk 2
execute as @s[scores={move=16}] at @s run camerashake add @a[r=15] 1 0.15
execute as @s[scores={move=16}] at @s positioned ^^^1.5 run particle ds:ground_slam3 ~~~
execute as @s[scores={move=16}] at @s positioned ^^^0.5 run particle ds:ground_slam2 ~~~
execute as @s[scores={move=16..18}] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] at @s run tp @s ~~~ facing @e[scores={move=16..18},r=10,c=1]
execute as @s[scores={move=16}] at @s positioned ^^^2.5 run scoreboard players set @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Flourish 5
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45,c=1] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] at @s run particle ds:invert
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45,c=1] at @s run camerashake add @a[r=15] 4 0.2 rotational
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] at @s run particle ds:large_impact2 ~~1~
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] at @s run playsound mob.wither.break_block @a[r=30] ~~~ 99999 0.75 999999
execute as @s[scores={move=16}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] at @s run playsound mob.bullet @a[r=30] ~~~ 9999 1.5 9999
execute as @s[scores={move=16}] at @s positioned ^^^2.5 run damage @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] 15 override entity @s
execute as @s[scores={move=16}] at @s positioned ^^^2.5 run scoreboard players add @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] Evade 10
execute as @s[scores={move=16}] at @s positioned ^^^2.5 run scoreboard players add @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] Hit 3
execute as @s[scores={move=16}] at @s positioned ^^^2.5 run scoreboard players operation @e[tag=!Frames,tag=!unselect,scores={Flourish=5},r=2.45] damage += @s damageadd
execute as @s[scores={move=16}] at @s run function damages/blunt_damage