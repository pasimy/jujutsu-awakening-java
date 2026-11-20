particle ds:blood_explode
playsound random.explode @a ~~~ 644 0.5 644
playsound mob.wither.break @a ~~~ 644 0.45 644
camerashake add @a[r=40] 4 0.25
particle ds:heavy_impact1 ~~1~
particle ds:heavy_impact2 ~~1~
particle ds:heavy_impact3 ~~1~
particle ds:rubble3 ~~~
particle ds:dirt3 ~~1~
particle ds:ground_slam2 ~~1~
particle ds:ground_slam3 ~~1~
summon ds:pressure ~~1~
damage @s 100 override entity @e[scores={move=26},rm=0.15,r=5,c=1]
tag @s[tag=!pressure] add pressure