tp @s ^^^1.2 facing @e[name=wisdomblueTRG,type=ds:projectile,r=100,c=1]

playanimation @s animation.wisdom_blue

execute unless block ~~-1~ air unless block ~~-1~ barrier run particle ds:rubble_suck2

function damages/pull_damage

playsound beacon.ambient @a[r=25] ~~~ 9999 2 9999
execute as @s[scores={Deleter=20..60}] at @s run playsound mob.wither.shoot @a[r=25] ~~~ 9999 0.5 9999
camerashake add @a[r=40] 0.15 0.08
execute as @s[scores={Deleter=40..60}] at @s run effect @a[r=40,tag=!sixeyes] night_vision 2 1 true

execute as @s[scores={Deleter=2..}] at @s if entity @e[tag=griefable] run function 4x4sphere



execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,rm=15,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s run tp @s ~~~ facing @e[name=wisdomblue,type=ds:projectile,r=24,c=1,scores={Deleter=2..}]
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame] at @s run tp @s ~~~ facing @e[name=wisdomblue,type=ds:projectile,r=15,c=1,scores={Deleter=2..}]



execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.6 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.25 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] unless entity @s[type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=15,c=1] feet unless block ^^^0.06 air run tp @s ^^^0.06



execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.6 true
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.6 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.25 true

execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06
execute as @s[scores={Deleter=2..}] at @s as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] unless entity @s[type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block] at @s facing entity @e[name=wisdomblue,type=ds:projectile,r=24,c=1] feet unless block ^^^0.06 air run tp @s ^^^0.06



execute as @s[scores={Deleter=2..},tag=!nukeactive] at @s if entity @e[scores={detect_health=0..4},r=3,tag=!Frames,tag=!limitless,tag=!pull_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] run tag @s add nukeactive
execute as @s[scores={Deleter=2..}] at @s run scoreboard players set @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Stun 30
execute as @s[scores={Deleter=2..}] at @s run scoreboard players add @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Evade 1
execute as @s[scores={Deleter=2..}] at @s run damage @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=3,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] 2 override
execute as @s[scores={Deleter=2..}] at @s run kill @e[type=item,r=5]
execute as @s[scores={Deleter=2..}] at @s run kill @e[type=area_effect_cloud,r=6]



execute as @s[scores={Deleter=5..8}] at @s run scoreboard players set @s Deleter 100

execute as @s[scores={Deleter=86..}] at @s run kill @e[name=wisdomblueTRG,type=ds:projectile,r=100,c=1]
execute as @s[scores={Deleter=86..}] at @s run tp @e[r=5,tag=!Frames,tag=!limitless,tag=!pull_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] ~~~
execute as @s[scores={Deleter=85..90}] at @s as @e[scores={detect_health=0..4},r=7,tag=!Frames,tag=!limitless,tag=!pull_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] at @s run particle ds:lapse_organs ~~1~
execute as @s[scores={Deleter=85..90}] at @s as @e[scores={detect_health=0..4},r=7,tag=!Frames,tag=!limitless,tag=!pull_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] at @s run particle ds:blood_explode ~~1~
execute as @s[scores={Deleter=85..90},tag=!nukeactive] at @s if entity @e[scores={detect_health=0..4},r=7,tag=!Frames,tag=!limitless,tag=!pull_adapted,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] run tag @s add nukeactive
execute as @s[scores={Deleter=86..}] at @s run scoreboard players set @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Stun 30
execute as @s[scores={Deleter=86..}] at @s run damage @e[tag=!Frames,tag=!limitless,tag=!pull_adapted,r=5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] 5 override
execute as @s[scores={Deleter=90..}] at @s run particle ds:blue_wisdom_ex1 ~~-1~
execute as @s[scores={Deleter=90..}] at @s run particle ds:blue_wisdom_ex2 ~~-1~
execute as @s[scores={Deleter=85..}] at @s run particle ds:lapseblue2 ~~~
execute as @s[scores={Deleter=85..}] at @s run particle ds:lapseblue3 ~~~
execute as @s[scores={Deleter=94}] at @s run particle ds:lapse_pull4 ~~~
execute as @s[scores={Deleter=86}] at @s run particle ds:lapse_pull3 ~~~
execute as @s[scores={Deleter=86}] at @s run particle ds:lapse_pull2 ~~~
execute as @s[scores={Deleter=83}] at @s run summon ds:projectile "Blue Core" ~~~
execute as @s[scores={Deleter=83}] at @s run tag @e[name="Blue Core",type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={Deleter=83},tag=nukeactive] at @s run tag @e[name="Blue Core",type=ds:projectile,r=0.15,c=1,tag=!nukeactive] add nukeactive
execute as @s[scores={Deleter=81..83}] at @s run scoreboard players set @e[name="Blue Core",type=ds:projectile,r=10,c=1] Deleter 201
execute as @s[scores={Deleter=81..82}] at @s run scoreboard players set @s Deleter 3
