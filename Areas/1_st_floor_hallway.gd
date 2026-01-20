extends Node2D

func _ready() -> void:
	Global.target_scene = "1st_floor_hallway"

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.has_method("player"):
		Global.target_scene = "basement"
		$scene_transition.fade_in()
		get_tree().call_deferred("change_scene_to_file", "res://Areas/" + Global.target_scene + ".tscn")


func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body.has_method("player"):
		$scene_transition.fade_out()


func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	if _body.has_method("player"):
		Global.target_scene = "courtyard"
		$scene_transition.fade_in()
		get_tree().call_deferred("change_scene_to_file", "res://Areas/" + Global.target_scene + ".tscn")
