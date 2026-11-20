#common
tag @s[tag=enhancedstr] remove enhancedstr
tag @s[tag=enhancedagi] remove enhancedagi
tag @s[tag=fasterce] remove fasterce
tag @s[tag=alleycat] remove alleycat

#uncommon
tag @s[tag=530kiq] remove 530kiq
tag @s[tag=tacticaliq] remove tacticaliq
tag @s[tag=exoskeleton] remove exoskeleton
tag @s[tag=satiated] remove satiated
tag @s[tag=lonewolf] remove lonewolf

#rare
tag @s[tag=roughce] remove roughce
tag @s[tag=blessedstrength] remove blessedstrength
scoreboard players set @s[tag=rctmaster,scores={rctuses=1}] rctuses 0
scoreboard players remove @s[tag=rctmaster,scores={rctuses=2..}] rctuses 2
tag @s[tag=rctmaster,tag=reversecursed] remove reversecursed
tag @s[tag=rctmasterown] remove rctmasterown
tag @s[tag=rctmaster] remove rctmaster
tag @s[tag=gambler] remove gambler
scoreboard players set @s[tag=heavenlyrestriction_mechimaru,scores={EnergyCap=..3999}] EnergyCap 0
scoreboard players remove @s[tag=heavenlyrestriction_mechimaru,scores={EnergyCap=4000..}] EnergyCap 4000
tag @s[tag=heavenlyrestriction_mechimaru] remove heavenlyrestriction_mechimaru
tag @s[tag=undying] remove undying
tag @s[tag=insanity] remove insanity

tag @s[tag=progidy] remove progidy

#exotic
tag @s[tag=heavenlyrestriction_zenin] remove heavenlyrestriction_zenin
tag @s[tag=heavenlyrestriction_fushiguro] remove heavenlyrestriction_fushiguro
tag @s[tag=120percent] remove 120percent
execute if entity @s[tag=delusional_trait,tag=delusional] run function remove_delusional
execute if entity @s[tag=delusional_trait,scores={move=3..}] run function cancel_attack
clear @s[tag=delusional_trait,hasitem={item=ds:delusional}] ds:delusional
tag @s[tag=delusional_trait] remove delusional_trait

#honored
tag @s[tag=sixeyes] remove sixeyes