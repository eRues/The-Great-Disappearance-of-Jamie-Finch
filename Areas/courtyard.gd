extends Node2D

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	if(Global.from_battle):
		if(Global.enemy_name == "rabbit_dee"):
			$character_open.position.x = 1180
			$character_open.position.y = 478
			Global.dee_defeat = true
			Global.rabbit_count += 1
		elif(Global.enemy_name == "rabbit_dum"):
			$character_open.position.x = 1476
			$character_open.position.y = 300
			Global.dum_defeat = true
			Global.rabbit_count += 1
		elif(Global.enemy_name == "rabbit_dave"):
			$character_open.position.x = 1425
			$character_open.position.y = 708
			Global.dave_defeat = true
			Global.rabbit_count += 1
		elif(Global.enemy_name == "rabbit_dan"):
			$character_open.position.x = 1374
			$character_open.position.y = 908
			Global.dan_defeat = true
			Global.rabbit_count += 1
		elif(Global.enemy_name == "rabbit_bart"):
			$character_open.position.x = 407
			$character_open.position.y = 902
			Global.bart_defeat = true
			Global.rabbit_count += 1
		
		if(Global.dee_defeat):
			$dee.queue_free()
		if(Global.dum_defeat):
			$dum.queue_free()
		if(Global.dave_defeat):
			$dave.queue_free()
		if(Global.dan_defeat):
			$dan.queue_free()
		if(Global.bart_defeat):
			$bart.queue_free()
	
	if(Global.rabbit_count >= 5):
		$keeper.visible = true

func _process(_delta: float) -> void:
	#Global.char_position_x = $character_open.position.x
	#Global.char_position_y = $character_open.position.y
	pass

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

#func _on_tree_1_body_entered(body: Node2D) -> void:
#	if(body.is_in_group("player")):
#		$courtyard_map.tree_layer.modulate.a = 0.5

#func _on_tree_1_body_exited(body: Node2D) -> void:
#	if(body.is_in_group("player")):
#		$courtyard_map.tree_layer.modulate.a = 1

#func _on_tree_2_body_entered(body: Node2D) -> void:
#	if(body.is_in_group("player")):
#		$courtyard_map.tree_layer.modulate.a = 0.5

#func _on_tree_2_body_exited(body: Node2D) -> void:
#	if(body.is_in_group("player")):
#		$courtyard_map.tree_layer.modulate.a = 1
