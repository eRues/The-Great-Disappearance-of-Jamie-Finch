extends Node2D


func _on_temp_battle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://battle_scene.tscn")
