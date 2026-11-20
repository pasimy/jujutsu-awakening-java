execute as @e[type=ds:inumaki,c=16] unless entity @s[scores={Energy=0..}] unless entity @s[scores={chance=0..}] run scoreboard players random @s chance 101 110
execute as @e[scores={chance=101..102},hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0},type=ds:inumaki,c=16] unless entity @s[scores={Energy=0..}] run replaceitem entity @s slot.weapon.mainhand 1 ds:megaphone
execute as @e[scores={chance=101..110},type=ds:inumaki,c=16] unless entity @s[scores={Energy=0..}] run scoreboard players set @s chance 0
execute as @e[type=ds:inumaki,c=16] unless entity @s[scores={Energy=0..}] run scoreboard players add @s Energy 0
execute as @e[type=ds:inumaki,c=16] unless entity @s[scores={guilty_score=1..}] run scoreboard players set @s[scores={Energy=0}] guilty_score 1
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] chance 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] flashstep 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] hitCD 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Hit 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Stun 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] knockdown 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Flourish 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] cutscene 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] move 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Move 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Camera 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] Disabled 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] endurance 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] speech 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] DashCD_mob 0
scoreboard players add @e[scores={Energy=0},type=ds:inumaki,c=16] ability1 0
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] agility 25
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] damageadd 4
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] punch 1
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] strength 20
tag @e[scores={Energy=0},type=ds:inumaki,c=16,tag=!yujis_friend] add yujis_friend
tag @e[scores={Energy=0},type=ds:inumaki,c=16,tag=!havingcts] add havingcts
tag @e[scores={Energy=0},type=ds:inumaki,c=16,tag=!cursed_speech] add cursed_speech
tag @e[scores={Energy=0},type=ds:inumaki,c=16,tag=!basic_behavior] add basic_behavior
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] EnergyCap 2500
scoreboard players set @e[scores={Energy=0},type=ds:inumaki,c=16] Energy 2500

execute unless entity @a[tag=cursed_speech,c=1] run function speech/cursed_speech



tag @e[scores={ability1=0},tag=ability1CD,type=ds:inumaki,c=16] remove ability1CD
tag @e[scores={ability1=30..,Disabled=0},tag=!ability1CD,type=ds:inumaki,c=16] add ability1CD

execute as @e[scores={Hit=1..2,cutscene=0,Stun=0..20,flashstep=0,move=0,Move=0,knockdown=0,Flourish=0,DashCD_mob=0},type=ds:inumaki,c=16] at @s run function _hitdodge



tag @e[tag=hit,type=ds:inumaki,c=16] remove hit



#------------
scoreboard players set @e[scores={chance=3,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 15
execute as @e[scores={chance=3,move=1..},type=ds:inumaki,c=16] at @s run function fighting/basic/strong_punch

scoreboard players set @e[scores={chance=4,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 15
execute as @e[scores={chance=4,move=1..},type=ds:inumaki,c=16] at @s run function fighting/basic/rush

#dontmove
scoreboard players set @e[scores={chance=5,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 30
execute as @e[scores={chance=5,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab1

#break
scoreboard players set @e[scores={chance=6,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 35
execute as @e[scores={chance=6,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab6

#blastaway
scoreboard players set @e[scores={chance=7,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 40
execute as @e[scores={chance=7,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab7

#getcrushed
scoreboard players set @e[scores={chance=8,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 35
execute as @e[scores={chance=8,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab8

#plummet
scoreboard players set @e[scores={chance=9,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 50
execute as @e[scores={chance=9,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab9

#runaway
scoreboard players set @e[scores={chance=10,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 30
execute as @e[scores={chance=10,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab2

#return
scoreboard players set @e[scores={chance=99,Stun=0,move=1..},type=ds:inumaki,c=16] Disabled 30
execute as @e[scores={chance=99,move=1..},type=ds:inumaki,c=16] at @s run function speech/ab3



tag @e[scores={speech=101..,Disabled=16..21,cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=!MG,type=ds:inumaki,c=16] add MG
replaceitem entity @e[scores={speech=101..,Disabled=16..21,cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0},hasitem={item=ds:cough_syrup,location=slot.weapon.mainhand,quantity=0},type=ds:inumaki,c=16] slot.weapon.mainhand 1 ds:cough_syrup
execute as @e[scores={speech=1..,Disabled=0..15,cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0},hasitem={item=ds:cough_syrup,location=slot.weapon.mainhand},type=ds:inumaki,c=16] at @s run function cough_syrup
execute as @e[scores={cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0},hasitem={item=ds:cough_syrup,location=slot.weapon.mainhand,quantity=0},tag=MG,type=ds:inumaki,c=16] run replaceitem entity @s[hasitem={item=ds:megaphone,location=slot.weapon.mainhand,quantity=0}] slot.weapon.mainhand 1 ds:megaphone
tag @e[scores={cutscene=0,Hit=0,flashstep=0,Stun=0,move=0,hitCD=0},hasitem={item=ds:megaphone,location=slot.weapon.mainhand},tag=MG,type=ds:inumaki,c=16] remove MG



scoreboard players set @e[scores={move=1..2,endurance=1..},type=ds:inumaki,c=16] endurance 0
scoreboard players set @e[scores={move=1..2,chance=1..},type=ds:inumaki,c=16] chance 0
tag @e[tag=hasTRG,type=ds:inumaki,c=16] remove hasTRG
