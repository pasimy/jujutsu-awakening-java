execute as @s[scores={move=30..31}] run playanimation @s animation.todo.clap4

tag @s[scores={move=22..},tag=itemUse:ds:boogie_woogie1,tag=!feinted] add feinted

execute as @s[scores={move=21}] at @s run playsound mob.clap @a[r=100] ~~1~ 999999 1 999999
execute as @s[scores={move=21},tag=feinted] at @s run playsound mob.wither.shoot @a[r=50] ~~1~ 99999 3 99999
scoreboard players set @s[scores={move=20..21},tag=feinted] move 2

tag @s[scores={move=20},tag=!swapkick] add swapkick
tag @s[scores={move=20},tag=!swapper] add swapper

execute as @s[scores={move=20,BoogieSelfID=1..}] at @s positioned ~~~ as @e[scores={BoogieTargetID=1..},r=100,tag=!unselect,tag=!heavenlyrestriction,tag=!swapper] if score @s BoogieTargetID = @e[tag=swapper,r=1,c=1] BoogieSelfID run function boogie_woogie/swap
execute as @s[scores={move=20},tag=!just_swapped] at @s positioned ^^^5.05 run function boogie_woogie/swap_notarget

tag @s[scores={move=20},tag=swapkick] remove swapkick
tag @s[scores={move=20},tag=swapper] remove swapper
tag @s[scores={move=20},tag=just_swapped] remove just_swapped



playanimation @s[scores={move=998..1001}] animation.todo.clap4_kick

execute as @s[scores={move=998..}] at @s run scriptevent ds:knockback 1
tag @s[scores={move=998..},tag=just_swapped] remove just_swapped

scoreboard players random @s[scores={move=1000},tag=!heavenlyrestriction] blackflashchance 1 200
execute as @s[scores={move=1000,blackflashchance=!7},tag=!heavenlyrestriction] at @s positioned ^^^4 if entity @e[r=3.95,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] run scoreboard players random @s blackflashchance 1 36
scoreboard players set @s[scores={move=1000},tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7

execute as @s[scores={move=995..997}] at @s positioned ^^^4 as @e[r=3.95,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,type=!xp_orb,type=!arrow,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand] at @s run tp @s ~~~ facing @e[scores={move=995..997},r=10,c=1]

#scoreboard players set @s[scores={move=996}] atk 2
execute as @s[scores={move=995}] at @s positioned ^^^4 run scoreboard players set @e[r=3.95,tag=!Frames,type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand] Flourish 12
execute as @s[scores={move=995}] at @s positioned ^^^4 run scoreboard players operation @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] damage += @s damageadd
execute as @s[scores={move=995}] at @s positioned ^^^4 run damage @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] 20 override entity @s
execute as @s[scores={move=995}] at @s positioned ^^^4 run scoreboard players add @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] Hit 10
execute as @s[scores={move=995}] at @s positioned ^^^4 run scoreboard players set @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] Evade 8
execute as @s[scores={move=995}] at @s positioned ^^^4 run scoreboard players set @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] Stun 30
execute as @s[scores={move=995}] at @s positioned ^^^4 as @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] at @s run playsound mob.shock1 @a ~~~ 10000 1.2 10000
execute as @s[scores={move=995}] at @s positioned ^^^4 as @e[r=3.95,tag=!Frames,scores={Flourish=12},tag=!unselect] at @s run playsound mob.blood1 @a ~~~ 10000 0.85 10000
execute as @s[scores={move=995}] at @s positioned ^^^4 run playsound mob.wither.shoot @a ~~~ 10000 1.2 10000
execute as @s[scores={move=995}] at @s positioned ^^^4 run camerashake add @a[r=20] 4 1
execute as @s[scores={move=995}] at @s run particle ds:ground_slam1 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:ground_slam2 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:ground_slam3 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:ground_slam4 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:large_impact1 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:heavy_impact2 ^^1^0.25
execute as @s[scores={move=995}] at @s run particle ds:large_impact2 ^^1^0.25

scoreboard players set @s[scores={move=900..991}] move 2


tag @s[scores={move=1..2},tag=feinted] remove feinted
tag @s[scores={move=1..2},tag=form3] remove form3