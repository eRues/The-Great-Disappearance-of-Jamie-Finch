extends Node

const scene_1st_floor_hallway = preload("res://Areas/1st_floor_hallway.tscn")
const scene_courtyard = preload("res://Areas/courtyard.tscn")
const scene_basement = preload("res://Areas/basement.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"1st_floor_hallway":
			scene_to_load = scene_1st_floor_hallway
		"courtyard":
			scene_to_load = scene_courtyard
		"basement":
			scene_to_load = scene_basement
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed.call_deferred(scene_to_load)
		
func trigger_player_spawn(postion: Vector2, direction: String):
	on_trigger_player_spawn.emit(postion, direction)
