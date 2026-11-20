
#animation
playanimation @s[scores={move=10}] animation.todo.jjk_jumping_todo

scoreboard players set @s[scores={move=6}] atk 2
execute as @s[scores={move=6}] at @s run playsound mob.clap @a[r=100] ~~~ 99999 1.25 99999

tag @s[scores={move=4..5},tag=!swapper] add swapper

execute as @s[scores={move=5},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] at @s positioned ^^^3 as @e[tag=!Frames,r=2.9,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] positioned ^^^-3 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9] run tag @s[tag=!jjk_jumpvictim] add jjk_jumpvictim
execute as @s[scores={move=5},tag=!sukuna,tag=!rogue_sorcerer,type=!player] unless entity @s[family=!purecurse,tag=!curse] at @s positioned ^^^3 as @e[tag=!Frames,r=2.9,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,family=purecurse,type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,tag=curse,type=!player] positioned ^^^-3 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9] run tag @s[tag=!jjk_jumpvictim] add jjk_jumpvictim
execute as @s[scores={move=5},type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] at @s positioned ^^^3 as @e[tag=!Frames,r=2.9,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] positioned ^^^-3 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9] run tag @s[tag=!jjk_jumpvictim] add jjk_jumpvictim
execute as @s[scores={move=5},family=!hero,tag=!sukuna,tag=!rogue_sorcerer,tag=!curse,family=!purecurse,type=!player] at @s positioned ^^^3 as @e[tag=!Frames,r=2.9,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] positioned ^^^-3 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9] run tag @s[tag=!jjk_jumpvictim] add jjk_jumpvictim
execute as @s[scores={move=5},type=player] at @s positioned ^^^3 as @e[tag=!Frames,r=2.9,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] positioned ^^^-3 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9] run tag @s[tag=!jjk_jumpvictim] add jjk_jumpvictim

execute as @s[scores={move=4..5}] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[scores={brotherID=1..},r=100,tag=!jjk_jumpvictim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] if score @s brotherID = @e[tag=swapper,r=1,c=1] brotherID run function boogie_woogie/brother_tag

execute as @s[scores={move=4..5},tag=yuji_itadori_brother,tag=!yuji_awakened_brother,tag=!jjk_jump_tag] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[type=ds:yuji_itadori,r=100,c=1,tag=!jjk_jumpvictim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=4..5},tag=yuji_awakened_brother,tag=!yuji_itadori_brother,tag=!jjk_jump_tag] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[type=ds:yuji_itadori_awakened,r=100,c=1,tag=!jjk_jumpvictim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=4..5},tag=yuji_awakened_brother,tag=yuji_itadori_brother,tag=!jjk_jump_tag] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[family=yuji,r=100,c=1,tag=!jjk_jumpvictim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag

tag @s[scores={move=4..5},tag=swapper] remove swapper

execute as @s[scores={move=4..5}] at @s positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] run playanimation @s animation.cancel
playanimation @s[scores={move=4..5},tag=!jjk_jump_tag] animation.cancel
execute as @s[scores={move=4..5}] at @s positioned ^^^3 unless entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] run scoreboard players set @s move 3
scoreboard players set @s[scores={move=4..5},tag=!jjk_jump_tag] move 3
execute as @s[scores={move=4..5},tag=jjk_jump_tag] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] run scoreboard players set @e[tag=jjk_jumpbrother,r=100,c=1,scores={move=4..}] move 3
execute as @s[scores={move=4..5},tag=jjk_jump_tag] at @s positioned ^^^3 if entity @e[tag=jjk_jumpvictim,r=2.9,tag=!Frames,tag=!unselect] if entity @e[tag=jjk_jumpbrother,r=100] run scoreboard players set @s move 1001



tag @s[scores={move=3..},tag=!jjk_jumptodo] add jjk_jumptodo
tp @s[scores={move=101..}] ~~~~ 0
execute as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run tp @s ~~~~ 0

#execute as @s[scores={move=962}] at @s run tp @e[tag=jjk_jumpvictim,r=100,c=1] ^^^1

scoreboard players set @e[r=8,scores={Stun=0..11},tag=!jjk_jumptodo,tag=!jjk_jumpbrother,tag=!jjk_jumpvictim,type=!player] Stun 12
scoreboard players set @e[r=8,scores={Disabled=0..11},tag=!jjk_jumptodo,tag=!jjk_jumpbrother,tag=!jjk_jumpvictim,type=!player] Disabled 12
execute as @s[scores={move=961..}] at @s as @e[r=5] unless entity @s[tag=!jjk_jumptodo,tag=!jjk_jumpbrother,tag=!jjk_jumpvictim] run scoreboard players set @s Camera 25
execute as @s[scores={move=961..}] at @s as @e[r=5,scores={Camera=25}] unless entity @s[tag=!jjk_jumptodo,tag=!jjk_jumpbrother,tag=!jjk_jumpvictim] run scoreboard players set @s Stun 25
execute as @s[scores={move=961..}] at @s as @e[r=5,scores={Camera=25}] unless entity @s[tag=!jjk_jumptodo,tag=!jjk_jumpbrother,tag=!jjk_jumpvictim] run scoreboard players set @s Disabled 25
execute as @s[scores={move=961..}] at @s as @e[r=5,scores={Camera=25},tag=!unselect,tag=!infinity] unless entity @s[tag=!jjk_jumptodo,tag=!jjk_jumpbrother] run scoreboard players set @s Frames 5



execute as @s[scores={move=1000}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=999..1000}] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=999..1000}] at @s run particle ds:boogie_woogie_tp2 ~~~
execute as @s[scores={move=999..1000}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=999..1000}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run particle ds:boogie_woogie_tp2 ~~~

camera @s[scores={move=999..},type=player] set minecraft:free pos ^3^1.33^1 facing ^^1.33^1
execute as @s[scores={move=999..}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] run camera @s[type=player] set minecraft:free pos ^3^1.33^1 facing ^^1.33^1

camera @s[scores={move=965},type=player] set minecraft:free ease 0.3 in_sine pos ^1^1.33^-2 facing ^^1.33^1
execute as @s[scores={move=965}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] run camera @s[type=player] set minecraft:free ease 0.3 in_sine  pos ^1^1.33^-2 facing ^^1.33^1


execute as @s[scores={move=999..}] at @s run playanimation @e[tag=jjk_jumpbrother,r=100,c=1] animation.todo.jjk_jumping_brother
execute as @s[scores={move=999..}] at @s run playanimation @e[tag=jjk_jumpvictim,r=100,c=1] animation.todo.jjk_jumping_victim

execute as @s[scores={move=1000}] at @s run tp @e[tag=jjk_jumpbrother,r=100,c=1] ^^^-0.33 facing ^^^1
execute as @s[scores={move=1000}] at @s run tp @e[tag=jjk_jumpvictim,r=100,c=1] ^^^1 facing ~~~
tp @s[scores={move=1000}] ^^^2.33 facing ^^^1



execute as @s[scores={move=980}] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=980}] at @s run particle ds:boogie_woogie_tp2 ~~~
execute as @s[scores={move=980}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=980}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run particle ds:boogie_woogie_tp2 ~~~
execute as @s[scores={move=980}] at @s run playsound mob.clap @a[r=100] ~~~ 99999 1.25 99999
execute as @s[scores={move=980}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=980}] at @s run playsound mob.enderdragon.flap @a[r=33] ^^1^1 99999 1.7 9999
execute as @s[scores={move=980}] at @s run tp @e[tag=jjk_jumpbrother,r=100,c=1] ^^^-0.37 facing ^^^1
tp @s[scores={move=980}] ^^^2.33 facing ^^^1

execute as @s[scores={move=965}] at @s run playsound mob.enderdragon.flap @a[r=33] ^^1^1 99999 1.25 9999
execute as @s[scores={move=996}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch1 ~~1~
execute as @s[scores={move=996}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch2 ~~1~
execute as @s[scores={move=996}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch3 ~~1~
execute as @s[scores={move=996}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.punch1 @a[r=33] ~~1~ 9999 1.4 9999
execute as @s[scores={move=996}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound random.explode @a[r=33] ~~1~ 9999 1.4 9999
execute as @s[scores={move=996}] at @s run camerashake add @a[r=10] 0.1 0.15

execute as @s[scores={move=989}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch1 ~~1~
execute as @s[scores={move=989}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch2 ~~1~
execute as @s[scores={move=989}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch3 ~~1~
execute as @s[scores={move=989}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.punch1 @a[r=33] ~~1~ 9999 1.77 9999
execute as @s[scores={move=989}] at @s run camerashake add @a[r=10] 0.08 0.15

execute as @s[scores={move=984}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch1 ~~1~
execute as @s[scores={move=984}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch2 ~~1~
execute as @s[scores={move=984}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:punch3 ~~1~
execute as @s[scores={move=984}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.punch1 @a[r=33] ~~1~ 9999 1.77 9999
execute as @s[scores={move=984}] at @s run camerashake add @a[r=10] 0.08 0.15

execute as @s[scores={move=980}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:impact_vfx1 ~~1~
execute as @s[scores={move=980}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.punch1 @a[r=33] ~~1~ 9999 1.35 9999
execute as @s[scores={move=980}] at @s run camerashake add @a[r=10] 0.25 0.15


execute as @s[scores={move=966}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=966}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:impact_vfx1 ~~1~
execute as @s[scores={move=966}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.shock1 @a[r=33] ~~1~ 9999 1.75 9999
execute as @s[scores={move=966}] at @s run camerashake add @a[r=10] 0.4 0.15


execute as @s[scores={move=960}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:slam
execute as @s[scores={move=960}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:large_impact1 ~~1~
execute as @s[scores={move=960}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run particle ds:impact_vfx1 ~~1~
execute as @s[scores={move=960}] at @s as @e[tag=jjk_jumpvictim,r=100,c=1] at @s run playsound mob.shock1 @a[r=33] ~~1~ 9999 1 9999
execute as @s[scores={move=960}] at @s run camerashake add @a[r=10] 2 0.15


execute as @s[scores={move=962..965}] at @s as @e[tag=jjk_jumpbrother,r=100,c=1] at @s run tp @s ^0.3^1^-1.33


scoreboard players random @s[scores={move=964},tag=!heavenlyrestriction] blackflashchance 1 150
scoreboard players set @s[scores={move=964},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

execute as @s[scores={move=959..960}] at @s run summon ds:knockback ~~~
scoreboard players set @s[scores={move=961}] atk 2
execute as @s[scores={move=959}] at @s run scoreboard players set @e[tag=jjk_jumpvictim,r=100,c=1] knockdown 100
execute as @s[scores={move=960}] at @s run effect @e[tag=jjk_jumpvictim,r=100,c=1] levitation 1 12 true
execute as @s[scores={move=960}] at @s run damage @e[tag=jjk_jumpvictim,r=100,c=1] 25 override entity @s
execute as @s[scores={move=960}] at @s run scoreboard players set @e[tag=jjk_jumpvictim,r=100,c=1] Stun 35
execute as @s[scores={move=960}] at @s run scoreboard players set @e[tag=jjk_jumpvictim,r=100,c=1] Hit 7
execute as @s[scores={move=960}] at @s run scoreboard players add @e[tag=jjk_jumpvictim,r=100,c=1] Evade 40
execute as @s[scores={move=960}] at @s run scoreboard players operation @e[tag=jjk_jumpvictim,r=100,c=1] damage += @s damageadd
execute as @s[scores={move=960}] at @s run scoreboard players operation @e[tag=jjk_jumpvictim,r=100,c=1] damage += @e[tag=jjk_jumpbrother,r=100,c=1] damageadd

scoreboard players set @s[scores={move=100..950}] move 3

#execute as @s[scores={move=1..3}] at @s unless entity @e[tag=jjk_jumpbrother,r=10] run playanimation @s animation.stunned
execute as @s[scores={move=1..3},tag=jjk_jumptodo] at @s run tag @e[tag=jjk_jumpvictim,r=100,c=1] remove jjk_jumpvictim
execute as @s[scores={move=1..3},tag=jjk_jumptodo] at @s run tag @e[tag=jjk_jumpbrother,r=100,c=1] remove jjk_jumpbrother
tag @s[scores={move=1..3},tag=jjk_jumptodo] remove jjk_jumptodo
tag @s[scores={move=1..3},tag=jjk_jump_tag] remove jjk_jump_tag
tag @s[scores={move=1..3},tag=form6] remove form6

