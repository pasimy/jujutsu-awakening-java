particle ds:ground_slam2 ~~-1.5~
tag @s[tag=itemUse:ds:dash] remove itemUse:ds:dash
execute unless entity @s[scores={move=1..}] unless entity @s[scores={Move=1..}] run playanimation @s[tag=!Big,type=!ds:beru_curse] animation.dash_back
execute as @s[tag=delusional] at @s run playanimation @e[type=ds:takada_chan,c=1] animation.dash_back
playanimation @s[tag=Big,type=!ds:beru_curse] animation.dash_back_tall
playanimation @s[type=ds:beru_curse] animation.dash_back_tall
scoreboard players set @s Frames 9
scoreboard players set @s[type=player] DashCD 20
scoreboard players set @s[scores={agility=50..},type=player] DashCD 10
playsound mob.enderdragon.flap @a[r=50] ~~~ 0.25 0.5 
camerashake add @s[type=player] 0.065 0.17 rotational
scriptevent ds:knockback -7

execute if entity @s[type=!player] unless entity @s[scores={strength=50..}] unless entity @s[scores={strength=40..},family=special_grade] unless entity @s[scores={agility=50..}] unless entity @s[scores={agility=40..},family=special_grade] run scoreboard players set @s DashCD_mob 50
execute if entity @s[type=!player] unless score @s agility < @s strength run scoreboard players operation @s[scores={strength=1..49},family=!special_grade] DashCD_mob -= @s strength
execute if entity @s[type=!player] unless score @s agility < @s strength run scoreboard players operation @s[scores={strength=1..39},family=special_grade] DashCD_mob -= @s strength
execute if entity @s[type=!player] if score @s agility < @s strength run scoreboard players operation @s[scores={agility=1..49},family=!special_grade] DashCD_mob -= @s agility
execute if entity @s[type=!player] if score @s agility < @s strength run scoreboard players operation @s[scores={agility=1..39},family=special_grade] DashCD_mob -= @s agility