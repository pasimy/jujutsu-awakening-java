particle ds:dog_combine ~~1~
particle ds:dog_combine1 ~~1~
particle ds:dog_combine2 ~~1~
particle ds:dog_combine3 ~~1~
particle ds:deer_aura1
particle ds:deer_aura2
particle ds:deer_aura3
particle ds:dirt2
camerashake add @a[r=20] 2 0.25
playsound mob.wither.spawn @a ~~~ 1 2
playsound mob.wolf.death @a ~~~ 100000 0.4 100000
effect @a[r=20] night_vision 1 1 true
camera @a[r=20] fade time 0 0 0.25 color 0 0 0
playsound mob.wither.shoot @a ~~~ 100000 0.6 100000
execute as @e[tag=shikigami,r=100,c=1] if entity @s[tag=!rogue_sorcerer,tag=!sukuna,family=!rogue_sorcerer_clan,family=!sukuna_clan,type=player] run event entity @e[family=divinedog,r=1,c=1] totality_born_sorcerer
execute as @e[tag=shikigami,r=100,c=1] unless entity @s[tag=!rogue_sorcerer,family=!rogue_sorcerer_clan] if entity @s[tag=!sukuna,family=!sukuna_clan,type=player] run event entity @e[family=divinedog,r=1,c=1] totality_born_rogue
execute as @e[tag=shikigami,r=100,c=1] unless entity @s[tag=!sukuna,family=!sukuna_clan] if entity @s[type=player] run event entity @e[family=divinedog,r=1,c=1] totality_born_sukuna
execute if entity @s[family=divinedog] as @e[tag=shikigami,r=100,c=1] run event entity @s[tag=!rogue_sorcerer,tag=!sukuna,family=!rogue_sorcerer_clan,family=!sukuna_clan,type=!player] totality_born_sorcerer
execute if entity @s[family=divinedog] as @e[tag=shikigami,r=100,c=1] unless entity @s[tag=!rogue_sorcerer,family=!rogue_sorcerer_clan] run event entity @s[tag=!sukuna,family=!sukuna_clan,type=!player] totality_born_rogue
execute if entity @s[family=divinedog] as @e[tag=shikigami,r=100,c=1] unless entity @s[tag=!sukuna,family=!sukuna_clan] run event entity @s[type=!player] totality_born_sukuna

event entity @s[tag=!rogue_sorcerer,tag=!sukuna,family=!rogue_sorcerer_clan,family=!sukuna_clan,family=!divinedog,type=!player] totality_born_sorcerer
execute unless entity @s[tag=!rogue_sorcerer,family=!rogue_sorcerer_clan] run event entity @s[tag=!sukuna,family=!sukuna_clan,family=!divinedog,type=!player] totality_born_rogue
execute unless entity @s[tag=!sukuna,family=!sukuna_clan] run event entity @s[family=!divinedog,type=!player] totality_born_sukuna