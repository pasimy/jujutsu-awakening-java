scoreboard players set @s Stun 5
camera @a[r=20] fade time 0 1.5 1 color 255 255 255
summon ds:student_gojo2
scoreboard players operation @e[type=ds:student_gojo2,r=1,c=1] blackflashlearn = @s[scores={blackflashlearn=1..}] blackflashlearn
scoreboard players operation @e[type=ds:student_gojo2,r=1,c=1] rctuses = @s[scores={rctuses=1..}] rctuses
scoreboard players operation @e[type=ds:student_gojo2,r=1,c=1] guilty_score = @s[scores={guilty_score=0..}] guilty_score
execute if entity @e[tag=target,tag=!unselect,r=100,c=1] run effect @e[type=ds:student_gojo2,r=1,c=1] instant_health 1 0 true
execute if entity @e[tag=target,tag=!unselect,r=100,c=1] run damage @e[type=ds:student_gojo2,r=1,c=1] 0 suicide entity @e[tag=target,tag=!unselect,r=100,c=1]
execute if entity @e[tag=target,tag=!unselect,r=100,c=1] run effect @e[type=ds:student_gojo2,r=1,c=1] instant_health 0 1 true
effect @e[tag=target,tag=!unselect,r=100,c=1] instant_health 1 0 true
damage @e[tag=target,tag=!unselect,r=100,c=1] 0 suicide entity @e[type=ds:student_gojo2,r=1,c=1]
effect @e[tag=target,tag=!unselect,r=100,c=1] instant_health 0 1 true
tag @e[type=ds:student_gojo2,r=1,c=1,tag=!hidden_inventory_cutscene] add hidden_inventory_cutscene
scoreboard players set @e[type=ds:student_gojo2,r=1,c=1] cutscene 2001
tp @s ~~~
damage @s 2 suicide