extends Node2D



func _on_eve_button_pressed() -> void:
	Global.eve_chosen = true
	print("Eve is chosen!")
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_nate_button_pressed() -> void:
	Global.nate_chosen = true
	print("Nathan is chosen!")
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")
