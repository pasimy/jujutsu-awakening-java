playanimation @s[scores={move=25}] animation.finger_bearer.punch1

playanimation @s[scores={move=15..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=15..,Stun=1..}] move 0

effect @s[scores={move=16..},tag=!basic_behavior] speed 1 2 true
scoreboard players set @s[scores={move=2..}] Move 4
tp @s[scores={move=1..15},tag=!basic_behavior] ~~~

scoreboard players set @s[scores={move=16}] atk 2

#execute as @s[scores={move=15}] at @s unless entity @e[scores={ab=1..},r=10] run summon ds:boss_knockback1
execute as @s[scores={move=15}] at @s positioned ^^^3 run tag @e[r=2.95,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!filtered_target] add filtered_target
execute as @s[scores={move=15}] at @s positioned ^^^3 run scoreboard players add @e[r=2.95,tag=!Frames,tag=filtered_target,tag=!unselect] Stun 30
execute as @s[scores={move=15}] at @s positioned ^^^3 run scoreboard players add @e[r=2.95,tag=!Frames,tag=filtered_target,tag=!unselect] Evade 16
execute as @s[scores={move=15}] at @s positioned ^^^3 run scoreboard players add @e[r=2.95,tag=!Frames,tag=filtered_target,tag=!unselect] Hit 8
execute as @s[scores={move=15}] at @s positioned ^^^3 run scoreboard players operation @e[r=2.95,tag=!Frames,tag=filtered_target,tag=!unselect] damage += @s damageadd
execute as @s[scores={move=15}] at @s positioned ^^^3 run damage @e[r=2.95,tag=!Frames,tag=filtered_target,tag=!unselect] 4 override entity @s
execute as @s[scores={move=15}] at @s run function damages/blunt_damage
execute as @s[scores={move=15}] at @s positioned ^^^3 run playsound random.explode @a[r=90] ~~~ 90 1.85 90
execute as @s[scores={move=15}] at @s positioned ^^^3 run playsound random.explode @a[r=90] ~~~ 90 1.5 90
execute as @s[scores={move=15}] at @s positioned ^^^3 run playsound mob.wither.shoot @a[r=90] ~~~ 90 0.85 90
execute as @s[scores={move=15}] at @s positioned ^^^3 run playsound mob.wither.shoot @a[r=90] ~~~ 90 0.95 90
execute as @s[scores={move=15}] at @s positioned ^^^3 run camerashake add @a[r=30] 2 0.25
execute as @s[scores={move=14}] at @s run particle ds:ground_slam2 ^^1^2