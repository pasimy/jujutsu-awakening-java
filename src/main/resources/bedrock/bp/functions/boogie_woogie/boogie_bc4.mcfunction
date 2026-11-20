
#animation
execute as @s[scores={move=19..21}] run playanimation @s animation.todo.exception_slide

execute as @s[scores={move=11..18}] at @s run scriptevent ds:knockback 1.5
execute as @s[scores={move=7..9}] at @s run scriptevent ds:knockback 0.5
execute as @s[scores={move=17}] at @s run playsound mob.enderdragon.flap @a[r=33] ~~~ 9999 0.65 9999






scoreboard players set @s[scores={move=7}] atk 2
scoreboard players set @s[scores={move=6..11},tag=!unselect] Frames 7

tag @s[scores={move=6},tag=!swapper] add swapper

execute as @s[scores={move=6},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] at @s as @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID unless entity @e[tag=exception_victim,r=2.5] run tag @s[tag=!exception_victim] add exception_victim
execute as @s[scores={move=6},tag=!sukuna,tag=!rogue_sorcerer,type=!player] unless entity @s[family=!purecurse,tag=!curse] at @s as @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,family=purecurse,type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,tag=curse,type=!player] unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID unless entity @e[tag=exception_victim,r=2.5] run tag @s[tag=!exception_victim] add exception_victim
execute as @s[scores={move=6},type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] at @s as @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID unless entity @e[tag=exception_victim,r=2.5] run tag @s[tag=!exception_victim] add exception_victim
execute as @s[scores={move=6},family=!hero,tag=!sukuna,tag=!rogue_sorcerer,tag=!curse,family=!purecurse,type=!player] at @s as @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID unless entity @e[tag=exception_victim,r=2.5] run tag @s[tag=!exception_victim] add exception_victim
execute as @s[scores={move=6},type=player] at @s as @e[tag=!Frames,r=2.5,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!small] unless score @s[scores={brotherID=1..}] brotherID = @e[tag=swapper,r=1,c=1] brotherID unless entity @e[tag=exception_victim,r=2.5] run tag @s[tag=!exception_victim] add exception_victim

execute as @s[scores={move=6}] at @s if entity @e[tag=exception_victim,r=2.5,tag=!Frames,tag=!unselect] positioned ~~~ as @e[scores={brotherID=1..},r=100,tag=!exception_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] if score @s brotherID = @e[tag=swapper,r=1,c=1] brotherID run function boogie_woogie/brother_tag

execute as @s[scores={move=6},tag=yuji_itadori_brother,tag=!yuji_awakened_brother,tag=!exception_tag] at @s if entity @e[tag=exception_victim,r=2.5,tag=!Frames,tag=!unselect] positioned ~~~ as @e[type=ds:yuji_itadori,r=100,c=1,tag=!exception_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=6},tag=yuji_awakened_brother,tag=!yuji_itadori_brother,tag=!exception_tag] at @s if entity @e[tag=exception_victim,r=2.5,tag=!Frames,tag=!unselect] positioned ~~~ as @e[type=ds:yuji_itadori_awakened,r=100,c=1,tag=!exception_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag
execute as @s[scores={move=6},tag=yuji_awakened_brother,tag=yuji_itadori_brother,tag=!exception_tag] at @s if entity @e[tag=exception_victim,r=2.5,tag=!Frames,tag=!unselect] positioned ~~~ as @e[family=yuji,r=100,c=1,tag=!exception_victim,tag=!spectator,tag=!heavenlyrestriction,tag=!swapper] run function boogie_woogie/brother_tag

tag @s[scores={move=6},tag=swapper] remove swapper

execute as @s[scores={move=6}] at @s run playsound mob.witch.throw @a[r=15] ~~~ 9999 1.25 9999
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run particle ds:impact_vfx1 ~~1.5~
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run particle ds:leap ~~~
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run particle ds:ground_slam1
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run playsound random.explode @a[r=33] ~~~ 9999 1.5 9999
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run playsound mob.enderdragon.flap @a[r=33] ~~~ 9999 1.5 9999
execute as @s[scores={move=6}] at @s as @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] at @s run camerashake add @a[r=20] 2 0.15



execute as @s[scores={move=4..6}] at @s unless entity @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5,c=1] run scoreboard players set @s move 3
execute as @s[scores={move=4..6}] at @s if entity @e[tag=!Frames,tag=!unselect,tag=exception_victim,r=2.5] run scoreboard players set @s move 1001



tag @s[scores={move=3..},tag=!exception_todo] add exception_todo
tp @s[scores={move=22..}] ~~~~ 0
execute as @s[scores={move=919..1001},tag=exception_tag] at @s at @e[tag=exception_brother,r=100,c=1] facing entity @e[tag=exception_victim,r=120] feet rotated ~ 0 positioned as @s run tp @s ~~~ facing ^^^10
execute as @s[scores={move=22..},tag=exception_tag] at @s at @e[tag=exception_brother,r=100,c=1] rotated as @s rotated ~ 0 run tp @e[tag=exception_brother,r=1,c=1] ~~~ facing ^^^10

scoreboard players set @s Stun 25
scoreboard players set @s[scores={move=835..}] Camera 25
scoreboard players set @s[scores={move=22..},tag=!unselect] Frames 5
execute as @s[scores={move=22..},tag=exception_tag] at @s run scoreboard players set @e[tag=exception_brother,r=100,c=1] Stun 25
execute as @s[scores={move=835..},tag=exception_tag] at @s run scoreboard players set @e[tag=exception_brother,r=100,c=1] Camera 25
execute as @s[scores={move=22..920},tag=exception_tag] at @s run scoreboard players set @e[tag=exception_brother,r=100,c=1] Frames 5
execute as @s[scores={move=843..}] at @s run scoreboard players set @e[tag=exception_victim,r=100,c=1] Stun 25
execute as @s[scores={move=852..}] at @s run scoreboard players set @e[tag=exception_victim,r=100,c=1] Camera 25
execute as @s[scores={move=843..}] at @s run scoreboard players set @e[tag=exception_victim,r=100,c=1] Frames 5



playanimation @s[scores={move=999..1001}] animation.todo.exception_kick
execute as @s[scores={move=999..1001}] at @s run playanimation @e[tag=exception_victim,r=100,c=1] animation.todo.exception_kicked

execute as @s[scores={move=920..1001},tag=exception_tag] at @s run tp @e[tag=exception_victim,r=100,c=1] ~~1.4~ facing @s

execute as @s[scores={move=1000}] at @s run particle ds:dirt03
execute as @s[scores={move=942..1001}] at @s run camera @s set minecraft:free pos ^4^0.33^0.33 facing ^^1^
execute as @s[scores={move=942..1001},tag=exception_tag] at @s run camera @p[tag=exception_brother,r=100] set minecraft:free pos ^4^0.33^0.33 facing ^^1^
execute as @s[scores={move=942..1001}] at @s run camera @p[tag=exception_victim,r=100] set minecraft:free pos ^4^0.33^0.33 facing ^^1^



execute as @s[scores={move=971}] at @s run playsound mob.wither.shoot @a[r=33] ~~-5~ 99999 0.6 99999
execute as @s[scores={move=931..971}] at @s run camerashake add @a[r=10] 0.045 0.045
execute as @s[scores={move=971}] at @s run particle ds:dirt03
execute as @s[scores={move=971}] at @s run particle ds:up_kick1

execute as @s[scores={move=970}] at @s run particle ds:exception1 ^^1.65^1.85
execute as @s[scores={move=945}] at @s run particle ds:exception2 ^^1^-1.85

execute as @s[scores={move=939}] at @s run particle ds:leap
execute as @s[scores={move=939}] at @s run particle ds:ground_pound3
execute as @s[scores={move=939}] at @s run particle ds:ground_pound4
execute as @s[scores={move=939}] at @s run particle ds:dirt2 ~~1.4~
execute as @s[scores={move=940}] at @s run camerashake add @a[r=10] 2 0.15
execute as @s[scores={move=939..941}] at @s run particle ds:up_kick1
execute as @s[scores={move=939..940}] at @s run particle ds:up_kick2
execute as @s[scores={move=939}] at @s run particle ds:up_kick3
execute as @s[scores={move=939}] at @s run playsound mob.shock1 @a[r=33] ~~1~ 99999 1.3 99999
execute as @s[scores={move=939}] at @s run playsound mob.wither.break_block @a[r=33] ~~1~ 99999 0.8 99999
execute as @s[scores={move=939}] at @s run playsound mob.wither.shoot @a[r=33] ~~-5~ 99999 1.3 99999
execute as @s[scores={move=935..940}] at @s run camera @s set minecraft:free pos ^5^0.75^0.33 facing ^^2^
execute as @s[scores={move=935..940},tag=exception_tag] at @s run camera @p[tag=exception_brother,r=100] set minecraft:free pos ^5^0.75^0.33 facing ^^2^
execute as @s[scores={move=935..940}] at @s run camera @p[tag=exception_victim,r=100] set minecraft:free pos ^5^0.75^0.33 facing ^^2^

execute as @s[scores={move=933..934}] at @s run camera @s set minecraft:free ease 0.25 in_sine pos ^3^1^2 facing ^^3^-0.25
execute as @s[scores={move=933..934},tag=exception_tag] at @s run camera @p[tag=exception_brother,r=100] set minecraft:free ease 0.25 in_sine pos ^3^1^2 facing ^^3^-0.25
execute as @s[scores={move=933..934}] at @s run camera @p[tag=exception_victim,r=100] set minecraft:free ease 0.25 in_sine pos ^3^1^2 facing ^^3^-0.25
execute as @s[scores={move=923..924}] at @s run camera @s set minecraft:free ease 0.25 in_sine pos ^3^1.5^2 facing ^^1^-0.25
execute as @s[scores={move=923..924},tag=exception_tag] at @s run camera @p[tag=exception_brother,r=100] set minecraft:free ease 0.25 in_sine pos ^3^1.5^2 facing ^^1^-0.25
execute as @s[scores={move=923..924}] at @s run camera @p[tag=exception_victim,r=100] set minecraft:free ease 0.25 in_sine pos ^3^1.5^2 facing ^^1^-0.25

execute as @s[scores={move=920..928}] at @s run playsound random.whoop @a[r=33] ~~2~ 99999 1.45 9999



execute as @s[scores={move=920..923},tag=exception_tag] at @s run scoreboard players set @e[tag=exception_brother,r=100,c=1,scores={move=4..}] move 3
execute as @s[scores={move=916..919},tag=!exception_tag] at @s run scoreboard players set @e[tag=exception_victim,r=100,c=1] knockdown 50
playanimation @s[scores={move=916..919},tag=!exception_tag] animation.cancel
scoreboard players set @s[scores={move=916..919},tag=!exception_tag] move 3


execute as @s[scores={move=919}] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=919}] at @s run particle ds:boogie_woogie_tp ^^1.5^-0.5
execute as @s[scores={move=919}] at @s run particle ds:boogie_woogie_tp2 ^^1.5^-0.5
execute as @s[scores={move=919}] at @s run summon ds:rift ~~~ facing ^^^10 none swapper_location
execute as @s[scores={move=919}] at @s run event entity @e[name=swapper_location,type=ds:rift,r=1,c=1] ds:disappear
execute as @s[scores={move=919}] at @s run playsound mob.clap @a[r=50] ~~1.5~ 99999 1.25 99999

execute as @s[scores={move=919},tag=exception_tag] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:boogie_woogie_tp ~~~
execute as @s[scores={move=919},tag=exception_tag] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:boogie_woogie_tp2 ~~~

execute as @s[scores={move=919}] at @s positioned as @e[tag=exception_brother,r=100,c=1] run tp @s ~~~ facing ^^^10
execute as @s[scores={move=919}] at @e[name=swapper_location,type=ds:rift,r=100,c=1] run tp @e[tag=exception_brother,r=100,c=1] ~~~ facing ^^^10
execute as @s[scores={move=842..919}] at @s as @e[tag=exception_brother,r=100,c=1] at @s rotated ~ 0 run tp @e[tag=exception_victim,r=100,c=1] ^^^1.25 facing @s



execute as @s[scores={move=913},type=player] at @s run playanimation @e[tag=exception_brother,r=100,c=1] animation.todo.exception_brother
execute as @s[scores={move=913..919},type=player] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @s set minecraft:free pos ^1.5^0.25^0.3 facing ^^1.3^-1.5
execute as @s[scores={move=913..919}] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @p[tag=exception_victim,r=1] set minecraft:free pos ^1.5^0.25^0.3 facing ^^1.3^-1.5
execute as @s[scores={move=913..919}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[type=player] positioned ^^^1.25 run camera @s set minecraft:free pos ^1.5^0.25^0.3 facing ^^1.3^-1.5

execute as @s[scores={move=911..912},type=player] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @s set minecraft:free ease 2.5 in_out_circ pos ^-2.5^1^1 facing ^^1.3^0.25
execute as @s[scores={move=911..912}] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @p[tag=exception_victim,r=1] set minecraft:free ease 2.5 in_out_circ pos ^-2.5^1^1 facing ^^1.3^0.25
execute as @s[scores={move=911..912}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[type=player] positioned ^^^1.25 run camera @s set minecraft:free ease 2.5 in_out_circ pos ^-2.5^1^1 facing ^^1.3^0.25



execute as @s[scores={move=860},type=player] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @s set minecraft:free pos ^-6^1^ facing ^^1.3^1
execute as @s[scores={move=860}] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @p[tag=exception_victim,r=1] set minecraft:free pos ^-6^1^ facing ^^1.3^1
execute as @s[scores={move=860}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[type=player] positioned ^^^1.25 run camera @s set minecraft:free pos ^-6^1^ facing ^^1.3^1

execute as @s[scores={move=845},type=player] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @s set minecraft:free pos ^-12^1^ facing ^^1.3^1
execute as @s[scores={move=845}] at @s at @e[tag=exception_brother,r=100,c=1] positioned ^^^1.25 run camera @p[tag=exception_victim,r=1] set minecraft:free pos ^-12^1^ facing ^^1.3^1
execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[type=player] positioned ^^^1.25 run camera @s set minecraft:free pos ^-12^1^ facing ^^1.3^1

execute as @s[scores={move=915}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run playsound music.bass3 @a[r=100] ~~~ 99999 1 999999

execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run playsound mob.blackflash @a[r=100] ~~~ 9999 1.25 9999
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run playsound mob.blackflash2 @a[r=100] ~~~ 9999 0.85 9999
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run camerashake add @a[r=20] 1 0.25
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run playsound mob.punch1 @a[r=40] ~~1~ 999999 2.5 999999
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:invert ~~~
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:black_flash8 ^^1^1 
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:black_flash9 ^^1^1 

execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run playsound mob.kokusen3 @a[r=100] ~~~ 99999 1 99999

execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:red_tint
execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run camerashake add @a[r=20] 2 0.15

execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash2
execute as @s[scores={move=875}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash3

execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run summon gg:impact_frame ~~~
execute as @s[scores={move=843}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:red_tint
execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run particle ds:invert
execute as @s[scores={move=845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run camerashake add @a[r=20] 4 0.5 rotational
execute as @s[scores={move=835..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run scriptevent ds:lightning 1,0.85,0.75, 0.8,0.1,0.1, 0.8,0.1,0.1, 3,3,3, 3,3,3
execute as @s[scores={move=835..840}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run scriptevent ds:lightning 1,0.85,1, 0.8,0.1,0.1, 0.8,0.1,0.1, 2.75,2.75,2.75, 2.75,2.75,2.75
execute as @s[scores={move=835..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s run scriptevent ds:lightning 2,0.85,4, 0.8,0.1,0.1, 0.8,0.1,0.1, 4,4,4, 4,4,4
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash1
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash2
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash3
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash4
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash5
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash6
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash7
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash8
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash9
execute as @s[scores={move=844..845}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^1^2 run particle ds:black_flash10

execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[scores={blackflashlearn=0}] run function blackflash_first

execute as @s[scores={move=844}] at @s run scoreboard players set @e[tag=exception_brother,r=100,c=1] thezone 200
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] run scoreboard players set @s[hasitem={item=ds:yuji_fists},tag=!sukuna,type=player] thezone 221
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] unless entity @s[tag=has_sukuna,tag=sukuna] run scoreboard players set @s[family=yuji] thezone 221

execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[scores={blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] positioned ^^^1.25 if entity @e[tag=finalflash,r=3,family=special_grade] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[scores={blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] positioned ^^^1.25 if entity @e[tag=finalflash,r=3,family=special_grade] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[scores={blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] positioned ^^^1.25 if entity @e[tag=finalflash,r=3,scores={grade=5..},tag=!unselect] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[scores={blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] positioned ^^^1.25 if entity @e[tag=finalflash,r=3,scores={grade=5..},tag=!unselect] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={move=844}] at @s as @e[tag=exception_brother,r=100,c=1] run scoreboard players add @s[scores={blackflash_amount=0..}] blackflash_amount 1

execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run damage @e[tag=exception_victim,r=3,c=1] 75 override entity @s
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players set @e[tag=exception_victim,r=3,c=1] Stun 55
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players set @e[tag=exception_victim,r=3,c=1] Flourish 15
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players add @e[tag=exception_victim,r=3,c=1] Evade 45
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players add @e[tag=exception_victim,r=3,c=1] Hit 5
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s[tag=yuji_awakened] positioned ^^^1.25 run scoreboard players add @e[tag=exception_victim,r=3,c=1] antiheal 100
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players operation @e[tag=exception_victim,r=3,c=1] damage += @s damageadd
execute as @s[scores={move=842}] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run scoreboard players operation @e[tag=exception_victim,r=3,c=1] damage *= four Mode

scoreboard players set @s[scores={move=100..815}] move 3



execute as @s[scores={move=1..3},tag=exception_todo,tag=exception_tag] at @s as @e[tag=exception_brother,r=100,c=1] at @s positioned ^^^1.25 run tag @e[tag=exception_victim,r=100,c=1] remove exception_victim
execute as @s[scores={move=1..3},tag=exception_todo,tag=!exception_tag] at @s run tag @e[tag=exception_victim,r=100,c=1] remove exception_victim
execute as @s[scores={move=1..3},tag=exception_todo] at @s run tag @e[tag=exception_brother,r=100,c=1] remove exception_brother
tag @s[scores={move=1..3},tag=exception_tag] remove exception_tag
tag @s[scores={move=1..3},tag=exception_todo] remove exception_todo
tag @s[scores={move=1..3},tag=form8] remove form8
