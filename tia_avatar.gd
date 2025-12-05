extends Node2D
@onready var text = get_node("PlayerText") 

func _on_tia_button_pressed() -> void:
	Global.tia_chosen = true
	print("Tiana is chosen!")
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_tia_button_mouse_entered() -> void:
	text.visible = true

func _on_tia_button_mouse_exited() -> void:
	text.visible = false
