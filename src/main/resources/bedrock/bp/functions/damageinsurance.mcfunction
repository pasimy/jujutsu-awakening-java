execute unless entity @s[scores={divergent=3..}] unless entity @s[scores={bluefist=3..}] run scoreboard players operation @s damageinsurance = @s damageadd
execute unless score @s damageadd = @s damageinsurance run scoreboard players operation @s damageadd = @s damageinsurance
scoreboard players operation @s damageadd /= three Mode

execute unless entity @s[scores={divergent=3..}] unless entity @s[scores={bluefist=3..}] run scoreboard players operation @s strengthinsurance = @s strength
execute unless score @s strength = @s strengthinsurance run scoreboard players operation @s strength = @s strengthinsurance
scoreboard players operation @s strength /= two Mode

tag @s[scores={strength=0..16,punch=1..},tag=!punch0] add punch0
scoreboard players set @s[scores={strength=0..16,punch=1..}] punch 0