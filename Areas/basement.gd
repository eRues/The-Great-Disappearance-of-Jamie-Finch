extends Node2D

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	$character_open.position.x = 41
	$character_open.position.y = 209

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _on_temp_fight_pressed() -> void:
	Global.is_boss = true
	Global.enemy_name = "phleg_intro"
	Global.dont_run = true
	get_tree().change_scene_to_file("res://battle_scene.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
