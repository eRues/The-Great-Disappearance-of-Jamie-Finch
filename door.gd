extends Area2D

class_name Door

@export var destination_scene_tag: String
@export var destination_door_tag: String
@export var spawn_direction = "up"

@onready var spawn = $Spawn

func _on_body_entered(body: Node2D) -> void:
		if body.is_in_group("player"):
			Global.from_battle = false
			NavigationManager.go_to_level(destination_scene_tag, destination_door_tag)
