playanimation @s[scores={move=20}] animation.lapse_pull

tag @s[scores={move=15..,Stun=1..},tag=form2c] remove form2c
playanimation @s[scores={move=15..,Stun=1..},tag=!noStunnedAnim] animation.stunned
scoreboard players set @s[scores={move=15..,Stun=1..}] move 0

tag @s[scores={move=1..2},tag=form2c] remove form2c

execute as @s[scores={move=1..14}] at @s run tp @s ~~~

execute as @s[scores={move=15}] at @s run camerashake add @a[r=15] 2 0.1

execute as @s[scores={move=15}] at @s positioned ^^^15 run tag @e[r=14.95,tag=!Frames,tag=!pull_adapted,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!lightning_bolt,type=!area_effect_cloud,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,tag=!lapsepull] add lapsepull
execute as @s[scores={move=15}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run particle ds:impact
execute as @s[scores={move=15}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run particle mcdp_v:knockback_roar_particle_2
execute as @s[scores={move=15}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run playsound mob.wither.shoot @a[r=35] ~~~ 0.25 0.8 0.25
execute as @s[scores={move=11}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run particle ds:lapse_pull2 ~~1~
execute as @s[scores={move=11}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run particle ds:lapse_pull3 ~~1~
execute as @s[scores={move=11}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run particle ds:lapse_pull4 ~~1~
execute as @s[scores={move=11}] at @s positioned ^^^15 run scoreboard players set @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] Stun 35
execute as @s[scores={move=11}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] positioned ^^^-15 positioned ^^0.5^1.5 facing entity @s feet positioned as @s run tp @s ~~~ facing ^^^-30
execute as @s[scores={move=7}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] positioned ^^^-15 positioned ^^0.5^1.5 facing entity @s feet positioned as @s run tp @s ~~~ facing ^^^-30
#execute as @s[scores={move=8}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run scriptevent ds:knockback 32

#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run summon armor_stand ^^0.5^1.5 facing @s none Lapsepull
#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run summon xp_orb ^^0.5^1.5 facing @s
#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run summon ds:projectile ~~500~ facing @s none entityDetect
#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s positioned ^^0.5^1.5 run tag @e[type=xp_orb,r=1,c=1,tag=!selfentity] add selfentity
#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s positioned ^^0.5^1.5 run tag @e[type=xp_orb,r=1,c=1,tag=!Frames] add Frames
#execute as @s[scores={move=7}] positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s positioned ^^0.5^1.5 run effect @e[type=xp_orb,tag=Frames,r=1,c=1] invisibility infinite 0 true

#execute as @s[scores={move=7},tag=!Frames] at @s positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] run scoreboard players add @s Frames 2
#execute as @s[scores={move=7},tag=!Frames] at @s positioned ^^^15 if entity @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] run tag @s add Frames
#execute as @s[scores={move=7}] at @s positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] at @s run function limitless/lapsepull
execute as @s[scores={move=7}] positioned ^^^15 as @e[tag=!Frames,tag=!pull_adapted,tag=!unselect,tag=lapsepull,r=14.95] positioned ^^^-15 run tp @s ^^0.5^1.5 facing ~~~

#execute as @s[scores={move=7}] at @s run tp @e[name=Lapsepull,type=armor_stand] ~~-200~
#execute as @s[scores={move=7}] at @s run tp @e[type=xp_orb,tag=Frames] ~~-200~
#execute as @s[scores={move=7}] at @s run kill @e[name=Lapsepull,type=armor_stand]
#execute as @s[scores={move=7}] at @s run kill @e[type=xp_orb,tag=Frames]
#execute as @s[scores={move=7}] at @s run kill @e[name=entityDetect,type=ds:projectile]
#execute as @s[scores={move=7}] at @s positioned ^^^15.05 if entity @e[scores={knockdown=40},r=15] run function damages/blunt_damage
execute as @s[scores={move=7}] at @s positioned ^^^15.05 run function damages/pull_damage

execute as @s[scores={move=11}] at @s positioned ^^0.5^1.5 run particle ds:lapse_pull2
execute as @s[scores={move=11}] at @s positioned ^^0.5^1.5 run particle ds:lapse_pull4
execute as @s[scores={move=12..}] at @s run playsound beacon.ambient @a ^^1^1 0.2 3
execute as @s[scores={move=15}] at @s run playsound beacon.deactivate @a ^^1^1 1 1.75
execute as @s[scores={move=15}] at @s run playsound mob.beam3 @a ^^1^1 1 0.6


