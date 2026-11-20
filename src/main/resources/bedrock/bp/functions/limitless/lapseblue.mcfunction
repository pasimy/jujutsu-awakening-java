execute as @s[name=Lapse,scores={Deleter=4..}] at @s unless block ~~~ air unless block ~~~ fire unless block ~~~ soul_fire run scoreboard players set @s Deleter 3

execute as @s[name=Lapse,scores={Deleter=4..}] at @s unless block ~~~ air unless block ~~~ fire unless block ~~~ soul_fire run scoreboard players set @s Deleter 3

execute as @s[name=Lapse,scores={Deleter=4..}] at @s unless block ~~~ air unless block ~~~ fire unless block ~~~ soul_fire run scoreboard players set @s Deleter 3

execute as @s[name=Lapse,scores={Deleter=4..}] at @s if entity @e[tag=!limitless,tag=!Frames,r=4,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] run scoreboard players set @s Deleter 3

execute as @s[name=Lapse] at @s run particle ds:lapse
execute as @s[name=Lapse] at @s run particle ds:lapseblue0a
execute as @s[name=Lapse] at @s run particle ds:lapseblue0b
execute as @s[name=Lapse] at @s unless block ~~-1~ air unless block ~~-1~ barrier run particle ds:rubble_suck2

execute as @s[name=Lapse,scores={Deleter=2}] at @s run summon ds:projectile Lapse2
execute as @s[name=Lapse,scores={Deleter=2}] at @s run tag @e[name=Lapse2,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[name=Lapse,scores={Deleter=2}] at @s run scoreboard players set @e[name=Lapse2,type=ds:projectile,r=0.15,c=1] Deleter 40
execute as @s[name=Lapse,scores={Deleter=2}] at @s run tp @s ~~-200~

