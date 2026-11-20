tp @s[scores={move=100}] @s
playanimation @s[scores={move=100..}] animation.infinite_void_2sec
execute as @s[scores={move=84}] at @s run playsound mob.infinitevoidsmall @a ~~~ 100000 1 100000
execute as @s[scores={move=100}] at @s run camerashake add @a[r=48] 2 0.25
execute as @s[scores={move=100}] at @s run playsound mob.bass @a ~~~ 100000 1 100000
execute as @s[scores={move=100}] at @s run particle ds:domain_area0 ~~~
execute as @s[scores={move=100}] at @s run particle ds:domainarea0 ~~~
execute as @s[scores={move=100}] at @s run particle ds:domainarea1 ~~~
execute as @s[scores={move=1..80}] at @s run particle ds:domainarea ~~~

execute as @s[scores={move=95..100}] at @s if block ~~-0.1~ air run tp @s ~~-0.1~
execute as @s[scores={move=95..100}] at @s if block ~~-0.3~ air run tp @s ~~-0.3~
execute as @s[scores={move=95..100}] at @s if block ~~-0.5~ air run tp @s ~~-0.5~
execute as @s[scores={move=95..100}] at @s if block ~~-1~ air run tp @s ~~-1~



camera @s[scores={move=100},type=player] fade time 0.2 0.2 0.75 color 0 0 0

execute as @s[scores={move=100},type=player] at @s anchored eyes run camera @s set minecraft:free pos ^ ^-1.25 ^8 rot ~-25 ~180
execute as @s[scores={move=80},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.5 in_sine pos ^ ^0.15 ^0.85 rot ~3 ~180

execute as @s[scores={move=40},type=player] at @s anchored eyes run camera @s set minecraft:free ease 0.1 in_sine pos ^ ^2 ^8 rot ~22 ~180
execute as @s[scores={move=37},type=player] at @s anchored eyes run camera @s set minecraft:free ease 1.85 in_sine pos ^ ^2.5 ^10 rot ~24 ~180

tag @s[scores={move=36..},tag=!domainlayout] add domainlayout
tag @s[scores={move=1..35},tag=domainlayout] remove domainlayout
tag @s[scores={move=1..2},tag=form6b] remove form6b

scoreboard players set @s[scores={move=1..}] Camera 44
scoreboard players add @s[scores={move=100..}] infinity 15
scoreboard players add @s[scores={move=1..}] infinity 1
#scoreboard players set @s[scores={move=1..100}] ProjImmune 10

execute as @s unless entity @s[tag=domainclashing] run scoreboard players set @a[r=48,m=!spectator] DashCD 15

# New Tp Place Still, stop moving and Stun (only if not clashing)
execute as @s[scores={domainstart=1..200}] at @s[tag=!domainclashing] run execute as @e[r=48,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s run tp @s ~~~
effect @s speed 1 4 true



# starting new clashing stuff from here
execute as @s[scores={domainstart=4..70}] at @s unless entity @e[type=ds:domain_clash_main,r=50] unless entity @e[type=ds:clash_starting,r=50] if entity @e[tag=domainlayout,r=48,rm=0.15] run tag @s add domainclashing
execute as @s[scores={domainstart=4..70}] at @s unless entity @e[type=ds:domain_clash_main,r=50] unless entity @e[type=ds:clash_starting,r=50] if entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard objectives add domain_clasher dummy
execute as @s[scores={domainstart=4..70}] at @s unless entity @e[type=ds:domain_clash_main,r=50] unless entity @e[type=ds:clash_starting,r=50] if entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @s domain_clasher 0
execute as @s[scores={domainstart=4..70}] at @s unless entity @e[type=ds:domain_clash_main,r=50] unless entity @e[type=ds:clash_starting,r=50] if entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[tag=domainclashing] domainstart 1001

# to lock out other bozos
execute as @s[scores={domainstart=999..}] at @s if entity @e[r=33,tag=domainclashing,scores={domain_clasher=4}] unless entity @s[scores={domain_clasher=1..4}] run scoreboard players set @s domainstart 3
execute as @s[scores={domainstart=999..}] at @s if entity @e[r=33,tag=domainclashing,scores={domain_clasher=4}] unless entity @s[scores={domain_clasher=1..4}] run tag @s remove domainclashing
execute as @s[scores={domainstart=999..}] at @s if entity @e[r=33,tag=domainclashing,scores={domain_clasher=4}] unless entity @s[scores={domain_clasher=1..4}] run function domainloser

# apply unique score based on who started first
execute as @s[tag=domainclashing,scores={domainstart=1000..1001,domain_clasher=0}] unless entity @e[tag=domainclashing,r=48,scores={domain_clasher=1..}] run scoreboard players set @s domain_clasher 1

execute as @s[tag=domainclashing,scores={domainstart=1000..1001,domain_clasher=0}] if entity @e[tag=domainclashing,r=48,scores={domain_clasher=1}] unless entity @e[tag=domainclashing,r=48,scores={domain_clasher=2..}] run scoreboard players set @s domain_clasher 2

execute as @s[tag=domainclashing,scores={domainstart=1000..1001,domain_clasher=0}] if entity @e[tag=domainclashing,r=48,scores={domain_clasher=2}] unless entity @e[tag=domainclashing,r=48,scores={domain_clasher=3..}] run scoreboard players set @s domain_clasher 3

execute as @s[tag=domainclashing,scores={domainstart=1000..1001,domain_clasher=0}] if entity @e[tag=domainclashing,r=48,scores={domain_clasher=3}] unless entity @e[tag=domainclashing,r=48,scores={domain_clasher=4..}] run scoreboard players set @s domain_clasher 4


execute as @s[scores={domainstart=961..}] at @s run playsound mob.wither.shoot @a[r=100] ^^-15^5 9999 0.25 99999
execute as @s[scores={domainstart=961..}] at @s run particle ds:domainclash ~~~
execute as @s[scores={domainstart=961..}] at @s run particle ds:domainclash1 ~~~
execute as @s[scores={domainstart=961..}] at @s run particle ds:domainclash2 ~~~
execute as @s[scores={domainstart=961..}] at @s run particle ds:domainclash3 ~~~

execute as @s[scores={domainstart=900..}] at @s if entity @e[tag=domainlayout,r=48,rm=0.15] run playanimation @s animation.infinite_void_standby2


execute as @s[scores={domainstart=955..961}] at @s unless entity @e[tag=domainclashing,rm=1,r=50,scores={domain_clasher=1..}] run scoreboard objectives add num dummy
execute as @s[scores={domainstart=955..961}] at @s unless entity @e[tag=domainclashing,rm=1,r=50,scores={domain_clasher=1..}] run scoreboard players add @s num 1
execute as @s[scores={domainstart=955..961}] at @s unless entity @e[tag=domainclashing,rm=1,r=50,scores={domain_clasher=1..}] if entity @s[scores={num=100..}] run execute as @e[scores={domainstart=1..1002},r=50] at @s run function cancel_attack
execute as @s[scores={domainstart=955..961}] at @s unless entity @e[tag=domainclashing,rm=1,r=50,scores={domain_clasher=1..}] run scoreboard players set @s domainstart 962


execute as @s[scores={domainstart=961}] at @s run scoreboard objectives add domain_clasher_id dummy
execute as @s[scores={domainstart=960}] at @s run scoreboard players random @s domain_clasher_id 1 999999
execute as @s[scores={domainstart=960}] at @s run tag @s add deploy_unlimitedvoid
execute as @s[scores={domainstart=960}] at @s run scriptevent ds:spawn_middle "domainclashing" "ds:clash_starting" "domainclashing"
execute as @s[scores={domainstart=960}] at @s run scoreboard players set @e[r=50] Stun 33


# repeat until deliberate removal of score
scoreboard players set @s[scores={domainstart=900..940}] domainstart 950

# Actually start normal cutscene, if not in a clash

execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run camerashake add @a[r=48] 1 0.15
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2secvoid_out1 ~~1~
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2secvoid_out2 ~~1~
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2secvoid_out3 ^^1^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye1 ^^2^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye2 ^^2^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye3 ^^2^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye1 ^^2^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye2 ^^2^-2.5
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:2sec_eye3 ^^2^-2.5
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:unlimited_void1 ~~1~
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:unlimited_void2 ~~1~
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:dirt2
execute as @s[scores={move=40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run effect @a[r=48] night_vision 1 1 true
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[scores={infinity=4..},r=48,tag=!domainactive,tag=!domainimmune,tag=!unselect,rm=0.15] infinity 3
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[scores={Evade=1..},r=48,tag=!domainactive,tag=!domainimmune,tag=!unselect,rm=0.15] Evade 0
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,r=48,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,rm=0.15] Camera 600
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run effect @e[scores={Camera=600},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15,type=!player] slowness 30 99 true
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run tag @e[scores={Camera=600,move=0..,cutscene=0..},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15,type=!player,tag=!unlimited_hit] add unlimited_hit
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run tag @e[scores={Camera=600,punch=1..},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15,type=!player,tag=!punch0] add punch0
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[scores={Camera=600},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15] Stun 600
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[scores={Camera=600},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15] Move 600
execute as @s[scores={move=37..40}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run scoreboard players set @e[scores={Camera=600},family=!heavenlyrestriction,tag=!heavenlyrestriction,tag=!domainimmune,tag=!domainactive,tag=!unselect,r=48,rm=0.15] Disabled 600
execute as @s[scores={move=37}] at @s run camera @a[r=48] fade time 0.1 0 0.1 color 1 0 1
execute as @s[scores={move=35}] at @s unless entity @e[tag=domainlayout,r=48,rm=0.15] run particle ds:voidstar ^^3^
