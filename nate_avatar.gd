extends Node2D
@onready var text = get_node("PlayerText") 

func _on_nate_button_pressed() -> void:
	Global.nate_chosen = true
	print("Nathan is chosen!")
	Global.battle_type = Battle_Nate.new()
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_nate_button_mouse_entered() -> void:
	text.visible = true

func _on_nate_button_mouse_exited() -> void:
	text.visible = false
