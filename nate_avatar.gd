extends Node2D
@onready var text = get_node("PlayerText") 

func _on_nate_button_pressed() -> void:
	Global.nate_chosen = true
	print("Nathan is chosen!")
	Global.battle_type = Battle_Nate.new()
	InventoryAutoload.set_player_reference(Global.battle_type)
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_nate_button_mouse_entered() -> void:
	$NathanAvatar.visible = true
	$PlayerText.visible = true
	$NathanLight.visible = true
	$name_label.visible = true
	$ColorRect.visible = false

func _on_nate_button_mouse_exited() -> void:
	$NathanAvatar.visible = false
	$PlayerText.visible = false
	$NathanLight.visible = false
	$name_label.visible = false
	$ColorRect.visible = true
