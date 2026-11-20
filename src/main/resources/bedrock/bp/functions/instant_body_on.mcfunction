replaceitem entity @e[tag=idle_transfig,c=1] slot.armor.feet 1 air
replaceitem entity @e[tag=idle_transfig,c=1] slot.armor.legs 1 ds:instant_armour 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @e[tag=idle_transfig,c=1] slot.armor.chest 1 air
replaceitem entity @e[tag=idle_transfig,c=1] slot.armor.head 1 air
event entity @e[tag=idle_transfig,c=1] custom_body_off
event entity @e[tag=idle_transfig,c=1] mahito_on
event entity @e[tag=idle_transfig,c=1] mahito_fit_off
event entity @e[tag=idle_transfig,c=1] instant_body_on