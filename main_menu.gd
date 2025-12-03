extends Node2D



func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://character_select.tscn")

func _on_load_button_pressed() -> void:
	get_tree().change_scene_to_file("res://load.tscn")

func _on_options_button_pressed() -> void:
	pass

func _on_quit_button_pressed() -> void:
	get_tree().quit()
