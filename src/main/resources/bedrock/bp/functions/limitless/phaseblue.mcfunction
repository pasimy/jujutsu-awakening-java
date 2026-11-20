tp @s[tag=!Stopped,scores={Deleter=0..40}] ^^^2 facing ^^^20

playanimation @s[scores={Deleter=0..40}] animation.phase_blue

function damages/pull_damage

execute unless block ~~-1~ air unless block ~~-1~ barrier run particle ds:rubble_suck2

execute as @s[scores={Deleter=2..}] at @s if entity @e[tag=griefable] positioned ~~1~ run function 4x4sphere
execute as @s[scores={Deleter=2..}] at @s run tp @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=4,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] ~~~ facing @s
execute as @s[scores={Deleter=2..}] at @s run scoreboard players set @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Stun 30
execute as @s[scores={Deleter=2..}] at @s run scoreboard players add @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Evade 1
execute as @s[scores={Deleter=2..}] at @s run damage @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] 1 override
execute as @s[scores={Deleter=2..}] at @s run kill @e[type=item,r=4]
execute as @s[scores={Deleter=2..}] at @s run kill @e[type=area_effect_cloud,r=4]

execute as @s[scores={Deleter=4}] at @s run scoreboard players set @s Deleter 100



execute as @s[scores={Deleter=2..}] at @s run tp @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=5,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] ~~~ facing @s
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=9,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,tag=Big] at @s run tp @s ~~~ facing @e[name=phaseblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}]
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=9,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame] at @s run tp @s ~~~ facing @e[name=phaseblue,type=ds:projectile,r=9,c=1,scores={Deleter=2..}]



execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=9,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=9,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=9,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=9,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.6 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=9,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=9,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.25 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=9,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=9,c=1,scores={Deleter=2..}] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06



execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,tag=Big] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,tag=Big] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.6 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,tag=Big] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}] feet run tp @s ^^^0.25 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=5,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,tag=!unselect,tag=Big] at @s facing entity @e[name=phaseblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06



execute as @s[scores={Deleter=85..}] at @s as @e[scores={detect_health=1..4},type=!ds:no_knockback_dummy,type=!ds:knockback_dummy,tag=!Frames,tag=!limitless,tag=!pull_adapted,r=4,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect] at @s run particle ds:lapse_organs ~~1~
execute as @s[scores={Deleter=85..}] at @s as @e[scores={detect_health=1..4},type=!ds:no_knockback_dummy,type=!ds:knockback_dummy,tag=!Frames,tag=!limitless,tag=!pull_adapted,r=4,family=!projectile,family=!despawncito,family=!damage,family=!motionless,tag=!unselect] at @s run particle ds:blood_explode ~~1~
execute as @s[scores={Deleter=86..}] at @s run scoreboard players set @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Stun 30
execute as @s[scores={Deleter=86..}] at @s run damage @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] 3 override
execute as @s[scores={Deleter=90..}] at @s run particle ds:blue_phase_ex1 ~~~
execute as @s[scores={Deleter=90..}] at @s run particle ds:blue_phase_ex2 ~~~
execute as @s[scores={Deleter=85..90}] at @s run particle ds:lapseblue2 ~~1~
execute as @s[scores={Deleter=85..90}] at @s run particle ds:lapseblue3 ~~1~
execute as @s[scores={Deleter=94}] at @s run particle ds:lapse_pull4 ~~1~
execute as @s[scores={Deleter=86}] at @s run particle ds:lapse_pull3 ~~1~
execute as @s[scores={Deleter=86}] at @s run particle ds:lapse_pull2 ~~1~
execute as @s[scores={Deleter=85..86}] at @s run scoreboard players set @s Deleter 3
