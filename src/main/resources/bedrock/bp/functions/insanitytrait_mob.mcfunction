scoreboard players set @s[scores={insanity=0..599,insanityCD=0}] insanityCD 5000
scoreboard players set @s[scores={insanityCD=4999..,insanity=0}] insanity 600
execute as @s[scores={insanity=599..}] at @s run particle ds:insanity_awaken~~1.5~
execute as @s[scores={insanity=599..}] at @s run playsound mob.wither.ambient @a[r=100] ~~~ 9999 0.8 9999
scoreboard players set @s[scores={Stun=4..,cutscene=0,insanity=599..}] Stun 3
effect @s[scores={insanity=1..3}] speed 0 11 true
effect @s[scores={insanity=1..3}] slowness 5 3 true
execute as @s[scores={atk=1,insanity=1..599}] at @s positioned ^^^3 run scoreboard players operation @e[type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!Frames,r=2.95] damagehalf += @s damageadd
scoreboard players remove @s[scores={Stun=1..,cutscene=0,insanity=1..599}] Stun 1
effect @s[scores={insanity=1..599},tag=!Frames,tag=!unselect] resistance 1 0 true
scoreboard players add @s[scores={insanity=1..599},tag=!heavenlyrestriction] Energy 1
effect @s[scores={insanity=1..599}] speed 1 2 true
execute as @s[scores={insanity=1..599}] at @s run particle ds:insanity1
execute as @s[scores={insanity=1..599}] at @s run particle ds:insanity2
scoreboard players remove @s[scores={insanity=1..}] insanity 1
