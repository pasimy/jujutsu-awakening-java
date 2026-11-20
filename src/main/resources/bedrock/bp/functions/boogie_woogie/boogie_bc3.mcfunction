
#animation
execute as @s[scores={move=30}] run playanimation @s animation.todo.stylistic_swap1

scoreboard players set @s[scores={move=21}] atk 2
execute as @s[scores={move=20}] at @s positioned ^^^2.5 run playsound mob.witch.throw @a[r=15] ~~~ 9999 1.25 9999

tag @s[scores={move=20},tag=!swapper] add swapper

execute as @s[scores={move=20},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] positioned ^^^-2.5 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^2.5 unless entity @e[tag=styleswap_victim,r=2.45] run tag @s[tag=!styleswap_victim] add styleswap_victim
execute as @s[scores={move=20},tag=!sukuna,tag=!rogue_sorcerer,type=!player] unless entity @s[family=!purecurse,tag=!curse] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,family=purecurse,type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,tag=curse,type=!player] positioned ^^^-2.5 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^2.5 unless entity @e[tag=styleswap_victim,r=2.45] run tag @s[tag=!styleswap_victim] add styleswap_victim
execute as @s[scores={move=20},type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] positioned ^^^-2.5 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^2.5 unless entity @e[tag=styleswap_victim,r=2.45] run tag @s[tag=!styleswap_victim] add styleswap_victim
execute as @s[scores={move=20},family=!hero,tag=!sukuna,tag=!rogue_sorcerer,tag=!curse,family=!purecurse,type=!player] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] positioned ^^^-2.5 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^2.5 unless entity @e[tag=styleswap_victim,r=2.45] run tag @s[tag=!styleswap_victim] add styleswap_victim
execute as @s[scores={move=20},type=player] at @s positioned ^^^2.5 as @e[tag=!Frames,r=2.45,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] positioned ^^^-2.5 unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID positioned ^^^2.5 unless entity @e[tag=styleswap_victim,r=2.45] run tag @s[tag=!styleswap_victim] add styleswap_victim

execute as @s[scores={move=20}] at @s positioned ^^^2.5 if entity @e[tag=styleswap_victim,r=2.45,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[scores={brotherID=1..},r=100,tag=!styleswap_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] if score @s brotherID = @e[tag=swapper,r=1,c=1] brotherID run function boogie_woogie/brother_tag

execute as @s[scores={move=20},tag=yuji_itadori_brother,tag=!yuji_awakened_brother,tag=!styleswap_tag] at @s positioned ^^^2.5 if entity @e[tag=styleswap_victim,r=2.45,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[type=ds:yuji_itadori,r=100,c=1,tag=!styleswap_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=20},tag=yuji_awakened_brother,tag=!yuji_itadori_brother,tag=!styleswap_tag] at @s positioned ^^^2.5 if entity @e[tag=styleswap_victim,r=2.45,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[type=ds:yuji_itadori_awakened,r=100,c=1,tag=!styleswap_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=20},tag=yuji_awakened_brother,tag=yuji_itadori_brother,tag=!styleswap_tag] at @s positioned ^^^2.5 if entity @e[tag=styleswap_victim,r=2.45,tag=!Frames,tag=!unselect] at @s positioned ~~~ as @e[family=yuji,r=100,c=1,tag=!styleswap_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag

tag @s[scores={move=20},tag=swapper] remove swapper

execute as @s[scores={move=20}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45,c=1] at @s run particle ds:impact_vfx1 ~~1~
execute as @s[scores={move=20}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45,c=1] at @s run particle ds:ground_slam1
execute as @s[scores={move=20}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45,c=1] at @s run playsound random.explode @a[r=33] ~~~ 9999 1.5 9999
execute as @s[scores={move=20}] at @s positioned ^^^2.5 as @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45,c=1] at @s run camerashake add @a[r=20] 2 0.15

execute as @s[scores={move=15..19}] at @s positioned ^^^2.5 unless entity @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45] run scoreboard players set @s move 3
execute as @s[scores={move=15..20},tag=styleswap_tag] at @s positioned ^^^2.5 if entity @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45] run scoreboard players set @e[tag=styleswap_brother,r=100,c=1,scores={move=4..}] move 3
execute as @s[scores={move=15..20}] at @s positioned ^^^2.5 if entity @e[tag=!Frames,tag=!unselect,tag=styleswap_victim,r=2.45] run scoreboard players set @s move 1001



playanimation @s[scores={move=1000..1001}] animation.todo.stylistic_swap2
execute as @s[scores={move=998..1001}] at @s rotated ~ 0 run tp @e[tag=styleswap_victim,r=15,c=1] ^^^2 facing @s
execute as @s[scores={move=997..1001}] at @s run scoreboard players set @e[tag=styleswap_victim,r=15,c=1] Stun 80
execute as @s[scores={move=997..1001}] at @s run scoreboard players set @e[tag=styleswap_victim,r=15,c=1] Flourish 3
execute as @s[scores={move=900..1001}] at @s as @e[tag=styleswap_victim,r=100,c=1] unless entity @s[scores={knockdown=1..}] unless entity @s[scores={Flourish=1..,move=0},tag=!Frames] run playanimation @s animation.stunned

#Camera Stop and Stun
scoreboard players set @s[scores={move=900..1001,Stun=0..5}] Stun 25
scoreboard players set @s[scores={move=970..1001,Camera=0..5}] Camera 25
execute as @s[scores={move=900..1001}] at @s run scoreboard players set @e[tag=styleswap_brother,r=100,c=1] Stun 25
execute as @s[scores={move=970..1001}] at @s run scoreboard players set @s[tag=styleswap_brother,r=100,c=1] Camera 25
execute as @s[scores={move=900..1001}] at @s as @e[tag=styleswap_victim,r=100,c=1] unless entity @s[scores={Stun=21..}] run scoreboard players set @s Stun 20
execute as @s[scores={move=900..1001}] at @s as @e[tag=styleswap_victim,r=100,c=1] if entity @s[scores={Stun=21..}] run scoreboard players add @s Stun 1
execute as @s[scores={move=970..1001}] at @s run scoreboard players set @e[tag=styleswap_victim,r=100,c=1] Camera 25
tag @s[scores={move=3..},tag=!styleswap_todo] add styleswap_todo

execute as @s[scores={move=989..},type=player] at @s run camera @s set minecraft:free pos ^0.8^1.45^0.25 facing ^^1.45^
execute as @s[scores={move=989..}] at @s as @e[tag=styleswap_victim,r=100,c=1] run camera @s[type=player] set minecraft:free pos ^0.8^1.45^0.25 facing ^^1.45^
execute as @s[scores={move=989..}] at @s as @e[tag=styleswap_brother,r=100,c=1] run camera @s[type=player] set minecraft:free pos ^0.8^1.45^0.25 facing ^^1.45^

execute as @s[scores={move=988},type=player] at @s run camera @s set minecraft:free ease 1.5 in_out_circ pos ^1.15^1.45^ facing ^^1.45^
execute as @s[scores={move=988}] at @s as @e[tag=styleswap_victim,r=100,c=1] run camera @s[type=player] set minecraft:free ease 1.5 in_out_circ pos ^1.15^1.45^ facing ^^1.45^
execute as @s[scores={move=988}] at @s as @e[tag=styleswap_brother,r=100,c=1] run camera @s[type=player] set minecraft:free ease 1.5 in_out_circ pos ^1.15^1.45^ facing ^^1.45^

execute as @s[scores={move=989}] at @s run playsound mob.clap @a[r=50] ~~1~ 99999 0.9 99999
execute as @s[scores={move=974..989}] at @s run scriptevent ds:styleswap -0.75,1.25,0
camerashake add @s[scores={move=969..989},type=player] 0.1 0.08

playanimation @s[scores={move=972..973},tag=!styleswap_tag] animation.cancel
scoreboard players set @s[scores={move=972..973},tag=!styleswap_tag] move 3

execute as @s[scores={move=969}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=972..973}] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=972..973}] at @s run particle ds:boogie_woogie_tp2 ~~~

execute as @s[scores={move=950..970},type=player] at @s at @e[tag=styleswap_brother,r=100,c=1] rotated ~ 0 run camera @s set minecraft:free ease 0.08 in_sine pos ^5^5^-4 facing ^^1^1
execute as @s[scores={move=950..970}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s[type=player] rotated ~ 0 run camera @s set minecraft:free ease 0.08 in_sine pos ^5^5^-4 facing ^^1^1
execute as @s[scores={move=950..970}] at @s as @e[tag=styleswap_victim,r=100,c=1] at @e[tag=styleswap_brother,r=100,c=1] rotated ~ 0 run camera @s[type=player] set minecraft:free ease 0.08 in_sine pos ^5^5^-4 facing ^^1^1


execute as @s[scores={move=973}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run summon ds:projectile ~~~ facing ^^^10 none swap_tp
execute as @s[scores={move=973}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run scoreboard players set @e[type=ds:projectile,name=swap_tp,r=1,c=1] Deleter 10
execute as @s[scores={move=973}] at @s rotated ~ 0 run tp @e[tag=styleswap_brother,r=100,c=1] ~~0.25~ facing ^^0.25^10
execute as @s[scores={move=968}] at @s at @e[type=ds:projectile,name=swap_tp,r=100,c=1] run tp @s ~~~ facing ^^^10

execute as @s[scores={move=967..969}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run playsound mob.wither.shoot @a[r=50] ~~1~ 99999 1.25 99999
execute as @s[scores={move=950..969}] at @s run scoreboard players set @e[tag=styleswap_brother,r=100,c=1] atk 2
execute as @s[scores={move=968..972}] at @s run playanimation @e[tag=styleswap_brother,r=100,c=1] animation.todo.stylistic_swap_brother

execute as @s[scores={move=966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s[type=!player] facing entity @e[tag=styleswap_victim,r=100,c=1] feet rotated ~ 0 run tp @s ~~~ facing ^^^10
execute as @s[scores={move=950..966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run tp @s ~~~~ 0

execute as @s[scores={move=950..966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run tp @s ^^^0.6 true
execute as @s[scores={move=950..966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run tp @s ^^^0.6 true
execute as @s[scores={move=950..966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s run tp @s ^^^0.6 true
execute as @s[scores={move=950..966}] at @s as @e[tag=styleswap_brother,r=100,c=1] at @s positioned ^^^1 as @e[tag=!Frames,r=2.5,tag=!styleswap_todo,tag=!styleswap_brother,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] run function boogie_woogie/styleswap_hit



scoreboard players set @s[scores={move=900..950}] move 3



execute as @s[scores={move=1..3},tag=styleswap_todo] at @s run tag @e[tag=styleswap_victim,r=100,c=1] remove styleswap_victim
execute as @s[scores={move=1..3},tag=styleswap_todo] at @s run tag @e[tag=styleswap_brother,r=100,c=1] remove styleswap_brother
tag @s[scores={move=1..3},tag=styleswap_todo] remove styleswap_todo
tag @s[scores={move=1..3},tag=styleswap_tag] remove styleswap_tag
tag @s[scores={move=1..3},tag=form7] remove form7