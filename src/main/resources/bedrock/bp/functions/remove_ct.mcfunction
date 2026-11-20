event entity @p volcano_headtextureoff
event entity @p miracle_off
event entity @p custom_body_off
event entity @p mahito_off
event entity @p mahito_metal_off
execute as @p run event entity @s[tag=idle_transfig] heart_off
execute as @p at @s[tag=instant_body] run function idle_transfig/end_transformation

execute as @p run scoreboard players set @s[scores={blackflash_amount_special=!0}] blackflash_amount_special 0
execute as @p run scoreboard players set @s[scores={prev_health=!0}] prev_health 0
execute as @p run scoreboard players set @s[scores={damage_taken=!0}] damage_taken 0
execute as @p run scoreboard players set @s[tag=heavenlyrestriction,scores={energystat=!0}] energystat 0
execute as @p run scoreboard players set @s[tag=heavenlyrestriction,scores={EnergyStat=!0}] EnergyStat 0
execute as @p run scoreboard players set @s[tag=heavenlyrestriction] EnergyCap 100
execute as @p run scoreboard players set @s[scores={amberbeast=4..,Energy=4..},tag=!unselect] Energy 3

tag @p remove limitless
tag @p remove shikigami
tag @p remove lovetrain
tag @p remove lightning
tag @p remove explosive
tag @p remove flames
tag @p remove heavenlyrestriction
tag @p remove judgeman
tag @p remove windup
tag @p remove sight
tag @p remove miracles
tag @p remove yuji_awakened
tag @p remove cursed_speech
tag @p remove painkiller
tag @p remove warden
tag @p remove absorption
tag @p remove apparation
tag @p remove boogie_woogie
tag @p remove idle_transfig

tag @p remove rabbit_tame
tag @p remove toad_tame
tag @p remove dog_tame
tag @p remove nue_tame
tag @p remove serpent_tame
tag @p remove ox_tame
tag @p remove elephant_tame
tag @p remove deer_tame
tag @p remove mahoraga_tame
tag @p remove yuji_itadori_brother
tag @p remove yuji_awakened_brother

title @p title Removed
