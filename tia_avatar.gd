extends Node2D

func _on_tia_button_pressed() -> void:
	Global.tia_chosen = true
	print("Tiana is chosen!")
	Global.battle_type = Battle_Tia.new()
	InventoryAutoload.set_player_reference(Global.battle_type)
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_tia_button_mouse_entered() -> void:
	$cover.visible = false
	$TianaAvatar.visible = true
	$PlayerText.visible = true
	$TiaBottle.visible = true
	$name_label.visible = true

func _on_tia_button_mouse_exited() -> void:
	$cover.visible = true
	$TianaAvatar.visible = false
	$PlayerText.visible = false
	$TiaBottle.visible = false
	$name_label.visible = false
	
