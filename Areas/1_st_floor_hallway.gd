extends Node2D

@onready var int_label = $debris/interact_label
@onready var current_text = $walkin_text
@onready var player = $character_open

var can_interact = false
var in_chat = false

func _ready() -> void:
	if(!Global.tutorial_finished):
		NavigationManager.spawn_door_tag = null
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	player.position.x = Global.char_position_x
	player.position.y = Global.char_position_y
	if(!Global.tutorial_finished):
		current_text.start()
	else: 
		$walk_in.queue_free()
		$tutorial_interact.queue_free()
		$tutorial_block.queue_free()
		%granola_text.queue_free()
		$StaticBody2D2.queue_free()
		$basement_enter.queue_free()
		$tutorial_change_scene.queue_free()
		$basement_walkin.queue_free()
		$inventory_item.queue_free()
		$debris.queue_free()
		$rock_texture.visible = true
		Global.battle_type.health = Global.battle_type.base_health

func _process(_delta) -> void:
	pass
	
	if(Input.is_action_just_pressed("enter") && can_interact):
		current_text.start()

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _on_debris_body_entered(_body: Node2D) -> void:
	Global.debris_interact = true
	int_label.visible = true
	var debris_text = preload("res://text_box.tscn").instantiate()
	debris_text.unique_name_in_owner = true
	debris_text.name = "debris_text"
	current_text = debris_text
	add_child(current_text)
	current_text.position.y = 29
	current_text.position.x = 300
	current_text.scale = Vector2(0.3, 0.3)
	can_interact = true

func _on_debris_body_exited(_body: Node2D) -> void:
	int_label.visible = false
	Global.debris_interact = false
	can_interact = false

func _on_walkin_text_dialogue_finished() -> void:
	Global.walkin = false
	%walkin_text.queue_free()

func _on_text_area_body_entered(_body: Node2D) -> void:
	Global.granola_interact = true
	can_interact = true
	current_text = %granola_text

func _on_text_area_body_exited(_body: Node2D) -> void:
	Global.granola_interact = false
	can_interact = false

func _on_granola_text_dialogue_finished() -> void:
	%granola_text.queue_free()

func _on_basement_enter_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Global.basement_stairs = true
		current_text = $basement_walkin
		can_interact = true

func _on_basement_walkin_dialogue_finished() -> void:
	$confirm_area.visible = true

func _on_yes_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Areas/basement.tscn")

func _on_no_button_pressed() -> void:
	$confirm_area.visible = false

func _on_basement_enter_body_exited(_body: Node2D) -> void:
	Global.basement_stairs = false
