extends Node2D

func on_area_2d_mouse_entered(body: Area2D, text: RichTextLabel) -> void:
	text.visible = true

func on_area_2d_mouse_exit(body: Area2D, text: RichTextLabel) -> void:
	text.visible = false
