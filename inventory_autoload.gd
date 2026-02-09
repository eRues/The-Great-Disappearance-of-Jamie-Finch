extends Node

var inventory = []
var player_node: Node = null

signal inventory_updated
@onready var inventory_slot_scene = preload("res://inventory_slot.tscn")

func _ready() -> void:
	inventory.resize(15)

func add_item(item):
	print(item["item_name"])
	for i in range(inventory.size()):
		if(inventory[i] != null and inventory[i]["item_type"] == item["item_type"] and inventory[i]["item_effects"] == item["item_effects"]):
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			return true
		elif(inventory[i] == null):
			inventory[i] = item
			inventory_updated.emit()
			return true
	return false

func remove_item(item_type, item_effect):
	for i in range(inventory.size()):
		if(inventory[i] != null and inventory[i]["item_type"] == item_type and inventory[i]["item_effects"] == item_effect):
			inventory[i]["quantity"] -= 1
			if(inventory[i]["quantity"] <= 0):
				inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func set_player_reference(player):
	player_node = player
