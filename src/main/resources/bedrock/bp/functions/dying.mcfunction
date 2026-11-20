tag @e[scores={dying=1..},type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!cursed_warder,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,tag=!dying] add dying
effect @e[scores={dying=1..},tag=dying] blindness 2 2 true
scoreboard players set @e[scores={dying=1..},tag=dying] Frames 5
scoreboard players set @e[scores={dying=1..},tag=dying] Stun 5
scoreboard players set @e[scores={dying=1..},tag=dying] Camera 5
scoreboard players set @e[scores={dying=1..},tag=dying] Move 5
scoreboard players set @e[scores={dying=1..,Mode=1..},tag=dying,tag=!basic_behavior,type=!player] Mode 0

execute as @e[scores={dying=1..},tag=dying,tag=!twinkick,type=player] at @s run tp @s ~~~
execute as @e[scores={dying=1..},tag=dying,type=!player] at @s run tp @s ~~~~ 0
effect @e[scores={dying=21..},tag=dying,tag=!basic_behavior,type=!player] slowness 1 10 true

tellraw @a[scores={dying=4..},tag=dying,tag=itemUse:ds:cursedenergy,tag=!reversecursed] {"rawtext":[{"text":"§cYou have not yet learned RCT..."}]}
tellraw @a[scores={dying=4..,reversecursedCD=1..,antiheal=0},tag=dying,tag=itemUse:ds:cursedenergy,tag=reversecursed,tag=!deathsentence,tag=!rctunless] {"rawtext":[{"text":"§cReverse Cursed Technique is on cooldown: §e"},{"score":{"name": "@p","objective": "reversecursedCD"}},{"text":"§c."}]}
tag @a[scores={dying=4..,reversecursedCD=0,Energy=300..,antiheal=0},tag=dying,tag=itemUse:ds:cursedenergy,tag=reversecursed,tag=!deathsentence,tag=!rctunless] add rctself
scoreboard players set @a[scores={dying=4..,reversecursedCD=0,Energy=300..,antiheal=0},tag=dying,tag=itemUse:ds:cursedenergy,tag=reversecursed,tag=!deathsentence,tag=!rctunless] move 41
scoreboard players add @a[scores={dying=4..,reversecursedCD=0,Energy=300..,antiheal=0},tag=dying,tag=itemUse:ds:cursedenergy,tag=reversecursed,tag=!deathsentence,tag=!rctunless] reversecursedCD 400
scoreboard players remove @a[scores={dying=4..,reversecursedCD=1..,Energy=300..,move=41,antiheal=0},tag=dying,tag=itemUse:ds:cursedenergy,tag=reversecursed,tag=!deathsentence,tag=!rctunless] Energy 300

damage @e[scores={dying=2},tag=dying] 99999 suicide
kill @e[scores={dying=1..2},tag=dying,family=dummy,type=!ds:no_finishers_dummy]

execute as @e[scores={dying=1..},tag=dying,type=ds:student_gojo] at @s run tp @e[type=ds:toji,scores={move=0,cutscene=0},r=13,c=1] ~~~-12 facing ~~1~
execute as @e[scores={dying=1..},tag=dying,type=ds:student_gojo] at @s run scoreboard players set @e[type=ds:toji,r=13,c=1] Stun 15

playanimation @e[scores={dying=1..},tag=dying,tag=yujifinisher1] animation.knock
execute as @e[scores={dying=1..},tag=dying,tag=cleaved_finisher] at @s run function yuji/cleavedfinisher
execute as @e[scores={dying=1..},tag=dying,tag=transfigure_death] at @s run function idle_transfig/transfigure_death
execute as @e[scores={dying=1..},tag=dying,tag=transfigure_death2] at @s run function idle_transfig/transfigure_death2

tag @e[scores={dying=1..},tag=dying,tag=blackflash_finisher_gojo2] remove blackflash_finisher_gojo2
tag @e[scores={dying=1..},tag=dying,tag=blackflash_finisher_itadori2] remove blackflash_finisher_itadori2
tag @e[scores={dying=1..},tag=dying,tag=blackflash_finisher_yuta2] remove blackflash_finisher_yuta2
tag @e[scores={dying=1..},tag=dying,tag=blackflash_finisher_nanami2] remove blackflash_finisher_nanami2
tag @e[scores={dying=1..},tag=dying,tag=focus_striked] remove focus_striked

scoreboard players remove @a[scores={dying=2},tag=dying] dying 1
scoreboard players remove @e[scores={dying=1..},tag=dying] dying 1
tag @e[scores={dying=0..2},tag=dying] remove dying
tag @e[scores={dying=0..2},tag=rctunless] remove rctunless