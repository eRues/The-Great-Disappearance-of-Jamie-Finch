extends CharacterBody2D


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.has_method("player"):
		print("stepped on")
