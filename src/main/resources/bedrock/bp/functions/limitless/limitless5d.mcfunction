
playanimation @s[scores={move=480..}] animation.limitless_purple
tp @s[scores={move=480..}] @s
camera @s[scores={move=480},type=player] fade time 0.2 0.2 0.3 color 255 255 255
execute as @s[scores={move=480}] at @s run playsound beacon.deactivate @a ~~~ 1 0.5
execute as @s[scores={move=480}] at @s run playsound mob.red1 @a ~~~ 1 0.5
execute as @s[scores={move=460}] at @s run playsound music.limitlesspurple1 @a[r=280] ~~~ 10000 1 10000

tag @s[scores={move=1..2},tag=form5d] remove form5d

scoreboard players add @s[scores={move=480..}] infinity 15
scoreboard players add @s[scores={move=1..}] infinity 1
#scoreboard players set @s[scores={move=1..480}] ProjImmune 50
scoreboard players set @s[scores={move=31..}] Camera 5
scoreboard players set @s[scores={move=1..}] Move 5

execute as @s[scores={move=1..}] at @s run kill @e[type=ds:knockback,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:running,r=8]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:lapse_explode,r=15]
execute as @s[scores={move=1..}] at @s run kill @e[type=ds:limitless_explosion,r=25]

execute as @s[scores={move=1..460}] at @s run effect @e[rm=1,r=280,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] slowness 1 1 true



execute as @s[scores={move=20..170,detect_health=5..}] at @s run scoreboard players add @s damage 1

execute as @s[scores={move=460}] at @s run camera @a[r=20] fade time 0 0.33 1 color 255 55 255
execute as @s[scores={move=460}] at @s run playsound mob.shock2 @a ~~~ 0.5
execute as @s[scores={move=460}] at @s run playsound mob.shock2 @a ~~~ 0.25
execute as @s[scores={move=460}] at @s run camerashake add @a[r=280] 2 1

execute as @s[scores={move=460}] at @s run summon ds:projectile LimitlessPTRG
execute as @s[scores={move=460}] at @s run summon ds:projectile LimitlessPRed
execute as @s[scores={move=460}] at @s run summon ds:projectile LimitlessPBlue
execute as @s[scores={move=460}] at @s run tag @e[name=LImitlessPTRG,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=460}] at @s run tag @e[name=LImitlessPRed,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=460}] at @s run tag @e[name=LImitlessPBlue,type=ds:projectile,r=0.15,c=1,tag=!GojoProj] add GojoProj
execute as @s[scores={move=460}] at @s run scoreboard players set @e[name=LImitlessPTRG,type=ds:projectile,r=0.15,c=1] Deleter 251
execute as @s[scores={move=460}] at @s run scoreboard players set @e[name=LImitlessPRed,type=ds:projectile,r=0.15,c=1] Deleter 251
execute as @s[scores={move=460}] at @s run scoreboard players set @e[name=LImitlessPBlue,type=ds:projectile,r=0.15,c=1] Deleter 251


effect @s[scores={move=321..460}] levitation 1 1 true
effect @s[scores={move=1..321}] levitation 0 20 true
execute as @s[scores={move=310..320}] at @s run fill ~1 ~-1 ~1 ~-1 ~-1 ~-1 barrier [] replace air
execute as @s[scores={move=300..309}] at @s run fill ~2 ~2 ~2 ~-2 ~-1 ~-2 air [] replace barrier
execute as @s[scores={move=1..7}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 air [] replace barrier
execute as @s[scores={move=1..7}] at @s run fill ~15 ~2 ~15 ~-15 ~-15 ~-15 air [] replace barrier


execute as @s[scores={move=461..478},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^ ^-1.25 ^2 rot ~-15 ~180
execute as @s[scores={move=460},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.875 in_out_circ pos ^ ^ ^12 rot ~ ~180
execute as @s[scores={move=451},type=player] at @s anchored eyes run camera @s set minecraft:free ease 1 in_circ  pos ^ ^-0.5 ^22 rot ~-15 ~180
execute as @s[scores={move=441},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.51 linear pos ^22 ^ ^ rot ~ ~90
execute as @s[scores={move=431},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.51 linear pos ^ ^6 ^-22 rot ~ ~
execute as @s[scores={move=421},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.51 linear pos ^-22 ^ ^ rot ~ ~-90
execute as @s[scores={move=411},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.51 linear pos ^ ^10 ^25 rot ~15 ~180

execute as @s[scores={move=401},type=player] at @s anchored eyes run camera @s set minecraft:free ease 8 in_out_circ pos ^ ^-3 ^30 rot ~-30 ~180
execute as @s[scores={move=171},type=player] at @s anchored eyes run camera @s set minecraft:free ease 6 in_out_circ pos ^ ^ ^80 rot ~0 ~180

execute as @s[scores={move=1..460}] at @s run tp @e[name=LimitlessPTRG,type=ds:projectile,r=3,c=1] ~~1~

execute as @s[scores={move=1..460}] at @s positioned ~~1~ as @e[name=LimitlessPTRG,type=ds:projectile,r=0.15,c=1] at @s run function limitless/limitless5ptrg


execute as @s[scores={move=229}] at @s run particle ds:hollow_purple_impact1 ~~6~
execute as @s[scores={move=210..211}] at @s run camera @a[r=100] fade time 0 0.1 0.5 color 255 255 255
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple1 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple2 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple3 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple4 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple5 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple6 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:hollow_purple7 ~~7~
execute as @s[scores={move=190..209}] at @s run particle ds:limitless_lightning3 ~~6~

execute as @s[scores={move=180..190}] at @s run particle ds:limitless_suck1 ~~7~
execute as @s[scores={move=180..190}] at @s run particle ds:limitless_suck2 ~~7~
execute as @s[scores={move=180..190}] at @s run particle ds:limitless_suck3 ~~7~
execute as @s[scores={move=180..190}] at @s run particle ds:limitless_suck4 ~~7~
execute as @s[scores={move=180..190}] at @s run particle ds:limitless_suck5 ~~7~
execute as @s[scores={move=170..180}] at @s run particle ds:limitless_suck6 ~~7~

title @s[scores={move=188},tag=!impactframesoff,type=player] title 
title @s[scores={move=187},tag=!impactframesoff,type=player] title 
title @s[scores={move=186},tag=!impactframesoff,type=player] title 
title @s[scores={move=185},tag=!impactframesoff,type=player] title 
title @s[scores={move=184},tag=!impactframesoff,type=player] title 
title @s[scores={move=183},tag=!impactframesoff,type=player] title 
title @s[scores={move=182},tag=!impactframesoff,type=player] title 
title @s[scores={move=181},tag=!impactframesoff,type=player] title 
title @s[scores={move=176..180},tag=!impactframesoff,type=player] title §r§l
camera @s[scores={move=180},type=player] fade time 0 0 0.45 color 255 255 255

title @s[scores={move=174},tag=!impactframesoff,type=player] title 
title @s[scores={move=173},tag=!impactframesoff,type=player] title 
title @s[scores={move=172},tag=!impactframesoff,type=player] title 
title @s[scores={move=171},tag=!impactframesoff,type=player] title 
title @s[scores={move=170},tag=!impactframesoff,type=player] title 
title @s[scores={move=160..169},tag=!impactframesoff,type=player] title §l



execute as @s[scores={move=180}] at @s run playsound music.enuma @a[r=280] ~~~ 10000 1.2 10000
execute as @s[scores={move=175},type=player] at @s run camera @s fade time 8 2 1 color 255 55 255

execute as @s[scores={move=20..175}] at @s run tp @s ~~~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode_air ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode1 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode2 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode3 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode4 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode5 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode6 ~~7~
execute as @s[scores={move=20..175}] at @s run particle ds:limitless_explode7 ~~7~
execute as @s[scores={move=175}] at @s run particle ds:energy_wave_large ~~7~
execute as @s[scores={move=50}] at @s run particle ds:energy_wave_large ~~7~

execute as @s[scores={move=20..175}] at @s run kill @e[type=item,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=xp_orb,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=arrow,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=small_fireball,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=fireworks_rocket,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=fishing_hook,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=area_effect_cloud,r=280,c=1]
execute as @s[scores={move=20..175}] at @s run kill @e[type=falling_block,r=280,c=1]

execute as @s[scores={move=20..175}] at @s run camerashake add @a[r=300] 4 0.25
execute as @s[scores={move=40..175}] at @s run summon ds:limitless_explosion ~~-55~
execute as @s[scores={move=40..175}] at @s positioned ~~-55~ as @e[type=ds:limitless_explosion,r=0.15] positioned ~~55~ run spreadplayers ~ ~ 7 50 @s
execute if entity @e[tag=griefable,c=1] as @s[scores={move=40..175}] at @s as @e[type=ds:limitless_explosion,r=50,c=1] at @s run function 4x4sphere
execute as @s[scores={move=20..175}] at @s as @e[family=mahoraga,r=280] at @s positioned ~~0.5~ run function damages/deletion_damage
execute as @s[scores={move=20..175}] at @s as @e[scores={wheelactive=1..},r=280,family=!mahoraga] at @s unless entity @e[family=mahoraga,r=15,c=1] positioned ~~0.5~ run function damages/deletion_damage
execute as @s[scores={move=20..175}] at @s run damage @e[rm=0.15,r=280,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=!deletion_adapted] 12 override
execute as @s[scores={move=20..175}] at @s run damage @e[rm=0.15,r=280,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,tag=deletion_adapted] 4 override
execute as @s[scores={move=11..30}] at @s run tickingarea add ~90 ~ ~90 ~-90 ~ ~-90 limitlesspurple
execute as @s[scores={move=10..30}] at @s run kill @e[type=ds:limitless_explosion,r=50]
execute as @s[scores={move=1..10}] at @s run tickingarea remove limitlesspurple


