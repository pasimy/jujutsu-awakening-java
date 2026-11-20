playanimation @s[scores={move=50}] animation.reversal_red2
execute as @s[scores={levitate=1..,move=50},family=!gojo] at @s if block ~~-1~ air if block ~~-2~ air run playanimation @s animation.reversal_red2b
execute as @s[scores={levitate=1..,move=50},family=!gojo] at @s if block ~~-1~ air if block ~~-2~ air run particle ds:flashstep1 ~~~
execute as @s[scores={levitate=1..,move=50},family=gojo] at @s run playanimation @s animation.reversal_red2b
execute as @s[scores={levitate=1..,move=50},family=gojo] at @s run particle ds:flashstep1 ~~~
tag @s[scores={move=1..2},tag=form3c] remove form3c

scoreboard players set @s[scores={move=1..}] Frames 5
scoreboard players set @s[scores={move=1..,levitate=1..},family=gojo] Move 5

execute as @s[scores={move=6}] at @s run camerashake add @a[r=50] 4 0.25
execute as @s[scores={move=45}] at @s run camera @a[r=20] fade time 1 0 1 color 255 75 75

execute as @s[scores={move=45}] at @s run playsound mob.red1 @a ~~~ 100000 0.37 100000
execute as @s[scores={move=6}] at @s run playsound mob.shock2 @a ~~~ 100000 0.35 100000
execute as @s[scores={move=6}] at @s run playsound mob.shock1 @a ~~~ 100000 0.5 100000

execute as @s[scores={move=1..11}] at @s run tp @s ~~~


execute as @s[scores={move=10}] at @s run function damages/explosion_damage
execute as @s[scores={move=10}] at @s positioned ^^^7 run scoreboard players set @e[r=6.95,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Flourish 20
execute as @s[scores={move=10}] at @s positioned ^^^7 run damage @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] 100 override entity @s
execute as @s[scores={move=10}] at @s positioned ^^^7 run scoreboard players set @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] Stun 30
execute as @s[scores={move=10}] at @s positioned ^^^7 run scoreboard players add @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] Hit 3
execute as @s[scores={move=10}] at @s positioned ^^^7 run scoreboard players add @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] Evade 40
execute as @s[scores={move=10}] at @s positioned ^^^7 run tag @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20},tag=!customknockback] add customknockback
execute as @s[scores={move=10}] at @s positioned ^^^7 as @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] at @s run tp @s ~~~ facing @e[scores={move=10},r=14,c=1]
execute as @s[scores={move=10}] at @s positioned ^^^7 as @e[r=6.95,tag=!Frames,tag=!unselect,scores={Flourish=20}] at @s run scriptevent ds:knockback -120


execute as @s[scores={move=10}] at @s run scriptevent ds:shootprojectile ds:projectile Reversal velocity:15 scores: Deleter 10
execute as @s[scores={move=9}] at @s run tag @e[name=Reversal,type=ds:projectile,tag=!GojoProj] add GojoProj