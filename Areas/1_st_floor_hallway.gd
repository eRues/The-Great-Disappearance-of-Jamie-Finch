extends Node2D

@onready var int_label = $debris/interact_label
@onready var current_text = $walkin_text
@onready var player = $character_open

var can_interact = false
var in_chat = false

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	current_text.start()

func _process(_delta) -> void:
	pass
	
	if(Input.is_action_just_pressed("enter") && can_interact):
		if(Global.ash_chosen):
			print("ran")
			current_text.start()

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _on_debris_body_entered(_body: Node2D) -> void:
	Global.debris_interact = true
	int_label.visible = true
	var debris_text = preload("res://text_box.tscn").instantiate()
	current_text = debris_text
	add_child(current_text)
	current_text.unique_name_in_owner = true
	current_text.position.y = 18
	current_text.position.x = 300
	current_text.scale = Vector2(0.3, 0.3)
	print(str(current_text.position))
	can_interact = true

func _on_debris_body_exited(_body: Node2D) -> void:
	int_label.visible = false
	Global.debris_interact = false
	can_interact = false

func _on_walkin_text_dialogue_finished() -> void:
	Global.walkin = false
	%walkin_text.queue_free()
	
