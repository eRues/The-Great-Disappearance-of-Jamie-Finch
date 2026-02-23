extends Node2D

@onready var int_label = $debris/interact_label
@onready var player = $character_open

var in_chat = false

func _ready() -> void:
	if(!Global.tutorial_finished):
		NavigationManager.spawn_door_tag = null
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	if(Global.walkin):
		player.char_text.start()
	
	player.position.x = Global.char_position_x
	player.position.y = Global.char_position_y
	
	if(Global.tutorial_finished): 
		$tutorial_interact.queue_free()
		$tutorial_block.queue_free()
		$StaticBody2D2.queue_free()
		$basement_enter.queue_free()
		$tutorial_change_scene.queue_free()
		$inventory_item.queue_free()
		$debris.queue_free()
		$rock_texture.visible = true
		$rock_texture/StaticBody2D/CollisionShape2D.disabled = false
		Global.battle_type.health = Global.battle_type.base_health


func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _on_debris_body_entered(_body: Node2D) -> void:
	Global.debris_interact = true
	int_label.visible = true
	Global.can_interact = true

func _on_debris_body_exited(_body: Node2D) -> void:
	int_label.visible = false
	Global.debris_interact = false
	Global.can_interact = false

func _on_text_area_body_entered(_body: Node2D) -> void:
	Global.granola_interact = true
	Global.can_interact = true

func _on_text_area_body_exited(_body: Node2D) -> void:
	Global.granola_interact = false
	Global.can_interact = false

func _on_basement_enter_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Global.basement_stairs = true
		Global.can_interact = true

func _on_basement_enter_body_exited(_body: Node2D) -> void:
	Global.basement_stairs = false
	Global.can_interact = false
