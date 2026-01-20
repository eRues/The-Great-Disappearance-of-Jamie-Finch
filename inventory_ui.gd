extends Control

@onready var grid_container = $GridContainer

var scene_path: String = "res://inventory_item.tscn"
var special_weapon = {
		"quantity": 1,
		"item_type": "weapon",
		"item_name": "special_weapon",
		"item_desc": "you can fight with this",
		"item_texture": null,
		"item_effects": "+ something",
		"scene_path": scene_path}

func _ready() -> void:
	if(Global.ash_chosen):
		special_weapon = {
		"quantity": 1,
		"item_type": "weapon",
		"item_name": "Ashton’s Splintered Bat",
		"item_desc": "An old wooden bat you haven’t used since before you moved here. It’s almost broken, but there’s still some good swings left in it.",
		"item_texture": load("res://Assets/Weapons/ash_bat.png"),
		"item_effects": "Attack: + 15, Crit: + 5",
		"scene_path": scene_path
		}
	elif(Global.tia_chosen):
		special_weapon = {
		"quantity": 1,
		"item_type": "weapon",
		"item_name": "Tiana’s Hydroholder",
		"item_desc": "Your trusty water bottle! Swinging it around is so fun, but you could probably give someone a concussion if you knocked them on the head with it.",
		"item_texture": load("res://Assets/Weapons/tia_bottle.png"),
		"item_effects": "Attack: + 15, Crit: + 5",
		"scene_path": scene_path
		}
	elif(Global.eve_chosen):
		special_weapon = {
		"quantity": 1,
		"item_type": "weapon",
		"item_name": "Eve’s Pocket Knife",
		"item_desc": "The pocket knife you take with you everywhere. You can do some cool tricks with it.",
		"item_texture": load("res://Assets/Weapons/eve_knife.png"),
		"item_effects": "Attack: + 15, Crit: + 5",
		"scene_path": scene_path
		}
	elif(Global.nate_chosen):
		special_weapon = {
		"quantity": 1,
		"item_type": "weapon",
		"item_name": "Nathan’s Utility Flashlight",
		"item_desc": "A bright beacon that will guide you until the very end! You can hit things with it too, I guess.",
		"item_texture": load("res://Assets/Weapons/nathan_light.png"),
		"item_effects": "Attack: + 15, Crit: + 5",
		"scene_path": scene_path
		}
	
	InventoryAutoload.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()

func _on_inventory_updated():
	clear_grid_container()
	InventoryAutoload.inventory.set(0, special_weapon)
	for item in InventoryAutoload.inventory:
		var slot = InventoryAutoload.inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		if(item != null):
			slot.set_item(item)
		else:
			slot.set_empty()
	InventoryAutoload.inventory.get(0).equipped = true

func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()
