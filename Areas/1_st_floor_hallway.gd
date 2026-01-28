extends Node2D

@onready var textbox_1 = $walkin_text_box
@onready var textbox_2 = $debris_text
@onready var int_label = $debris/interact_label

var can_interact = false
var in_chat = false

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	textbox_1.start()
	Global.walkin = false

func _process(_delta) -> void:
	if(can_interact && Input.is_action_just_pressed("enter") && !in_chat):
		print(textbox_2.global_position)
		textbox_2.start()
		can_interact = false
	else:
		pass
	

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _on_debris_body_entered(_body: Node2D) -> void:
	Global.debris_interact = true
	int_label.visible = true
	can_interact = true

func _on_debris_body_exited(_body: Node2D) -> void:
	int_label.visible = false
	Global.debris_interact = false
	can_interact = false
