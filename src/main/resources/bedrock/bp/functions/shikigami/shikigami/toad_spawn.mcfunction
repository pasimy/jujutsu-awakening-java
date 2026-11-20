execute if entity @s[tag=!rogue_sorcerer,tag=!sukuna,type=player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_sorcerer
execute if entity @s[tag=rogue_sorcerer,tag=!sukuna,type=player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_rogue
execute if entity @s[tag=sukuna,type=player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_sukuna
execute if entity @s[tag=!rogue_sorcerer,tag=!sukuna,type=!player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_sorcerer_ptrg
execute if entity @s[tag=rogue_sorcerer,tag=!sukuna,type=!player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_rogue_ptrg
execute if entity @s[tag=sukuna,type=!player] run event entity @e[type=ds:familiar_entity,r=1,c=1] toad_spawn_sukuna_ptrg
camerashake add @a[r=15] 0.2 1