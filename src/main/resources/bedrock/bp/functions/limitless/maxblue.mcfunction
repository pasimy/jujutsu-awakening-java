camerashake add @a[r=15] 0.5 0.15

execute as @s[name=MaxBlue,scores={Deleter=1..}] at @s run summon ds:lapse_explode
execute as @s[name=MaxBlue,scores={Deleter=1..}] at @s run summon ds:lapse_explode
execute as @s[name=MaxBlue,scores={Deleter=1..}] at @s run particle ds:rubble3

execute as @s[name=MaxBlue,scores={Deleter=1..2}] at @s run particle ds:lapseblue_ex1
execute as @s[name=MaxBlue,scores={Deleter=1..2}] at @s run particle ds:lapseblue_ex2
execute as @s[name=MaxBlue,scores={Deleter=1..2}] at @s run particle ds:lapseblue_ex3
execute as @s[name=MaxBlue,scores={Deleter=1..2}] at @s run particle ds:lapseblue_ex4
execute as @s[name=MaxBlue,scores={Deleter=1..}] at @s run particle ds:blue_gas

playsound mob.wither.shoot @a ~~~ 100000 0.5 100000

function damages/pull_damage

playsound beacon.deactivate @a ~~~ 100000 0.3 100000
playsound beacon.deactivate @a ~~~ 100000 0.45 100000

execute as @s[name=MaxBlue] at @s unless block ~~-1~ air run particle ds:rubble_sucked1
execute as @s[name=MaxBlue] at @s unless block ~~-1~ air run particle ds:rubble_sucked2



damage @e[tag=!limitless,tag=!pull_adapted,r=5,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] 2 override
effect @e[tag=!pull_adapted,r=15,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] resistance 1 1 true
scoreboard players add @e[tag=!limitless,tag=!pull_adapted,r=5,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Evade 2
scoreboard players set @e[tag=!limitless,tag=!pull_adapted,r=5,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Stun 15
scoreboard players add @e[tag=!limitless,tag=!pull_adapted,r=5,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!gg:impact_frame,type=!armor_stand] Hit 1

kill @e[type=item,r=9]
kill @e[type=area_effect_cloud,r=9]

execute as @e[tag=!limitless,tag=!pull_adapted,rm=15,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s run tp @s ~~~ facing @e[name=MaxBlue,type=ds:projectile,r=24,c=1]
execute as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!area_effect_cloud,tag=!unselect,type=!gg:impact_frame] at @s run tp @s ~~~ facing @e[name=MaxBlue,type=ds:projectile,r=15,c=1]



execute as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.33 true
execute as @e[tag=!limitless,tag=!pull_adapted,r=13.75,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=13.75,c=1] feet run tp @s ^^^0.33 true
execute as @e[tag=!limitless,tag=!pull_adapted,r=12.5,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=12.5,c=1] feet run tp @s ^^^0.33 true

execute as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=15,c=1] feet run tp @s ^^^0.131 true
execute as @e[tag=!limitless,tag=!pull_adapted,r=13.75,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=13.75,c=1] feet run tp @s ^^^0.131 true
execute as @e[tag=!limitless,tag=!pull_adapted,r=12.5,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=12.5,c=1] feet run tp @s ^^^0.131 true

execute as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=15,c=1] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06
execute as @e[tag=!limitless,tag=!pull_adapted,r=15,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame] unless entity @s[type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=15,c=1] feet unless block ^^^0.06 air run tp @s ^^^0.06



execute as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.33 true
execute as @e[tag=!limitless,tag=!pull_adapted,r=22,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=22,c=1] feet run tp @s ^^^0.33 true

execute as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=24,c=1] feet run tp @s ^^^0.131 true

execute as @e[tag=!limitless,tag=!pull_adapted,r=24,tag=!Frames,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,tag=!unselect,type=!gg:impact_frame,tag=Big] at @s facing entity @e[name=MaxBlue,type=ds:projectile,r=24,c=1] feet if block ^^^0.06 air anchored eyes if block ^^^0.06 air positioned as @s run tp @s ^^^0.06



fill ~6~6~6~-6~-6~-6 air [] replace water
fill ~6~6~6~-6~-6~-6 air [] replace lava
