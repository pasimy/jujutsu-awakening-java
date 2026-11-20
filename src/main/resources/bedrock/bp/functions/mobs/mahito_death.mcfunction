scoreboard players set @s Stun 5
tp @s ~~~
scoreboard players add @a[scores={combat=1..},r=50,m=!spectator] expadd 1000

execute unless score mobeventstoggle Mode = three Mode as @p[r=50] run structure load mahitos ~~~

function missions/credit/killcredit_special_grade_curse


execute as @s[tag=instant_body] at @s run function idle_transfig/end_transformation
damage @s 2 suicide
execute as @s[tag=domainactive] run function domain_end
