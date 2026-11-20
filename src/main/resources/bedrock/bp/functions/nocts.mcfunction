scoreboard players set @e[scores={nocts=1..},family=heavenlyrestriction] nocts 0
scoreboard players set @e[scores={nocts=1..},type=minecraft:wither] nocts 0
execute as @e[scores={nocts=8..},tag=!spectator,tag=confiscation,tag=!havingcts,type=!player,family=!heavenlyrestriction,tag=!nocts] at @s run function damageinsurance
execute as @e[scores={nocts=6..},tag=shikigami,tag=!spectator,tag=!nocts] at @s as @e[family=10s_shikigami,r=55] at @s run function shikigami/shikigami_callback

tag @e[scores={nocts=1..},type=!item,family=!projectile,family=!despawncito,family=!damage,family=!motionless,family=!curse_warder,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!xp_bottle,type=!ender_pearl,type=!lightning_bolt,type=!splash_potion,type=!lingering_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!spectator,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!ds:gojo_knockback,type=!gg:impact_frame,type=!armor_stand,family=!heavenlyrestriction,type=!minecraft:wither,tag=!nocts] add nocts

#playanimation @e[scores={chance=1..,nocts=1..},tag=nocts,type=!player] animation.cancel
#scoreboard players set @e[scores={chance=1..,nocts=1..},tag=nocts,type=!player] chance 0

scoreboard players set @a[scores={nocts=1..,Energy=1..},tag=nocts,tag=confiscation] Energy 0

effect @e[scores={nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts,type=!player] weakness 1 1 true
scoreboard players add @e[scores={Disabled=1..,Disabled_countdown=1..,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts,type=!player] Disabled 1
scoreboard players set @e[scores={Disabled=1..,Disabled_countdown=1..,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts,type=!player] Disabled_countdown 0
scoreboard players add @e[scores={Disabled=2..,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts,type=!player] Disabled_countdown 1
scoreboard players add @e[scores={reversecursedCD=0..5,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts] reversecursedCD 15
scoreboard players add @e[scores={divergentfistCD=0..5,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts] divergentfistCD 15
scoreboard players set @e[scores={divergent=4..,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts] divergent 3
scoreboard players set @e[scores={domainamp=4..,nocts=1..},tag=nocts,tag=confiscation,tag=!havingcts] domainamp 3

execute as @e[scores={Deleter=14..,nocts=1..},tag=nocts,family=10s_shikigami] at @s run function shikigami/shikigami_callback
scoreboard players set @e[scores={nocts=1..,hakarimode=4..},tag=nocts,tag=confiscation] hakarimode 3
scoreboard players remove @e[scores={nocts=1..,hakarimode=7..},tag=nocts,tag=!confiscation,tag=!domainamplification] hakarimode 4
scoreboard players set @e[scores={nocts=1..,amberbeast=4..,Energy=4..},tag=nocts,tag=confiscation] Energy 1
scoreboard players remove @e[scores={nocts=1..,amberbeast=5..,Energy=5..},tag=nocts,tag=!confiscation,tag=!domainamplification] Energy 4
scoreboard players set @e[scores={nocts=1..,painkiller=4..},tag=nocts,tag=!confiscation,tag=!domainamplification] painkiller 3
scoreboard players set @e[scores={nocts=1..,painkiller=4..},tag=nocts,tag=confiscation,tag=painkiller] painkiller 3
scoreboard players set @e[scores={bluefist=4..,nocts=1..},tag=nocts] bluefist 3
scoreboard players set @e[scores={levitate=4..,nocts=1..},tag=nocts] levitate 3
execute as @e[scores={infinity=4..,nocts=1..},tag=nocts] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run scoreboard players set @s infinity 3
execute as @e[scores={nocts=1..},tag=nocts,tag=instant_body] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run function idle_transfig/end_transformation
execute as @e[scores={nocts=1..,weapontype=1..},tag=nocts,type=ds:mahito] unless entity @s[scores={cutscene=1..}] unless entity @s[scores={move=1..}] unless entity @s[scores={domainstart=1..}] unless entity @s[scores={domain=1..}] run function idle_transfig/mob_fighting_switch

scoreboard players set @a[scores={nocts=1..,ltncloak=4..},tag=nocts,tag=confiscation] ltncloak 3
scoreboard players add @a[scores={nocts=1..,ability1=0..5},tag=nocts] ability1 15
scoreboard players add @a[scores={nocts=1..,ability2=0..5},tag=nocts] ability2 15
scoreboard players add @a[scores={nocts=1..,ability3=0..5},tag=nocts] ability3 15
scoreboard players add @a[scores={nocts=1..,ability4=0..5},tag=nocts] ability4 15
scoreboard players add @a[scores={nocts=1..,ability5=0..5},tag=nocts] ability5 15
scoreboard players add @a[scores={nocts=1..,ability6=0..5},tag=nocts] ability6 15
scoreboard players add @a[scores={nocts=1..,ability7=0..5},tag=nocts] ability7 15
scoreboard players add @a[scores={nocts=1..,ability8=0..5},tag=nocts] ability8 15
scoreboard players add @a[scores={nocts=1..,ability9=0..5},tag=nocts] ability9 15
scoreboard players add @a[scores={nocts=1..,ability10=0..5},tag=nocts] ability10 15
scoreboard players add @a[scores={nocts=1..,ability11=0..5},tag=nocts] ability11 15
scoreboard players add @a[scores={nocts=1..,ability12=0..5},tag=nocts] ability12 15

scoreboard players add @a[scores={nocts=1..,sukuna_ab1=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab1 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab2=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab2 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab3=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab3 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab4=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab4 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab5=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab5 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab6=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab6 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab7=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab7 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab8=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab8 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab9=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab9 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab10=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab10 15
scoreboard players add @a[scores={nocts=1..,sukuna_ab11=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab11 15
scoreboard players add @e[scores={nocts=1..,sukuna_ab12=0..5},tag=nocts,tag=has_sukuna,tag=sukuna] sukuna_ab12 15

scoreboard players add @e[scores={nocts=1..,domainCD=0..5},tag=nocts,tag=!heavenlyrestriction] domainCD 15
tag @e[scores={nocts=1..,domainstart=0..,domain=0..,domainCD=0..,domainactive=0..},tag=nocts,type=!player,tag=!cantdomain] add cantdomain



scoreboard players remove @e[scores={nocts=1..},tag=nocts] nocts 1
execute as @e[scores={nocts=0..5},tag=nocts,tag=confiscation,tag=!havingcts,type=!player] at @s run function damageinsurance2
tag @e[scores={nocts=0..5},tag=confiscation] remove confiscation
tag @e[scores={nocts=0..5},tag=deathsentence] remove deathsentence
tag @e[scores={nocts=0..5},tag=nocts] remove nocts