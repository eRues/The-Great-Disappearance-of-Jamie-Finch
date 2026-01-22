extends Node2D

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
		
func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var _door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(_door.spawn.global_position, _door.spawn_direction)
