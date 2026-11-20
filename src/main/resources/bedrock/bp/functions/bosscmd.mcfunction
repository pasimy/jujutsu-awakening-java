execute as @e[family=boss,tag=basic_behavior,c=1] at @s run function mobs/basic_behavior/basic_behavior



execute as @e[family=special_grade,family=boss,scores={atk=1..2},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,tag=!toji_function] at @s positioned ^^1^4 as @e[family=grade4,r=4] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] positioned ^^-1^-4 run damage @s 100 suicide entity @e[family=special_grade,family=boss,scores={atk=1..2},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,tag=!toji_function,r=0.15,c=1]
execute as @e[family=special_grade,family=boss,scores={atk=1..2},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,tag=!toji_function] at @s positioned ^^1^4 as @e[family=grade3,r=4] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] positioned ^^-1^-4 run damage @s 100 suicide entity @e[family=special_grade,family=boss,scores={atk=1..2},family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,tag=!toji_function,r=0.15,c=1]

execute as @e[family=special_grade,family=boss,scores={atk=1..2},tag=!toji_function,type=!ds:mahito] unless entity @s[family=!purecurse,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] at @s positioned ^^1^4 run damage @e[family=grade4,r=4] 100 suicide entity @s
execute as @e[family=special_grade,family=boss,scores={atk=1..2},tag=!toji_function,type=!ds:mahito] unless entity @s[family=!purecurse,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] at @s positioned ^^1^4 run damage @e[family=grade3,r=4] 100 suicide entity @s

execute as @e[family=special_grade,family=boss,scores={atk=1..2},type=ds:mahito] at @s positioned ^^1^4 run damage @e[family=grade4,r=4,family=!transfigured_human] 100 suicide entity @s
execute as @e[family=special_grade,family=boss,scores={atk=1..2},type=ds:mahito] at @s positioned ^^1^4 run damage @e[family=grade3,r=4,family=!transfigured_human] 100 suicide entity @s

execute as @e[family=special_grade,family=boss,scores={atk=1..2},tag=toji_function] at @s positioned ^^1^4 run damage @e[family=grade4,r=4,family=!flyhead] 100 suicide entity @s
execute as @e[family=special_grade,family=boss,scores={atk=1..2},tag=toji_function] at @s positioned ^^1^4 run damage @e[family=grade3,r=4,family=!flyhead] 100 suicide entity @s



execute as @e[type=!player,family=boss,scores={cutscene=3..},tag=!customfacing] at @s run tp @s ~~~~ 0
tag @e[type=!player,family=boss,scores={cutscene=1..2},tag=customfacing] remove customfacing

tag @e[c=1,family=boss,family=big,tag=!Big] add Big
tag @e[c=1,family=boss,family=Big,tag=!Big] add Big
execute as @e[type=!player,tag=yujis_friend] unless entity @s[family=hero,family=!purecurse,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] run tag @s remove yujis_friend



execute as @e[family=!special_grade,family=sorcerer] at @s unless entity @s[scores={Stun=1..}] if entity @e[family=special_grade,family=sorcerer,r=60] if entity @e[family=villain,r=60] unless entity @e[family=villain,r=10] run scoreboard players set @s Stun 40


#------------






execute as @e[type=ds:yuji_itadori_awakened,c=1] at @s run function mobs/sorcerers/yuji_awakened/yuji_awakened_cmds
execute as @e[type=ds:student_gojo2,c=1] at @s run function mobs/sorcerers/student_gojo/student_gojo_cmds
execute as @e[type=ds:student_gojo,c=1] at @s unless entity @e[type=ds:student_gojo2,c=1] run function mobs/sorcerers/student_gojo/student_gojo_cmds
execute as @e[type=ds:maki_cullinggames,c=16] at @s run function mobs/maki_culling

execute as @e[type=ds:higuruma,c=16] at @s run function mobs/higuruma
execute as @e[type=ds:hakari,c=16] at @s run function mobs/hakari
execute as @e[type=ds:kusakabe,c=16] at @s run function mobs/kusakabe
execute as @e[type=ds:yuji_itadori,c=1] at @s run function mobs/sorcerers/yuji/yuji_cmds
execute as @e[type=ds:todo,c=16] at @s run function mobs/todo

execute as @e[type=ds:megumi,c=16] at @s run function mobs/megumi
execute as @e[type=ds:inumaki,c=1] at @s run function mobs/sorcerers/inumaki/inumaki_cmds

execute as @e[type=ds:miwa,c=16] at @s run function mobs/miwa
execute as @e[type=ds:cursed_doll,c=5] at @s if entity @e[type=!ds:cursed_doll,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=15,c=1] run function mobs/cursed_doll/cursed_doll



execute as @e[type=ds:kashimo,c=16] at @s run function mobs/kashimo
execute as @e[type=ds:toji_boss,c=1] at @s run function mobs/toji/toji_cmds
execute as @e[type=ds:toji,c=1] at @s unless entity @e[type=ds:toji_boss,c=1] run function mobs/toji/toji_cmds
execute as @e[type=ds:toji_reawakened,c=16] at @s run function bosses/toji_v2
execute as @e[type=ds:toji_awakening,c=16] at @s run function bosses/toji_cutscene

execute as @e[type=ds:haruta,c=16] at @s run function mobs/haruta



#curses
execute as @e[type=wither] at @s run function bosses/wither
execute as @e[type=ds:mahito,c=16] at @s run function mobs/mahito
execute as @e[type=ds:jogo,c=16] at @s run function mobs/jogo
execute as @e[type=ds:finger_bearer,c=16] at @s run function bosses/finger_bearer

execute as @e[type=ds:azureflames_curse,c=16] at @s if entity @e[type=!ds:azureflames_curse,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=40,c=1] run function mobs/curses/azure_flames/azure_flames
execute as @e[type=ds:centipede_grade1,c=16] at @s if entity @e[type=!ds:centipede_grade1,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=40,c=1] run function mobs/curses/centipede/centipede

execute as @e[family=brute] at @s if entity @e[family=!brute,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=15,c=1] run function mobs/curses/brute
execute as @e[type=ds:sharko,c=16] at @s if entity @e[type=!ds:sharko,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=40,c=1] run function mobs/curses/sharko/sharko
execute as @e[type=ds:grasshopper_curse] at @s if entity @e[type=!ds:grasshopper_curse,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,r=15,c=1] run function mobs/curses/grasshopper/grasshopper



execute as @e[family=boss,family=regular_curse_m1s] at @s if entity @e[type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,family=!regular_curse_m1s,r=15,c=1] run function mobs/curses/regular_curse_m1s






#------------


#mobaggro
execute as @e[family=boss] unless entity @s[scores={combat=200..}] at @s if entity @e[scores={punch=1..},r=3,rm=0.15] run scoreboard players set @s combat 800
execute as @e[family=boss,family=neutral,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[scores={combat=1..},r=5,rm=0.15] run scoreboard players set @s combat 800
execute as @e[family=boss,family=hero,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[family=villain,r=33] run scoreboard players set @s combat 800
execute as @e[family=boss,family=hero,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[family=purecurse,r=33] run scoreboard players set @s combat 800
execute as @e[family=boss,family=hero,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[tag=curse,r=33] run scoreboard players set @s combat 800
execute as @e[family=boss,family=villain,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[family=hero,r=33] run scoreboard players set @s combat 800
execute as @e[family=boss,family=purecurse,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[family=sorcerer,r=33] run scoreboard players set @s combat 800
execute as @e[family=boss,family=purecurse,family=!gojo] unless entity @s[scores={combat=200..}] at @s if entity @e[family=human,r=33] run scoreboard players set @s combat 800


#teleport path
#execute as @e[type=ds:cursed_closet,family=boss,scores={detect_health=1..,strength=20..}] at @s if block ~~-0.25~ water run scoreboard players set @s Mode 151
#execute as @e[type=ds:cursed_closet,family=boss,scores={detect_health=1..,strength=20..}] at @s if block ~~-0.25~ lava run scoreboard players set @s Mode 151

#scoreboard players add @e[type=ds:cursed_closet,family=boss,scores={Deleter=1..,combat=1..},family=!shikigami] Deleter 1

execute as @e[family=!motionless,family=boss,scores={combat=1..,detect_health=0..,move=0,cutscene=0,punch=1..},tag=!basic_behavior] at @s unless entity @e[family=boss,scores={combat=1..},r=8,rm=0.15,tag=!Frames] unless entity @s[scores={nocts=6..},tag=nocts,tag=!spectator,tag=confiscation,tag=!havingcts] run scoreboard players add @s Mode 1
execute as @e[family=!motionless,family=boss,scores={Mode=125..,detect_health=0..,move=0,cutscene=0,punch=1..},tag=!basic_behavior] at @s unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={nocts=6..},tag=nocts,tag=!spectator,tag=confiscation,tag=!havingcts] run function mob_path

#despawn
execute as @e[family=boss,family=!bossfight,family=!projectile,family=!despawncito,family=!damage,type=!ds:cursed_doll,type=!ds:cursed_closet,type=!ds:mahoragaboss,type=!ds:mahoragatamed,tag=!domainactive,family=!grade4,family=!grade3,scores={scroll=1..}] at @s if entity @e[scores={combat=1..},r=60,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] run scoreboard players set @s scroll 0
execute as @e[family=boss,family=!bossfight,family=!projectile,family=!despawncito,family=!damage,type=!ds:cursed_doll,type=!ds:cursed_closet,type=!ds:mahoragaboss,type=!ds:mahoragatamed,tag=!domainactive,family=!grade4,family=!grade3] at @s unless entity @e[tag=domainactive,r=60] unless entity @e[scores={combat=1..},r=60,rm=0.15,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] unless entity @e[type=ds:cursed_closet,r=50] run scoreboard players add @s scroll 1
effect @e[family=boss,family=!bossfight,family=!projectile,family=!despawncito,family=!damage,type=!ds:cursed_closet,type=!ds:mahoragaboss,type=!ds:mahoragatamed,tag=!domainactive,family=!grade4,family=!grade3,scores={scroll=3170..}] invisibility 10 1 true
kill @e[family=boss,family=!bossfight,family=!projectile,family=!despawncito,family=!damage,type=!ds:cursed_closet,type=!ds:mahoragaboss,type=!ds:mahoragatamed,tag=!domainactive,family=!grade4,family=!grade3,scores={scroll=3200..}]

#scoreboard players set @e[type=ds:cursed_closet,scores={Evade=100..},type=!player] Mode 150
#scoreboard players set @e[type=ds:cursed_closet,scores={Evade=100..},type=!player] Evade 0



execute as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=16] at @s unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 at @s[r=3] run function _hitdodge

#execute as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=16,family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] positioned ^^^-3 facing entity @s feet positioned as @s rotated ~180 ~180 positioned ^^^3 as @e[scores={atk=1..},r=2.95,tag=!unselect] unless entity @s[family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer,type=!player] positioned ^^^-3 as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=1,family=hero,tag=!sukuna,tag=!curse,tag=!rogue_sorcerer] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s run function _hitdodge
#execute as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=16,tag=!sukuna,tag=!rogue_sorcerer] unless entity @s[family=!purecurse,tag=!curse] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 if entity @s[r=3] positioned ^^^-3 facing entity @s feet positioned as @s rotated ~180 ~180 positioned ^^^3 as @e[scores={atk=1..},r=2.95,tag=!unselect] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,family=purecurse,type=!player] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer,tag=curse,type=!player] positioned ^^^-3 as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=1,tag=!sukuna,tag=!rogue_sorcerer] unless entity @s[family=!purecurse,tag=!curse] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s run function _hitdodge
#execute as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=16] unless entity @s[tag=!sukuna,tag=!rogue_sorcerer] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 at @s[r=3] run function _hitdodge
#execute as @e[type=!player,tag=!basic_behavior,scores={combat=1..,Stun=0,move=0,Move=0,cutscene=0,strength=30..},c=16,family=!hero,tag=!sukuna,tag=!rogue_sorcerer,tag=!curse,family=!purecurse] unless entity @s[scores={DashCD_mob=1..}] unless entity @s[scores={domain=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={Hit=1..}] unless entity @s[scores={flashstep=1..}] at @s at @e[scores={atk=1..},r=6,rm=0.15,tag=!unselect] positioned ^^^3 at @s[r=3] run function _hitdodge