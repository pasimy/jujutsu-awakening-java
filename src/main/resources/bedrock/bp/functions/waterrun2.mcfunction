camerashake add @a[r=10] 0.3 0.08
execute if entity @s[type=player] run playanimation @s animation.waterrun
execute if entity @s[type=!player,tag=hasTRG,tag=!stoprun] unless entity @s[scores={move=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={move=0,cutscene=0,atk=1..2}] unless entity @s[hasitem={item=ds:glock,location=slot.weapon.mainhand},scores={move=0,cutscene=0,Disabled=4..5},family=toji,tag=toji_function] run playanimation @s animation.waterrun
particle ds:waterrun1 ~~0.3~

particle ds:waterrun2 ~~0.3~

particle ds:waterrun3 ~~0.3~

particle ds:waterrun4 ~~0.1~
playsound random.splash @a ~~~ 0.1 2
scriptevent ds:upslightly2
execute if entity @s[type=player] run scriptevent ds:knockback 3.3
execute if entity @s[type=!player,tag=hasTRG,rx=70,rxm=-70,tag=!stoprun] unless entity @s[scores={move=1..}] unless entity @s[scores={flashstep=1..}] unless entity @s[scores={BasicM1=1..}] unless entity @s[scores={move=0,cutscene=0,atk=1..2}] unless entity @s[hasitem={item=ds:glock,location=slot.weapon.mainhand},scores={move=0,cutscene=0,Disabled=4..5},family=toji,tag=toji_function] run scriptevent ds:knockback 3.3