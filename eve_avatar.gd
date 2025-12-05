extends Node2D
@onready var text = get_node("PlayerText") 

func _on_eve_button_pressed() -> void:
	Global.eve_chosen = true
	print("Eve is chosen!")
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_eve_button_mouse_entered() -> void:
	text.visible = true

func _on_eve_button_mouse_exited() -> void:
	text.visible = false
