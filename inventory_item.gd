extends Node2D

@export var item_type = ""
@export var item_name = ""
@export var item_desc = ""
@export var item_texture: Texture
@export var item_effects = ""
var scene_path: String = "res://inventory_item.tscn"

@onready var icon_sprite = $Sprite2D

func _ready() -> void:
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture

func _process(_delta) -> void:
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture
