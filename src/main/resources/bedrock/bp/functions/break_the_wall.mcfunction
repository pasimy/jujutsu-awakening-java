execute unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock unless block ~~~ barrier unless block ~~1~ barrier unless block ~~2~ barrier unless block ~~3~ barrier run fill ~3~3~3 ~-3~~-3 air destroy


execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run playsound mob.shock1 @a[r=50] ~~1~ 99999 1.25 99999
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run playsound mob.blood @a[r=50] ~~1~ 99999 0.65 99999
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run playsound mob.blood2 @a[r=50] ~~1~ 99999 0.65 99999
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run camerashake add @a[r=10] 2 0.25
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^-1^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^1^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^-3^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^3^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^-5^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:transfigure_death ^5^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:blood_explode_rain ^^^
execute if block ~~~ barrier as @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] at @s run particle ds:burst_impact ~~1~
execute if block ~~~ barrier if entity @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock run fill ~3~3~3 ~-3~~-3 air replace barrier
execute if block ~~~ barrier if entity @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock run fill ~3~3~3 ~-3~~-3 air destroy
execute if block ~~~ barrier run scoreboard players set @e[scores={move=3..},tag=wall_landed,type=ds:transfigured_human_proj,r=20] move 2


execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run playsound mob.shock1 @a[r=50] ~~1~ 99999 1.25 99999
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run playsound mob.blood @a[r=50] ~~1~ 99999 0.65 99999
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run playsound mob.blood2 @a[r=50] ~~1~ 99999 0.65 99999
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run camerashake add @a[r=10] 2 0.25
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run particle ds:transfigure_death ~~1~
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run particle ds:transfigure_death ~~1~
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run particle ds:blood_explode_rain ~~1~
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] run particle ds:burst_impact ~~1~
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock run fill ~3~3~3 ~-3~~-3 air replace barrier
execute if block ~~~ barrier if entity @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] unless block ~~~ bedrock unless block ~~1~ bedrock unless block ~~2~ bedrock unless block ~~3~ bedrock run fill ~3~3~3 ~-3~~-3 air destroy
execute if block ~~~ barrier run scoreboard players set @e[scores={move=3..130},type=ds:transfigured_human_proj,tag=transfigure_cube,r=6] move 2

scoreboard players remove @s[scores={Deleter=1..}] Deleter 1
execute if entity @s[scores={Deleter=1..}] positioned ^^^1 run function break_the_wall
tp @s[scores={Deleter=0}] ~~-200~