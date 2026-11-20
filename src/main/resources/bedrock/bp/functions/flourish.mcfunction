tag @e[type=!item,family=!projectile,family=!despawncito,family=!damage,family=!disappear,type=!xp_orb,type=!arrow,type=!thrown_trident,type=!fireball,type=!dragon_fireball,type=!small_fireball,type=!fireworks_rocket,type=!fishing_hook,type=!splash_potion,type=!area_effect_cloud,type=!snowball,type=!egg,type=!falling_block,tag=!unselect,type=!ds:lapse_explode,type=!ds:red_reversal,type=!ds:hollow_nuke,type=!ds:limitless_explosion,type=!ds:pressure,type=!ds:energy_explosion,type=!ds:massive_bomb,type=!ds:shrine_dmg,type=!ds:pachinko_impact1,type=!ds:bolt_explode,type=!ds:shikigami_impact,type=!ds:oxrushex,type=!gg:impact_frame,type=!armor_stand,scores={Flourish=1..},tag=!flourish] add flourish

playanimation @e[scores={Flourish=1..,move=0},tag=flourish,tag=!Frames] animation.stunned

execute as @e[type=!player,scores={Flourish=2..},tag=flourish] at @s run scoreboard players add @s Stun 1
execute as @e[type=!player,scores={Flourish=2..},tag=flourish] at @s run scoreboard players set @s Hit 4

execute as @e[scores={Flourish=1..3},tag=flourish,tag=!customknockback] at @s run scriptevent ds:knockback -3.5
execute as @e[scores={Flourish=4..},tag=flourish,tag=!customknockback] at @s run scriptevent ds:knockback -7

execute as @e[scores={Flourish=1..},tag=flourish,tag=!fallingflourish,tag=!customknockback] at @s if block ~~-1~ air run tag @s add fallingflourish

execute as @e[scores={Flourish=1..},tag=flourish,tag=fallingflourish] at @s if block ~~-1~ air run tp @s @s
execute as @e[scores={Flourish=1..},tag=flourish,tag=fallingflourish] at @s if block ~~-1~ air rotated ~ 0 run tp @s ^^-0.8^-0.65
execute as @e[scores={Flourish=1..},tag=flourish,tag=fallingflourish] at @s if block ~~-1~ air rotated ~ 0 run tp @s ^^-0.8^-0.65

execute as @e[scores={Flourish=1..},tag=flourish] at @s unless block ~~-0.3~ air run particle ds:sprint ~~~

tag @e[scores={Flourish=1..},tag=flourish,tag=hardknockback] remove hardknockback

execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s if block ~~-0.1~ air run tp @s ~~-0.1~
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s if block ~~-0.25~ air run tp @s ~~-0.25~
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s if block ~~-0.5~ air run scoreboard players add @s Flourish 1
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run playsound mob.wither.break_block @a ~~~ 1 2.25
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run playsound mob.wither.break_block @a ~~~ 1 1.75
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run playsound random.explode @a ~~~ 1 2.25
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run playsound random.explode @a ~~~ 1 2
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run particle ds:dirt2
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run particle ds:crater
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run camerashake add @a[r=10] 4 0.25
execute as @e[scores={Flourish=1..,knock=0},tag=flourish,tag=fallingflourish] at @s unless block ~~-1~ air run scoreboard players set @s knock 25
tag @e[scores={Flourish=1..,knock=1..},tag=flourish,tag=fallingflourish] remove fallingflourish
scoreboard players set @e[scores={Flourish=1..,knock=1..},tag=flourish] Flourish 0
tag @e[scores={Flourish=0,knock=1..},tag=customknockback] remove customknockback
tag @e[scores={Flourish=0,knock=1..},tag=flourish] remove flourish

execute as @e[scores={Flourish=1..},tag=flourish] at @s anchored eyes rotated ~ 0 unless block ^^^-0.33 air unless block ^^^-0.33 water unless block ^^^-0.33 lava unless block ^^^-0.33 fire unless block ^^^-0.33 soul_fire unless block ^^^-0.33 tallgrass unless block ^^^-0.33 double_plant unless block ^^^-0.33 red_flower unless block ^^^-0.33 yellow_flower unless block ^^^-0.33 stone_slab unless block ^^^-0.33 stone_slab2 unless block ^^^-0.33 stone_slab3 unless block ^^^-0.33 stone_slab4 unless block ^^^-0.33 short_grass unless block ^^^-0.33 fern unless block ^^^-0.33 tall_grass unless block ^^^-0.33 large_fern unless block ^^^-0.33 deadbush unless block ^^^-0.33 torchflower unless block ^^^-0.33 pitcher_plant unless block ^^^-0.33 vine unless block ^^^-0.33 twisting_vines unless block ^^^-0.33 weeping_vines unless block ^^^-0.33 bamboo_sapling unless block ^^^-0.33 bamboo unless block ^^^-0.33 reeds unless block ^^^-0.33 cave_vines unless block ^^^-0.33 cave_vines_body_with_berries unless block ^^^-0.33 cave_vines_head_with_berries unless block ^^^-0.33 kelp unless block ^^^-0.33 torch unless block ^^^-0.33 soul_torch unless block ^^^-0.33 redstone_torch unless block ^^^-0.33 unlit_redstone_torch unless block ^^^-0.33 ladder unless block ^^^-0.33 scaffolding unless block ^^^-0.33 chain unless block ^^^-0.33 frame unless block ^^^-0.33 glow_frame unless block ^^^-0.33 standing_sign unless block ^^^-0.33 spruce_standing_sign unless block ^^^-0.33 birch_standing_sign unless block ^^^-0.33 jungle_standing_sign unless block ^^^-0.33 acacia_standing_sign unless block ^^^-0.33 darkoak_standing_sign unless block ^^^-0.33 mangrove_standing_sign unless block ^^^-0.33 cherry_standing_sign unless block ^^^-0.33 bamboo_standing_sign unless block ^^^-0.33 crimson_standing_sign unless block ^^^-0.33 warped_standing_sign unless block ^^^-0.33 wall_sign unless block ^^^-0.33 spruce_wall_sign unless block ^^^-0.33 birch_wall_sign unless block ^^^-0.33 jungle_wall_sign unless block ^^^-0.33 acacia_wall_sign unless block ^^^-0.33 darkoak_wall_sign unless block ^^^-0.33 mangrove_wall_sign unless block ^^^-0.33 cherry_wall_sign unless block ^^^-0.33 bamboo_wall_sign unless block ^^^-0.33 crimson_wall_sign unless block ^^^-0.33 warped_wall_sign unless block ^^^-0.33 oak_hanging_sign unless block ^^^-0.33 spruce_hanging_sign unless block ^^^-0.33 birch_hanging_sign unless block ^^^-0.33 jungle_hanging_sign unless block ^^^-0.33 acacia_hanging_sign unless block ^^^-0.33 dark_oak_hanging_sign unless block ^^^-0.33 mangrove_hanging_sign unless block ^^^-0.33 cherry_hanging_sign unless block ^^^-0.33 bamboo_hanging_sign unless block ^^^-0.33 crimson_hanging_sign unless block ^^^-0.33 warped_hanging_sign unless block ^^^-0.33 standing_banner unless block ^^^-0.33 wall_banner unless block ^^^-0.33 lever unless block ^^^-0.33 stone_button unless block ^^^-0.33 wooden_button unless block ^^^-0.33 spruce_button unless block ^^^-0.33 birch_button unless block ^^^-0.33 jungle_button unless block ^^^-0.33 acacia_button unless block ^^^-0.33 dark_oak_button unless block ^^^-0.33 mangrove_button unless block ^^^-0.33 cherry_button unless block ^^^-0.33 bamboo_button unless block ^^^-0.33 crimson_button unless block ^^^-0.33 warped_button unless block ^^^-0.33 polished_blackstone_button unless block ^^^-0.33 end_rod unless block ^^^-0.33 lightning_rod unless block ^^^-0.33 glow_lichen unless block ^^^-0.33 hanging_roots unless block ^^^-0.33 frog_spawn unless block ^^^-0.33 spore_blossom unless block ^^^-0.33 small_amethyst_bud unless block ^^^-0.33 medium_amethyst_bud unless block ^^^-0.33 large_amethyst_bud unless block ^^^-0.33 amethyst_cluster run function wallbang

tag @e[scores={Flourish=1},tag=customknockback] remove customknockback
tag @e[scores={Flourish=1..2},tag=fallingflourish] remove fallingflourish
tag @e[scores={Flourish=1..2},tag=flourish] remove flourish
camera @s[scores={Flourish=1..2}] clear