scoreboard players set @e[r=50,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Frames 6
scoreboard players set @e[r=50,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Disabled 6
scoreboard players set @e[r=50,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Stun 6
scoreboard players set @e[r=50,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Move 6
tag @e[r=50,scores={Move=0..,move=0..,cutscene=0..},type=!player,tag=!skyfall,tag=!skyfall2,tag=!unlimited_hit] add unlimited_hit
scoreboard players set @a[r=50] Camera 6
kill @e[type=ds:red_reverse,r=60] 
kill @e[type=ds:knockback,r=60] 
kill @e[type=ds:boss_knockback1,r=60] 
kill @e[type=ds:boss_knockback_small,r=60] 
kill @e[type=ds:mahoraga_knockback1,r=60] 
kill @e[type=ds:mahoraga_knockback2,r=60] 

tag @s[scores={cutscene=630..},tag=skyfall,tag=!imyoucutscene] add imyoucutscene
execute as @s[scores={cutscene=630..}] at @s run tag @e[tag=skyfall2,r=50,c=1,tag=!imyoucutscene] add imyoucutscene
damage @s[scores={cutscene=619..},type=!player] 0 suicide entity @e[tag=skyfall2,r=50,c=1]

execute as @s[scores={cutscene=595..}] at @s run tp @s ~~-1~ true
execute as @s[scores={cutscene=595..}] at @s run tp @s ~~-0.25~ true
execute as @s[scores={cutscene=595..}] at @s run tp @s ~~-0.1~ true

execute facing entity @e[tag=skyfall2,r=50,c=1] feet rotated ~ 0 run tp @s ~~~ facing ^^^100
execute as @e[tag=skyfall2,r=50,c=1] at @s run tp @s ~~~~ 0
execute at @e[tag=skyfall2,r=50,c=1,scores={cutscene=56..461}] facing entity @s feet rotated ~ 0 run tp @e[tag=skyfall2,r=1,c=1,scores={cutscene=56..461}] ~~~ facing ^^^-100
scoreboard players set @s[scores={wep5=0..3599},type=player] wep5 3600
scoreboard players set @s[scores={chance=1..},type=!player] chance 0



execute as @s[scores={cutscene=510}] at @s anchored eyes run particle ds:imyou ^0.7 ^0.7 ^0.5

execute as @s[scores={cutscene=500}] at @s run camera @a[r=50] fade time 0.1 0 0.15 color 255 255 255
execute as @s[scores={cutscene=498}] at @s run summon ds:forest_scene ~~~ facing ^^^-10 none skyfallarea
execute as @s[scores={cutscene=111..498}] at @s run scoreboard players set @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] Deleter 20
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run tp @s ~~~
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run particle ds:skyfall_barrier
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run particle ds:skyfall1
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run particle ds:skyfall2
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run particle ds:skyfall3
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1] at @s run particle ds:skyfall4
execute as @e[name=skyfallarea,type=ds:forest_scene,r=50,c=1,scores={Deleter=0..10}] at @s run tp @s ~ ~-200 ~







execute as @s[scores={cutscene=620}] at @s as @a[r=50] at @s run function stopmusic
execute as @s[scores={cutscene=620}] at @s as @a[r=50] at @s run playsound music.skyfall @s ~~~ 99999 1 99999
camera @s[scores={cutscene=635..},type=player] fade time 0 0.2 0.25 color 0 0 0
camera @a[tag=skyfall2,scores={cutscene=635..},r=50,c=1] fade time 0 0.2 0.15 color 0 0 0

playanimation @s[scores={cutscene=635..}] animation.yuji.im_you
playanimation @e[tag=skyfall2,r=50,c=1,scores={cutscene=635..}] animation.yuji.im_you2


execute as @s[scores={cutscene=630..}] at @s anchored eyes run camera @a[r=60] set minecraft:free pos ^3 ^1 ^1.5 facing ^^^0.5
execute as @s[scores={cutscene=594}] at @s anchored eyes run camera @a[r=60] set minecraft:free pos ^ ^1 ^-2.5 facing ^^^15

execute as @s[scores={cutscene=580}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^ ^-0.5 ^6 facing ^^0.25^0.5
execute as @s[scores={cutscene=579}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 2 in_sine pos ^ ^-0.5 ^4 facing ^^0.25^0.5

execute as @s[scores={cutscene=579}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 2.5 in_sine pos ^ ^-0.5 ^4 facing ^^0.25^0.5

execute as @s[scores={cutscene=540}] at @s run camera @a[r=50] fade time 0.2 0.25 0.15 color 0 0 0
execute as @s[scores={cutscene=534}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^ ^-0.45 ^-4 facing ^^0.25^4
execute as @s[scores={cutscene=533}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 1.5 in_sine pos ^ ^-0.35 ^-3 facing ^^0.25^4

execute as @s[scores={cutscene=470}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^ ^1 ^3 facing ^^^
execute as @s[scores={cutscene=469}] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 1 in_sine pos ^-1 ^-0.8 ^-1.25 facing ^0.5^^7
execute as @s[scores={cutscene=430..450}] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^-1 ^-0.8 ^-1.25 facing ^0.5^^7

execute as @s[scores={cutscene=410..429}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^3 ^-0.25 ^-0.5 facing ^^-0.25^-0.5
execute as @s[scores={cutscene=390..409}] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^2.5 ^ ^-0.25 facing ^^^-0.25
execute as @s[scores={cutscene=370..388}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^3 ^-0.25 ^-0.5 facing ^^-0.25^-0.5

execute as @s[scores={cutscene=369}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^0.5 ^0.25 ^-1.5 facing ^^-0.25^0.5
execute as @s[scores={cutscene=350}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^0.25 ^-0.5 ^1.5 facing ^^-0.75^-4.5

execute as @s[scores={cutscene=324}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^^^-1.5 facing ^^-1^

execute as @s[scores={cutscene=293}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^ ^-0.45 ^ facing ^^^-2.5
execute as @s[scores={cutscene=292}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 1.25 in_out_circ pos ^ ^-0.45 ^0.15 facing ^^1^-2.5

execute as @s[scores={cutscene=265}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^3 ^-0.55 ^-0.5 facing ^^-0.25^-0.5
execute as @s[scores={cutscene=260}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.1 in_sine pos ^3 ^-0.55 ^-0.5 facing ^^-0.35^-0.35
execute as @s[scores={cutscene=259}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_sine pos ^3 ^-0.55 ^-0.5 facing ^^-0.25^-0.5

execute as @s[scores={cutscene=245}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.25 in_out_circ pos ^3 ^-0.25 ^0.5 facing ^^-0.25^0.5

execute as @s[scores={cutscene=235}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^1 ^-0.6 ^0.5 facing ^^-1^0.85
execute as @s[scores={cutscene=205}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^-0.25 ^-0.3 ^0.5 facing ^^-1^0.95
execute as @s[scores={cutscene=185}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^0.25 ^-0.3 ^-1.5 facing ^^-0.5^1.95



scoreboard players add @s[scores={punch=1..,cutscene=600..}] clashnumber 1

execute as @s[scores={cutscene=635}] at @s run playsound mob.blackflash2 @a[r=100] ~~~ 9999 1.25 9999
execute as @s[scores={cutscene=634..}] at @s run particle ds:black_flash3 ^^1^1
execute as @s[scores={cutscene=593..}] at @s run particle ds:black_flash_small1 ^^1^1
execute as @s[scores={cutscene=593}] at @s run camerashake add @a[r=50] 0.1 0.1

execute as @s[scores={cutscene=633}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=632}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=631}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=631}] at @s run camera @a[tag=!impactframesoff,r=50] fade time 0 0.1 0.1 color 0 0 0
execute as @s[scores={cutscene=630}] at @s run title @a[tag=!impactframesoff,r=50] title §l

tag @s[scores={cutscene=633,blackflashlearn=0},tag=!nomusic] add nomusic
execute if entity @s[scores={cutscene=633,blackflashlearn=0}] run function blackflash_first

execute as @s[scores={cutscene=633,blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={cutscene=633,blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={cutscene=633,blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @a[tag=skyfall2,r=50,scores={grade=5..},tag=!unselect] unless entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={cutscene=633,blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @a[tag=skyfall2,r=50,scores={grade=5..},tag=!unselect] unless entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={cutscene=633,blackflash_amount=0..}] at @s if entity @e[tag=skyfall2,r=50,tag=!unselect] run scoreboard players add @s blackflash_amount 1

tellraw @s[scores={cutscene=634},type=player] {"rawtext":[{"text":"§g[§eQuick Tip§g] §gIf your body is rotated weirdly during a cutscene, simply 'punching / left clicking' will rotate your body correctly in order to make the cutscene look better!"}]}
execute as @s[scores={cutscene=634},type=player] at @s run tellraw @p[tag=skyfall2,r=50] {"rawtext":[{"text":"§g[§eQuick Tip§g] §gIf your body is rotated weirdly during a cutscene, simply 'punching / left clicking' will rotate your body correctly in order to make the cutscene look better!"}]}

execute as @s[scores={cutscene=592..594}] at @s as @e[tag=skyfall2,r=50,c=1,tag=!unselect,tag=idle_transfig,tag=instant_body] at @s run function idle_transfig/end_transformation
execute as @s[scores={cutscene=594}] at @s if entity @e[tag=griefable] rotated ~ 0 run summon ds:projectile ^^^2 facing ^^^100 none break_the_wall
execute as @s[scores={cutscene=594}] at @s if entity @e[tag=griefable] rotated ~ 0 positioned ^^^2 run scoreboard players set @e[name=break_the_wall,type=ds:projectile,r=1,c=1] Deleter 32
execute as @s[scores={cutscene=594}] at @s if entity @e[tag=griefable] rotated ~ 0 positioned ^^^2 as @e[name=break_the_wall,type=ds:projectile,r=1,c=1] at @s run function break_the_wall

execute as @s[scores={cutscene=596}] at @s run playsound mob.blackflash @a[r=100] ~~~ 9999 1.2 9999
execute as @s[scores={cutscene=596}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=595}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=594}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=593}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=592}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=591}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=590}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=589}] at @s run title @a[tag=!impactframesoff,r=50] title §l
execute as @s[scores={cutscene=587}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=586}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=585}] at @s run title @a[tag=!impactframesoff,r=50] title §l

execute as @s[scores={cutscene=446}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=445}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=444}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=443}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=441}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=440}] at @s run title @a[tag=!impactframesoff,r=50] title §l

execute as @s[scores={cutscene=435}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=434}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=433}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=432}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=431}] at @s run title @a[tag=!impactframesoff,r=50] title §l

execute as @s[scores={cutscene=594}] at @s run playsound mob.blackflash2 @a[r=100] ~~~ 9999 0.85 9999
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash1 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash2 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash3 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash4 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash5 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash6 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash7 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash8 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash9 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:black_flash10 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:dirt0
execute as @s[scores={cutscene=592..594}] at @s run particle ds:impact1 ^^1^1
execute as @s[scores={cutscene=592..594}] at @s run particle ds:impact1 ^^1^3
execute as @s[scores={cutscene=592..594}] at @s run particle ds:impact1 ^^1^5
execute as @s[scores={cutscene=592..594}] at @s run particle ds:impact1 ^^1^7
execute as @s[scores={cutscene=592..594}] at @s run particle ds:rubble3 ^^^1

titleraw @s[scores={cutscene=600..630,clashnumber=0},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a§4☐☐☐☐☐☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=1},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐§4☐☐☐☐☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=2},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐§4☐☐☐☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=3},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐§4☐☐☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=4},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐§4☐☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=5},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐§4☐☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=6},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐§4☐☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=7},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐☐§4☐☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=8},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐☐☐§4☐☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=9},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐☐☐☐§4☐☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=10},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐☐☐☐☐§4☐ §l§f]=-§r"}]}
titleraw @s[scores={cutscene=600..630,clashnumber=11..},type=player] title {"rawtext":[{"text":"\n\n\n\n\n\n\n\n\n§r§f§l< §ePUNCH §l§f>\n\n §l§f-=[ §l§a☐☐☐☐☐☐☐☐☐☐☐§4 §l§f]=-§r"}]}
scoreboard players set @s[scores={cutscene=590..593,clashnumber=1..}] clashnumber 0

execute as @s[scores={clashnumber=0..9,cutscene=595..599}] at @s run function cancel_attack



execute as @s[scores={cutscene=590..595}] at @s run damage @e[tag=skyfall2,r=50,c=1] 0 suicide entity @s

execute as @s[scores={cutscene=595..}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^^1.6 facing @s
execute as @s[scores={cutscene=594}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^^7 facing @s
execute as @s[scores={cutscene=535}] at @s run tp @s ^^^5.75 facing @e[tag=skyfall2,r=50,c=1]



execute as @s[scores={cutscene=450}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^^1 facing ^^^100
execute as @s[scores={cutscene=295..450}] at @s unless entity @e[tag=skyfall2,r=0.5] run tp @s ^^^0.065 facing ^^^100

execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=415..450}] at @s run tp @s ^^^0.16 facing ^^^100
execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=408..414}] at @s run tp @s ^^^0.2 facing ^^^100
execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=380..407}] at @s run tp @s ^^^0.25 facing ^^^100

execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=380}] at @s run particle ds:dirt2 ~~0.2~
execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=380}] at @s run particle ds:ground_slam2 ~~0.2~
execute as @e[tag=skyfall2,r=50,c=1,scores={cutscene=380}] at @s run particle ds:ground_slam2 ~~0.2~
execute as @s[scores={cutscene=293..295}] at @s at @e[tag=skyfall2,r=50,c=1] run tp @s ^^^-1.25 facing ~~~

execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:heavy_impact1
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:heavy_impact2
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:heavy_impact3
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:ground_slam2
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:ground_slam3
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:crater ~~0.2~
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run particle ds:leap ~~0.2~
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run camerashake add @a[r=50] 2 0.15
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run playsound mob.wither.break_block @a[r=75] ~~~ 99999 1.1 99999
execute as @s[scores={cutscene=260}] at @s positioned ^^^0.85 run playsound random.explode @a[r=75] ~~~ 99999 1.5 99999

execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run particle ds:heavy_impact1
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run particle ds:heavy_impact2
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run particle ds:heavy_impact3
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run particle ds:ground_slam2
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run particle ds:ground_slam3
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run camerashake add @a[r=50] 2 0.15
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run playsound mob.punch @a[r=75] ~~~ 99999 1.5 99999
execute as @s[scores={cutscene=240}] at @s positioned ^^0.25^0.95 run playsound random.explode @a[r=75] ~~~ 99999 2.25 99999
execute as @s[scores={cutscene=240}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^0.2^1^4 facing ^^^100
execute as @s[scores={cutscene=239}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^2^6 facing ^^^100
execute as @s[scores={cutscene=238}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^1^8 facing ^^^100
execute as @s[scores={cutscene=236..237}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^^9 facing ^^^100

execute as @s[scores={cutscene=135..225}] at @s run tp @s ^^^0.095 facing @e[tag=skyfall2,r=50,c=1]

execute as @s[scores={cutscene=160}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^-1 ^-0.25 ^1 facing ^^-0.75^
execute as @s[scores={cutscene=135}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.75^

execute as @s[scores={cutscene=121}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.1 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.85^-0.25
execute as @s[scores={cutscene=119}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.75^

execute as @s[scores={cutscene=109}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.1 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.85^-0.25
execute as @s[scores={cutscene=107}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.75^

execute as @s[scores={cutscene=106}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.1 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.85^-0.25
execute as @s[scores={cutscene=104}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_out_circ pos ^-1 ^-0.25 ^1 facing ^^-0.75^


execute as @s[scores={cutscene=102}] at @s run tp @s ^^^-0.66 facing @e[tag=skyfall2,r=50,c=1]
execute as @s[scores={cutscene=101}] at @s anchored eyes run camera @a[r=50] fade time 0.33 0.15 0.15 color 255 255 255
execute as @s[scores={cutscene=100}] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.5 in_out_circ pos ^1.25 ^-0.85 ^-0.5 facing ^^-0.4^1

execute as @s[scores={cutscene=58}] at @s anchored eyes run camera @a[r=50] fade time 0.33 0.1 0.1 color 0 0 0
execute as @s[scores={cutscene=55}] at @s anchored eyes run camera @a[r=50] set minecraft:free ease 0.15 in_out_circ pos ^1.25 ^ ^-0.5 facing ^-1^2^5

execute as @s[scores={cutscene=50}] at @s as @e[tag=skyfall2,r=50,c=1] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^-0.5^-0.15^1.5 facing ^^1.5^-1.5

execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run particle ds:punch1
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run particle ds:punch2
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run particle ds:punch3
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam2
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam3
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run playsound mob.shock1 @a[r=75] ~~~ 99999 1.5 99999
execute as @s[scores={cutscene=125}] at @s positioned ^^0.33^1.25 run playsound random.explode @a[r=75] ~~~ 99999 2.3 99999


execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run particle ds:punch1
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run particle ds:punch2
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run particle ds:punch3
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam2
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam3
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run playsound mob.shock1 @a[r=75] ~~~ 99999 1.45 99999
execute as @s[scores={cutscene=121}] at @s positioned ^^0.33^1.25 run playsound random.explode @a[r=75] ~~~ 99999 2.25 99999


execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run particle ds:punch1
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run particle ds:punch2
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run particle ds:punch3
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam2
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam3
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run playsound mob.shock1 @a[r=75] ~~~ 99999 1.15 99999
execute as @s[scores={cutscene=109}] at @s positioned ^^0.33^1.25 run playsound random.explode @a[r=75] ~~~ 99999 2.25 99999

execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run particle ds:punch1
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run particle ds:punch2
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run particle ds:punch3
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam2
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam3
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run playsound mob.shock1 @a[r=75] ~~~ 99999 1 99999
execute as @s[scores={cutscene=106}] at @s positioned ^^0.33^1.25 run playsound random.explode @a[r=75] ~~~ 99999 2.15 99999

execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run particle ds:punch1
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run particle ds:punch2
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run particle ds:punch3
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam2
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run particle ds:ground_slam3
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run playsound mob.shock1 @a[r=75] ~~~ 99999 0.9 99999
execute as @s[scores={cutscene=98}] at @s positioned ^^0.33^1.25 run playsound random.explode @a[r=75] ~~~ 99999 2 99999


execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run particle ds:red_impact1
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run particle ds:red_impact2
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run particle ds:red_impact3
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run particle ds:ground_slam2
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run particle ds:ground_slam3
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run camerashake add @a[r=50] 0.4 0.15
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run playsound mob.shock1 @a[r=75] ~~~ 99999 1.2 99999
execute as @s[scores={cutscene=55}] at @s positioned ^^1^0.8 run playsound random.explode @a[r=75] ~~~ 99999 2 99999

execute as @s[scores={cutscene=36}] at @s as @a[r=50] at @s run playsound music.bass3 @s ~~~ 99999 1.25 99999
execute as @s[scores={cutscene=35}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=34}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=33}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=32}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=31}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=30}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=29}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=28}] at @s run title @a[tag=!impactframesoff,r=50] title §l

execute as @s[scores={cutscene=55}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^4^3.5 facing ^^^20
execute as @s[scores={cutscene=1..40}] at @s at @e[tag=skyfall2,r=50,c=1] run tp @s ^^0.15^-0.1 facing ~~~
execute as @s[scores={cutscene=1..55}] at @s as @e[tag=skyfall2,r=50,c=1] at @s if entity @e[tag=griefable] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock unless block ~~~ barrier unless block ~~1~ barrier unless block ~~2~ barrier unless block ~~3~ barrier run fill ~3 ~3 ~3 ~-3 ~ ~-3 air destroy
execute as @s[scores={cutscene=1..40}] at @s if entity @e[tag=griefable] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock unless block ~~~ barrier unless block ~~1~ barrier unless block ~~2~ barrier unless block ~~3~ barrier run fill ~3 ~3 ~3 ~-3 ~ ~-3 air destroy

execute as @s[scores={cutscene=27}] at @s anchored eyes run camera @a[r=50] set minecraft:free pos ^-0.75^0.5^-2.5 facing ^^-0.15^2
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:red_impact1
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:red_impact2
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:red_impact3
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:dirt2
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:dirt0
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:impact1
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:ground_slam2
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:ground_slam3
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run camerashake add @a[r=50] 1 0.85
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run playsound mob.shock1 @a[r=75] ~~~ 99999 0.65 99999
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run playsound random.explode @a[r=75] ~~~ 99999 2 99999
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash1
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash2
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash3
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash4
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash5
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash6
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash7
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash8
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash9
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run particle ds:black_flash10
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run playsound mob.blackflash @a[r=75] ~~~ 99999 1.15 99999
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run playsound mob.blackflash2 @a[r=75] ~~~ 99999 0.75 99999
execute as @s[scores={cutscene=25}] at @s positioned ^^^0.1 run playsound mob.kokusen @a[r=75] ~~~ 99999 0.97 99999

tag @s[scores={cutscene=23},tag=!thezone] add thezone
scoreboard players set @s[scores={cutscene=23}] thezone 221

execute if entity @s[scores={cutscene=23,blackflashlearn=0}] run function blackflash_first

execute as @s[scores={cutscene=23,blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={cutscene=23,blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={cutscene=23,blackflash_amount_special=0..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @a[tag=skyfall2,r=50,scores={grade=5..},tag=!unselect] unless entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run scoreboard players add @s blackflash_amount_special 1
execute as @s[scores={cutscene=23,blackflash_amount_special=10..,forms=0..3},type=player,tag=yuji_awakened] at @s if entity @a[tag=skyfall2,r=50,scores={grade=5..},tag=!unselect] unless entity @e[tag=skyfall2,r=50,family=special_grade,tag=!unselect] run tellraw @s {"rawtext":[{"text":"§eYour Experience has grown, you can now advance your §4Cursed Technique§e!"}]}
execute as @s[scores={cutscene=23,blackflash_amount=0..}] at @s if entity @e[tag=skyfall2,r=50,tag=!unselect] run scoreboard players add @s blackflash_amount 1

execute as @s[scores={cutscene=23}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=22}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=21}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=20}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=19}] at @s run title @a[tag=!impactframesoff,r=50] title 
execute as @s[scores={cutscene=18}] at @s run title @a[tag=!impactframesoff,r=50] title §l
execute as @s[scores={cutscene=17}] at @s run scoreboard players set @e[tag=skyfall2,r=50,c=1] knock 200
execute as @s[scores={cutscene=17}] at @s run scoreboard players set @e[tag=skyfall2,r=50,c=1] Stun 200
execute as @s[scores={cutscene=17}] at @s run scoreboard players set @e[tag=skyfall2,r=50,c=1] dying 190
execute as @s[scores={cutscene=17},tag=yuji_awakened] at @s run scoreboard players add @e[tag=skyfall2,r=50,c=1] antiheal 200
execute as @s[scores={cutscene=17}] at @s run tp @e[tag=skyfall2,r=50,c=1] ^^^4.25 facing @s
execute as @s[scores={cutscene=1..17}] at @s as @e[tag=skyfall2,r=50,c=1] at @s run tp @s ~~-0.1~ true
execute as @s[scores={cutscene=1..17}] at @s as @e[tag=skyfall2,r=50,c=1] at @s run tp @s ~~-0.33~ true
execute as @s[scores={cutscene=1..17}] at @s as @e[tag=skyfall2,r=50,c=1] at @s run tp @s ~~-0.77~ true



execute as @s[scores={cutscene=1..3}] run tag @e[tag=imyoucutscene,r=50,c=2] remove imyoucutscene
execute as @s[scores={cutscene=1..3}] run tag @e[tag=skyfall2,r=50,c=1] remove skyfall2
tag @s[scores={cutscene=1..3},tag=skyfall] remove skyfall