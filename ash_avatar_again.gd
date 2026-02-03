extends Node2D
@onready var text = get_node("PlayerText") 

func _on_ash_button_pressed() -> void:
	Global.ash_chosen = true
	print("Ashton is chosen!")
	Global.battle_type = Battle_Ash.new()
	InventoryAutoload.set_player_reference(Global.battle_type)
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_ash_button_mouse_entered() -> void:
	text.visible = true

func _on_ash_button_mouse_exited() -> void:
	text.visible = false
