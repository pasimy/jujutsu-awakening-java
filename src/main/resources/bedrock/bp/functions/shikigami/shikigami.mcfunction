tag @a[scores={detect_health=0},tag=rabbit_fight] remove rabbit_fight
tag @a[scores={detect_health=0},tag=toad_fight] remove toad_fight
tag @a[scores={detect_health=0},tag=dog_fight] remove dog_fight
tag @a[scores={detect_health=0},tag=nue_fight] remove nue_fight
tag @a[scores={detect_health=0},tag=serpent_fight] remove serpent_fight
tag @a[scores={detect_health=0},tag=ox_fight] remove ox_fight
tag @a[scores={detect_health=0},tag=elephant_fight] remove elephant_fight
tag @a[scores={detect_health=0},tag=deer_fight] remove deer_fight
tag @a[scores={detect_health=0},tag=mahoraga_fight] remove mahoraga_fight


#execute as @e[family=shikigami,family=!projectile,family=!despawncito,family=!damage,family=!motionless,type=!ds:agito] at @s unless entity @e[tag=shikigami,r=55] run tp @s @e[tag=shikigami,c=1]
#execute as @e[type=ds:agito] at @s unless entity @e[tag=shikigami,r=90] run tp @s @e[tag=shikigami,c=1]



execute as @e[family=10s_shikigami,family=!projectile,family=!despawncito,family=!damage,family=!motionless] unless entity @s[scores={Deleter=0..}] unless entity @s[type=!ds:shadowwolf,type=!ds:white_wolf,type=!ds:black_wolf,type=!ds:shadowrabbit,type=!ds:rabbitescape,type=!ds:toad,type=!ds:shadowserpent,type=!ds:serpent,type=!ds:maxelephant,type=!ds:rounddeer,type=!ds:agito,type=!ds:mahoragatamed] run function shikigami/shikigami_spawn

tag @e[type=ds:white_wolf,tag=!divinedog] add divinedog
tag @e[type=ds:black_wolf,tag=!divinedog] add divinedog
tag @e[type=ds:white_wolfboss,tag=!divinedog] add divinedog
tag @e[type=ds:black_wolfboss,tag=!divinedog] add divinedog

execute as @a[tag=rabbit_fight,tag=shikigami] at @s run function shikigami/shikigami/rabbit_boss
execute as @a[tag=dog_fight,tag=shikigami] at @s run function shikigami/shikigami/dog_boss
execute as @a[tag=toad_fight,tag=shikigami] at @s run function shikigami/shikigami/toad_boss
execute as @a[tag=nue_fight,tag=shikigami] at @s run function shikigami/shikigami/nue_boss
execute as @a[tag=serpent_fight,tag=shikigami] at @s run function shikigami/shikigami/serpent_boss
execute as @a[tag=ox_fight,tag=shikigami] at @s run function shikigami/shikigami/ox_boss
execute as @a[tag=elephant_fight,tag=shikigami] at @s run function shikigami/shikigami/elephant_boss
execute as @a[tag=deer_fight,tag=shikigami] at @s run function shikigami/shikigami/deer_boss



execute as @e[tag=divinedog,family=shikigami] at @s run function shikigami/shikigami/divinedog
execute as @e[tag=divinedog,family=!shikigami] at @s run function shikigami/shikigami/divinedogboss
execute as @e[type=ds:totality] at @s run function shikigami/shikigami/totality

execute as @e[type=ds:toad] at @s run function shikigami/shikigami/toad

execute as @e[type=ds:nueboss,family=nue] at @s run function shikigami/shikigami/nueboss

execute as @e[type=ds:serpent] at @s run function shikigami/shikigami/serpent
execute as @e[type=ds:serpenttrap] at @s run function shikigami/shikigami/serpenttrap
execute as @e[type=ds:serpentboss] at @s run function shikigami/shikigami/serpentboss

execute as @e[type=ds:piercingox] at @s run function shikigami/shikigami/piercingox

execute as @e[type=ds:maxelephantboss] at @s run function shikigami/shikigami/maxelephantboss
execute as @e[type=ds:maxelephant] at @s run function shikigami/shikigami/maxelephant

execute as @e[type=ds:rounddeerboss] at @s run function shikigami/shikigami/rounddeerboss
execute as @e[type=ds:rounddeer] at @s run function shikigami/shikigami/rounddeer



execute as @e[scores={Deleter=7..8},family=shikigami,tag=Big,family=!projectile,family=!despawncito,family=!damage,family=!motionless] at @s run particle ds:shikigami_appear3 ~~1~
execute as @e[scores={Deleter=7},family=shikigami,family=!projectile,family=!despawncito,family=!damage,family=!motionless] at @s run particle ds:shikigami_appear ~~1~
execute as @e[scores={Deleter=6},family=shikigami,family=!projectile,family=!despawncito,family=!damage,family=!motionless] at @s run effect @s invisibility 11 1 true
execute as @e[scores={Deleter=6},family=shikigami,family=!projectile,family=!despawncito,family=!damage,family=!motionless] at @s run tp @s ~~-200~


execute as @e[type=ds:projectile,name=ChimeraGarden1,tag=shadowgarden] at @s run function shikigami/chimera_garden1
execute as @e[type=ds:shadowgarden,name=ChimeraGarden2] at @s run function shikigami/chimera_garden2
execute as @e[type=ds:projectile,name=ChimeraBarrier] at @s run function shikigami/chimera_barrier

execute as @e[type=ds:nue,name="Nue Sweep"] at @s run function shikigami/nue_sweep
execute as @e[type=ds:nue,name="Nue Flap"] at @s run function shikigami/nue_flap
execute as @e[type=ds:projectile,name="NueBolt"] at @s run function shikigami/nue_bolt
