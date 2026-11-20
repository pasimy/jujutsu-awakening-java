execute as @s[scores={domain=1..}] at @s positioned ~~~0 run tickingarea add ~30 ~ ~30 ~-30 ~ ~-30 UnlimitedVoid

tag @s[scores={domain=1..100},tag=form6c] remove form6c

execute as @s[scores={domain=100..}] at @s run scoreboard players set @e[r=40,scores={domainstart=1..}] domainstart 0

execute as @s[scores={domain=100}] at @s run stopsound @a[r=33]
execute as @s[scores={domain=100}] at @s run kill @e[name=UnlimitedVoid,type=ds:projectile,r=33]
execute as @s[scores={domain=1..}] at @s run scoreboard players set @e[r=33,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] Stun 36
execute as @s[scores={domain=100}] at @s run playanimation @a[r=33,rm=0.15,scores={move=4..},m=!spectator] animation.stunned
execute as @s[scores={domain=100}] at @s run scoreboard players set @a[r=33,rm=0.15,scores={move=4..}] move 3
execute as @s[scores={domain=100}] at @s run tp @s @s
playanimation @s[scores={domain=5..}] animation.infinite_void_standby2
execute as @s[scores={domain=100,Energy=1..50}] at @s run scoreboard players add @s Energy 200
execute as @s[scores={domain=100}] at @s run playsound mob.infinitevoidfast2 @a[r=33] ~~~ 100000 1 10000
execute as @s[scores={domain=90}] at @s run playsound music.infinitevoid_fast @a[r=33] ~~~ 100000 1.1 10000

scoreboard players add @s[scores={domain=100..}] infinity 15
scoreboard players add @s[scores={domain=1..}] infinity 1
#scoreboard players set @s[scores={domain=1..}] ProjImmune 50

execute as @s[scores={domain=1..}] at @s run scoreboard players set @a[r=33] Stun 5
execute as @s[scores={domain=1..}] at @s run scoreboard players set @a[r=33] Camera 5
tag @s[scores={domain=1..},tag=form6c] remove form6c
tag @s[scores={domain=1..5},tag=domainlayout] remove domainlayout
scoreboard players set @s[scores={domain=1..}] Camera 5

execute as @s[scores={domain=90..100}] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 0.35 in_out_circ pos ^ ^-0.25 ^3 facing ~~~
execute as @s[scores={domain=60..80}] at @s anchored eyes run camera @a[r=33] set minecraft:free pos ^ ^ ^2 facing ~~~
execute as @s[scores={domain=59}] at @s anchored eyes run camera @a[r=33] set minecraft:free ease 1.5 in_out_circ pos ^ ^ ^12 facing ~~~


execute as @s[scores={domain=90}] at @s run camera @a[r=33] fade time 0.5 1 0.5 color 255 255 255
execute as @s[scores={domain=70..90}] at @s run particle ds:infinite_void_whitev1_small ~~~
execute as @s[scores={domain=70..90}] at @s run particle ds:infinite_void_whitev2 ~~~


execute as @s[scores={domain=70}] at @s run summon ds:domain_barrier_white UnlimitedBarrier ~~~
execute as @s[scores={domain=70}] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter 1281
execute as @s[scores={domain=70}] at @s run scoreboard players operation @e[name=UnlimitedBarrier,r=0.15,c=1] Deleter += @s Energy
execute as @s[scores={domain=70}] at @s run scoreboard players set @e[name=UnlimitedBarrier,r=0.15,c=1] Energy 35

execute as @s[scores={domain=69}] at @s as @e[r=47,type=!item,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,name=!UnlimitedBarrier,name=!UnlimitedVoidStart,tag=!domainunselect] at @s run tp @s ~ 301.1 ~0
execute as @s[scores={domain=60..69}] at @s as @e[r=47,type=!item,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,name=!UnlimitedBarrier,name=!UnlimitedVoidStart,tag=!domainunselect] at @s run tp @s ~ 301.25 ~
execute as @s[scores={domain=70}] at @s run effect @e[r=33] night_vision 2 1 true


execute as @s[scores={domain=68}] at @s run summon ds:projectile UnlimitedVoidStart ~ 298.85 ~
execute as @s[scores={domain=67..68}] at @s run scoreboard players set @e[type=ds:projectile,name=UnlimitedVoidStart,r=33,c=1] Deleter 561
execute as @e[type=ds:projectile,name=UnlimitedVoidStart,r=33,c=1] at @s run function limitless/unlimited_start
execute as @s[scores={domain=67..68}] at @s positioned ~~~0 run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air
execute as @s[scores={domain=67..68}] at @s positioned ~~~0 run fill ~33 299 ~33 ~-33 299 ~-33 barrier [] replace air


execute as @s[scores={domain=50..70}] at @s positioned ~~~ run fill ~33 300 ~33 ~-33 300 ~-33 barrier [] replace air


execute as @s[scores={domain=66..67}] at @s run tp @s @s
execute as @s[scores={domain=65..66}] at @s run tp @s ~~~ facing ~~~1
execute as @s[scores={domain=60..64}] at @s run tp @s ~~~ facing ^^^20

execute as @s[scores={domain=60..70}] at @s as @e[r=33] at @s if block ~~~ barrier run tp @s ~~1.1~

execute as @s[scores={domain=20}] at @s run camera @a[r=33] fade time 0.5 0.5 0.5 color 255 255 255
execute as @s[scores={domain=20}] at @s run summon ds:domain_barrier_inside UnlimitedVoid ~ 298.85 ~

execute as @s[scores={domain=20}] at @s run particle ds:unlimited_eye ^^1.5^26
execute as @s[scores={domain=20}] at @s run particle ds:unlimited_eye1 ^^1.5^26
execute as @s[scores={domain=20}] at @s run particle ds:unlimited_eye2 ^^1.5^26
execute as @s[scores={domain=20}] at @s run particle ds:unlimited_eye3 ^^1.5^26

execute as @s[scores={domain=19..20}] at @s run scoreboard players add @e[name=UnlimitedVoid,r=33,c=1] Deleter 731
execute as @s[scores={domain=20}] at @s run scoreboard players operation @e[name=UnlimitedVoid,r=33,c=1] Deleter += @s Energy
execute as @s[scores={domain=19..20}] at @s run scoreboard players operation @s domainactive = @e[name=UnlimitedVoid,r=33,c=1] Deleter


execute as @s[scores={domain=20}] at @s run effect @a[r=33] night_vision 2 1 true


execute as @s[scores={domain=1..5}] at @s run camera @a[r=33] clear


tag @s[scores={domain=1..3},tag=quickdomain] remove quickdomain


