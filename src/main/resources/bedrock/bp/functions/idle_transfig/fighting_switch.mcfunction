scoreboard players set @s[hasitem={item=ds:idle_transfig_combat1,location=slot.weapon.mainhand}] chance 1
scoreboard players set @s[hasitem={item=ds:idle_transfig_combat2,location=slot.weapon.mainhand}] chance 2
scoreboard players set @s[hasitem={item=ds:idle_transfig_combat3,location=slot.weapon.mainhand}] chance 3

clear  @s[hasitem={item=ds:idle_transfig_combat1}] ds:idle_transfig_combat1
clear  @s[hasitem={item=ds:idle_transfig_combat2}] ds:idle_transfig_combat2
clear  @s[hasitem={item=ds:idle_transfig_combat3}] ds:idle_transfig_combat3

give @s[scores={chance=1}] ds:idle_transfig_combat2 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}

give @s[scores={chance=2}] ds:idle_transfig_combat3 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}

give @s[scores={chance=3}] ds:idle_transfig_combat1 1 0 {"minecraft:keep_on_death":{},"minecraft:item_lock":{"mode":"lock_in_inventory"}}


scoreboard players set @s chance 0





