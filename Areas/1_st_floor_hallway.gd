extends Node2D

@onready var textbox = $text_box
@onready var int_label = $character_open/interact_label

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	$text_box.start()

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)


func _on_debris_body_entered(_body: Node2D) -> void:
	print("entered")
