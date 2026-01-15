extends Node

var inventory = []
var player_node: Node = null

signal inventory_updated
@onready var inventory_slot_scene = preload("res://inventory_slot.tscn")

func _ready() -> void:
	inventory.resize(15)

func add_item(item):
	for i in range(inventory.size()):
		if(inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]):
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			return true
		elif(inventory[i] == null):
			inventory[i] = item
			inventory_updated.emit()
			return true
		else:
			return false

func remove_item():
	inventory_updated.emit()

func set_player_reference(player):
	player_node = player
