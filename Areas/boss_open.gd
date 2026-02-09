extends Node2D
@export var enemy_name = ""
@export var enemy_texture: Texture 
var in_range = false

func _ready() -> void:
	$Sprite2D.texture = enemy_texture

func _input(event: InputEvent) -> void:
	if(in_range):
		if(event.is_action_pressed("enter")):
			get_tree().change_scene_to_file("res://battle_scene.tscn")
			Global.battle_target = "res://Areas/courtyard.tscn"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		$interact_label.visible = true
		Global.enemy_name = enemy_name
		Global.is_boss = true
		in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player")):
		$interact_label.visible = false
		in_range = false
