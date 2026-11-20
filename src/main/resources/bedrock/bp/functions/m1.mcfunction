playanimation @s[scores={chance=1},tag=basic_behavior] animation.finger_bearer.hit1
playanimation @s[scores={chance=2},tag=basic_behavior] animation.finger_bearer.hit2
scoreboard players set @s atk 2

execute positioned ^^^1.75 as @a[scores={detect_left=1..,BasicM1=0,Hit=0,flashstep=0,Stun=0,move=0,cutscene=0,domainstart=0,domain=0,knockdown=0,Flourish=0},r=2.25] at @s positioned ^^^0.5 run function m1_clash
execute positioned ^^^1.75 as @e[type=!player,tag=!Frames,scores={punch=1..,Stun=0,move=0,cutscene=0},r=2.25,tag=!hit] unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={knockdown=1..}] unless entity @s[scores={Flourish=1..}] run scoreboard players random @s clashtype 1 2
execute positioned ^^^1.75 as @e[type=!player,tag=!Frames,scores={punch=1..,Stun=0,move=0,cutscene=0},r=2.25] unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={knockdown=1..}] unless entity @s[scores={Flourish=1..}] at @s positioned ^^^0.5 run function m1_clash

execute positioned ^^^1.7 run tag @e[tag=!Frames,tag=!clashed2,r=1.65,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,tag=!filtered_target] add filtered_target
execute positioned ^^^1.7 run damage @e[tag=!Frames,tag=filtered_target,tag=!unselect,tag=!clashed2,r=1.65] 1 override entity @s
execute positioned ^^^1.7 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,tag=!clashed2,r=1.65] Evade 2
execute positioned ^^^1.7 run scoreboard players add @e[tag=!Frames,tag=filtered_target,tag=!unselect,tag=!clashed2,r=1.65] Hit 1
execute positioned ^^^1.7 run playsound mob.witch.throw @a[r=50] ~~~ 99999 1.4 99999
execute positioned ^^^1.7 run camerashake add @a[r=10] 0.025 0.25
execute anchored eyes positioned ^^1.2^1 run particle minecraft:critical_hit_emitter


scoreboard players set @s[scores={chance=1..}] chance 0
tag @e[tag=clashed2] remove clashed2
tag @s[tag=hit] remove hit