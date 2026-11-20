execute at @s[type=ds:rabbitescapeboss,tag=!confiscation] unless entity @e[type=ds:rabbitescapeboss,scores={Deleter=9..},tag=!confiscation,rm=0.15,r=30] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability1=3..},tag=!confiscation] ability1 2
execute at @s[type=ds:rabbitescape,tag=!confiscation] unless entity @e[type=ds:rabbitescape,scores={Deleter=9..},tag=!confiscation,rm=0.15,r=30] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability1=3..},tag=!confiscation] ability1 2
execute at @s[family=10s_shikigami,family=toad,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability2=3..},tag=!confiscation] ability2 2
execute at @s[family=10s_shikigami,family=divinedog,family=!shadows,type=!ds:white_wolf,type=!ds:white_wolfboss,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability3=3..},tag=!confiscation] ability3 2
execute at @s[family=10s_shikigami,family=nue,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability4=3..},tag=!confiscation] ability4 2
execute at @s[family=10s_shikigami,family=serpent,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability5=3..},tag=!confiscation] ability5 2
execute at @s[family=10s_shikigami,family=piercingox,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability6=3..},tag=!confiscation] ability6 2
execute at @s[family=10s_shikigami,family=elephant,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability7=3..},tag=!confiscation] ability7 2
execute at @s[family=10s_shikigami,family=rounddeer,family=!shadows,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability8=3..},tag=!confiscation] ability8 2
#tiger
execute at @s[type=ds:agito,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability10=3..},tag=!confiscation] ability10 2
execute at @s[type=ds:mahoragatamed,tag=!confiscation] run scoreboard players set @e[tag=shikigami,r=100,c=1,scores={ability11=3..},tag=!confiscation] ability11 2



execute at @s[type=ds:rabbitescapeboss] unless entity @e[type=ds:rabbitescapeboss,scores={Deleter=9..},rm=0.15,r=30] run tag @e[tag=shikigami,r=100,c=1,tag=rabbit_fight] remove rabbit_fight
execute at @s[type=ds:toad] run tag @e[tag=shikigami,r=100,c=1,tag=toad_fight] remove toad_fight
execute at @s[family=10s_shikigami,family=divinedog,family=!tamed] unless entity @e[family=10s_shikigami,family=divinedog,family=!tamed,scores={Deleter=9..},rm=0.15,r=30] run tag @e[tag=shikigami,r=100,c=1,tag=dog_fight] remove dog_fight
execute at @s[type=ds:nueboss] run tag @e[tag=shikigami,r=100,c=1,tag=nue_fight] remove nue_fight
execute at @s[type=ds:serpentboss] run tag @e[tag=shikigami,r=100,c=1,tag=serpent_fight] remove serpent_fight
execute at @s[type=ds:piercingox] run tag @e[tag=shikigami,r=100,c=1,tag=ox_fight] remove ox_fight
execute at @s[type=ds:maxelephantboss] run tag @e[tag=shikigami,r=100,c=1,tag=elephant_fight] remove elephant_fight
execute at @s[type=ds:rounddeerboss] run tag @e[tag=shikigami,r=100,c=1,tag=deer_fight] remove deer_fight
#tiger
execute at @s[type=ds:mahoragaboss] run tag @e[tag=shikigami,r=100,c=1,tag=mahoraga_fight] remove mahoraga_fight



execute unless entity @s[scores={Deleter=0..8}] run scoreboard players set @s[family=10s_shikigami,family=!divinedog,tag=!Big] Deleter 8
execute unless entity @s[scores={Deleter=0..9}] run scoreboard players set @s[family=10s_shikigami,family=!divinedog,tag=Big] Deleter 9
execute unless entity @s[scores={Deleter=0..13}] run scoreboard players set @s[family=10s_shikigami,family=divinedog] Deleter 13