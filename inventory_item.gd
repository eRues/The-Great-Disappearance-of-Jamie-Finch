extends Node2D

@export var item_type = ""
@export var item_name = ""
@export var item_desc = ""
@export var item_texture: Texture
@export var item_effects = ""
var scene_path: String = "res://inventory_item.tscn"

@onready var icon_sprite = $Sprite2D

var player_in_range = false

func _ready() -> void:
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture

func _process(_delta) -> void:
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture
	
	if(player_in_range and Input.is_action_pressed("space")):
		item_pickup()

func item_pickup():
	var item = {
		"quantity": 1,
		"item_type": item_type,
		"item_name": item_name,
		"item_desc": item_desc,
		"item_texture": item_texture,
		"item_effects": item_effects,
		"scene_path": scene_path
	}
	
	if(InventoryAutoload.player_node):
		InventoryAutoload.add_item(item)
		self.queue_free()


func _on_area_2d_body_entered(body) -> void:
	if(body.is_in_group("player")):
		player_in_range = true
		body.ui_interact.visible = true

func _on_area_2d_body_exited(body) -> void:
	if(body.is_in_group("player")):
		player_in_range = false
		body.ui_interact.visible = false
