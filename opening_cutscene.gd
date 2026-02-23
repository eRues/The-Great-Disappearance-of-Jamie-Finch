extends Node2D

func _ready() -> void:
	$text_box.start()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("space")):
		$Label.visible = false
		$KeySpace.visible = false

func _on_temp_battle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://battle_scene.tscn")

func _on_text_box_dialogue_finished() -> void:
	Global.walkin = true
	get_tree().change_scene_to_file("res://Areas/1st_floor_hallway.tscn")
