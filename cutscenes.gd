extends Node2D

@onready var anim = $AnimationPlayer

func _ready() -> void:
	anim.play("basement_cutscene_Ash")
