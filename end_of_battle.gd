extends Node2D

func _ready() -> void:
	self.visible = false


func _on_exit_button_pressed() -> void:
	if(Global.enemy_name == "keeper"):
		get_tree().change_scene_to_file("res://Areas/demo_end.tscn")
	else:
		Global.from_battle = true
		get_tree().change_scene_to_file(Global.battle_target)
