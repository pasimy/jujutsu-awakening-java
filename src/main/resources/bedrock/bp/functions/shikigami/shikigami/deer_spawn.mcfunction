execute if entity @s[tag=!rogue_sorcerer,tag=!sukuna] run event entity @e[type=ds:familiar_entity,r=1,c=1] rounddeer_spawn_sorcerer
execute if entity @s[tag=rogue_sorcerer,tag=!sukuna] run event entity @e[type=ds:familiar_entity,r=1,c=1] rounddeer_spawn_rogue
execute if entity @s[tag=sukuna] run event entity @e[type=ds:familiar_entity,r=1,c=1] rounddeer_spawn_sukuna
camerashake add @a[r=15] 0.2 1




