execute at @s run particle ds:impact_vfx1 ~~1~
execute at @s run particle ds:impact_vfx2 ~~1~

execute at @s run particle ds:large_impact1 ~~1~

execute at @s run particle ds:ground_slam1 ~~1~

execute at @s run playsound mob.shock1 @a[r=100] ~~~ 99999 1.5 99999
execute at @s run camerashake add @a[r=50] 2 0.15
scoreboard players random @s[tag=styleswap_brother,r=1,c=1,tag=!heavenlyrestriction] blackflashchance 1 200
scoreboard players set @s[tag=styleswap_brother,r=1,c=1,tag=blackflashrig,tag=!heavenlyrestriction] blackflashchance 7
scoreboard players operation @s damage += @e[tag=styleswap_brother,r=1,c=1] damageadd
damage @s 20 override entity @e[tag=styleswap_brother,r=1,c=1]
scoreboard players add @s Flourish 7
scoreboard players add @s Hit 4
scoreboard players add @s Evade 10
scoreboard players add @s Stun 30
scoreboard players set @e[tag=styleswap_todo,r=100,c=1] move 3
camera @s[type=player] clear