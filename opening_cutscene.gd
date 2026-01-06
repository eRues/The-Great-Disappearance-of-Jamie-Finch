extends Node2D

func _ready() -> void:
	$text_box.start()

func _on_temp_battle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://battle_scene.tscn")


func _on_text_box_dialogue_finished() -> void:
	get_tree().change_scene_to_file("res://1st_floor_hallway.tscn")
