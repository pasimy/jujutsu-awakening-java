execute as @s[scores={domain=1..},tag=limitless] at @s positioned ~~~ run tickingarea add ~30 ~ ~30 ~-30 ~ ~-30 UnlimitedVoid

execute as @s[scores={domain=750..}] at @s run scoreboard players set @e[r=40,scores={domainstart=1..}] domainstart 0

execute as @s[scores={domain=760},tag=limitless] at @s run stopsound @a[r=33]
execute as @s[scores={domain=760},tag=limitless] at @s run kill @e[name=UnlimitedVoid,type=ds:projectile,r=33]
execute as @s[scores={domain=1..},tag=limitless] at @s run scoreboard players set @e[r=33,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 36
execute as @s[scores={domain=760},tag=limitless] at @s run playanimation @a[r=33,rm=0.15,scores={move=4..},m=!spectator] animation.stunned
execute as @s[scores={domain=760},tag=limitless] at @s run scoreboard players set @a[r=33,rm=0.15,scores={move=4..}] move 3
execute as @s[scores={domain=760},tag=limitless] at @s run tp @s @s
playanimation @s[scores={domain=760..},tag=limitless] animation.infinite_void2
execute as @s[scores={domain=750,Energy=1..50},tag=limitless] at @s run scoreboard players add @s Energy 200
execute as @s[scores={domain=740},tag=limitless] at @s run playsound music.infinitevoid2 @a[r=33] ~~~ 100000 1 10000

scoreboard players add @s[scores={domain=760..},tag=limitless] infinity 15
scoreboard players add @s[scores={domain=1..},tag=limitless] infinity 1
#scoreboard players set @s[scores={domain=1..},tag=limitless] ProjImmune 50

execute as @s[scores={domain=1..},tag=limitless] at @s run scoreboard players set @a[r=33] Stun 5
execute as @s[scores={domain=1..},tag=limitless] at @s run scoreboard players set @a[r=33] Camera 5
tag @s[scores={domain=1..},tag=limitless,tag=form6] remove form6
tag @s[scores={domain=1..5},tag=limitless,tag=domainlayout] remove domainlayout
scoreboard players set @s[scores={domain=1..},tag=limitless] Camera 5

execute as @s[scores={domain=760},tag=limitless] at @s run camera @a[r=33] fade time 0.25 0.5 0.5 color 0 0 0

execute as @s[scores={domain=760},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 5 in_out_circ pos ^0.11 ^-0.18 ^0.85 rot ~-21 ~180

execute as @s[scores={domain=625},tag=limitless] at @s run camera @a[r=33] fade time 2.75 1.15 0.1 color 255 255 255
execute as @s[scores={domain=600..625},tag=limitless] at @s run particle ds:infinite_void_whitev1 ~~~
execute as @s[scores={domain=600..625},tag=limitless] at @s run particle ds:infinite_void_whitev1 ~~~
execute as @s[scores={domain=570..600},tag=limitless] at @s run particle ds:infinite_void_whitev2 ~~~


execute as @s[scores={domain=550},tag=limitless] at @s run summon ds:domain_barrier_white UnlimitedBarrier ~~~
execute as @s[scores={domain=550},tag=limitless] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={domain=550},tag=limitless] at @s run scoreboard players operation @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter += @s Energy
execute as @s[scores={domain=550},tag=limitless] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Energy 35

execute as @s[scores={domain=549}] at @s run summon ds:projectile UnlimitedVoidStart ~ 298.85 ~
execute as @s[scores={domain=548..549}] at @s run scoreboard players set @e[type=ds:projectile,name=UnlimitedVoidStart,r=33,c=1] Deleter 551
execute as @e[name=UnlimitedVoidStart,r=33,c=1] at @s run function limitless/unlimited_start

execute as @s[scores={domain=560},tag=limitless] at @s positioned ~~~ run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air
execute as @s[scores={domain=560},tag=limitless] at @s positioned ~~~ run fill ~33 299 ~33 ~-33 299 ~-33 barrier [] replace air


execute as @s[scores={domain=500..548},tag=limitless] at @s positioned ~~~ run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air
execute as @s[scores={domain=500..548},tag=limitless] at @s positioned ~~~ run fill ~30 ~-1 ~30 ~-30 ~-1 ~-30 barrier [] replace air

execute as @s[scores={domain=550},tag=limitless] at @s as @e[r=47,type=!item,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,name=!UnlimitedBarrier,name=!UnlimitedVoidStart,tag=!domainunselect] at @s run tp @s ~ 301.1 ~
execute as @s[scores={domain=540..548},tag=limitless] at @s as @e[r=47,type=!item,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,name=!UnlimitedBarrier,name=!UnlimitedVoidStart,tag=!domainunselect] at @s run tp @s ~ 301.25 ~
execute as @s[scores={domain=560},tag=limitless] at @s run effect @a[r=33] night_vision 2 1 true
execute as @s[scores={domain=546..549},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^ ^ ^-4 rot ~ ~180
execute as @s[scores={domain=544},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 1.5 linear pos ^ ^0.25 ^-1 rot ~5 ~180
execute as @s[scores={domain=512},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 3 linear pos ^ ^2 ^8 rot ~15 ~

execute as @s[scores={domain=541..560},tag=limitless] at @s run tp @s @s
execute as @s[scores={domain=541..559},tag=limitless] at @s run tp @s ~~~ facing ~~~1
execute as @s[scores={domain=541..559},tag=limitless] at @s run tp @s ~~~ facing ^^^20

execute as @s[scores={domain=512..520},tag=limitless] at @s as @e[r=33] at @s if block ~~~ barrier run tp @s ~~1.1~

execute as @s[scores={domain=451},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^ ^-0.4 ^5 rot ~-15 ~180
execute as @s[scores={domain=430},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 6.65 linear pos ^ ^ ^16 rot ~ ~180

execute as @s[scores={domain=391},tag=limitless] at @s run camera @a[r=33] fade time 4.5 3.5 1 color 252 252 255

execute as @s[scores={domain=306},tag=limitless] at @s run playsound music.infinitevoidmusic @a[r=33] ~~~ 100000 1 10000
execute as @s[scores={domain=306},tag=limitless] at @s run summon ds:domain_barrier_inside UnlimitedVoid ~ 298.85 ~

execute as @s[scores={domain=306},tag=limitless] at @s run particle ds:unlimited_eye ^^1.5^26
execute as @s[scores={domain=306},tag=limitless] at @s run particle ds:unlimited_eye1 ^^1.5^26
execute as @s[scores={domain=306},tag=limitless] at @s run particle ds:unlimited_eye2 ^^1.5^26
execute as @s[scores={domain=306},tag=limitless] at @s run particle ds:unlimited_eye3 ^^1.5^26

execute as @s[scores={domain=305..306},tag=limitless] at @s run scoreboard players add @e[name=UnlimitedVoid,r=33,c=1] Deleter 731
execute as @s[scores={domain=306},tag=limitless] at @s run scoreboard players operation @e[name=UnlimitedVoid,r=33,c=1] Deleter += @s Energy
execute as @s[scores={domain=305..306},tag=limitless] at @s run scoreboard players operation @s domainactive = @e[name=UnlimitedVoid,r=33,c=1] Deleter


execute as @s[scores={domain=306},tag=limitless] at @s run effect @a[r=33] night_vision 2 1 true

execute as @s[scores={domain=1..},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] times 0 20 0
execute as @s[scores={domain=420},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=418},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=416},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=414},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=412},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title §l

execute as @s[scores={domain=380},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=378},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=376},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=374},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=372},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title §l


execute as @s[scores={domain=350},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=333},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=346},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=344},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title 
execute as @s[scores={domain=300..342},tag=limitless] at @s run title @a[tag=!impactframesoff,r=33] title §l

execute as @s[scores={domain=306},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^ ^ ^15 rot ~ ~
execute as @s[scores={domain=305},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 10 linear pos ^ ^ ^10 rot ~ ~

execute as @s[scores={domain=104},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^7 ^15 ^-15 rot ~-15 ~-35
execute as @s[scores={domain=103},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 2.5 in_out_circ pos ^6 ^16 ^-14 rot ~30 ~65

execute as @s[scores={domain=54},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^-7 ^3 ^15 rot ~15 ~135
execute as @s[scores={domain=53},tag=limitless] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 2.5 in_out_circ pos ^-6 ^1 ^14 rot ~ ~225
execute as @s[scores={domain=20},tag=limitless] at @s run camera @a[r=33] fade time 0.5 0.5 0.25 color 0 0 5

execute as @s[scores={domain=1..5},tag=limitless] at @s run camera @a[r=33] clear


