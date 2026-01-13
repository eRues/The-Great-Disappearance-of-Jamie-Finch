extends Node2D

@onready var interact_ui = $InteractUI

func _ready() -> void:
	$ash_open.visible = false
	$tia_open.visible = false
	$eve_open.visible = false
	$nathan_open.visible = false

func _process(_delta):
	if(Global.ash_chosen):
		$ash_open.visible = true
	elif(Global.tia_chosen):
		$tia_open.visible = true
	elif(Global.eve_chosen):
		$eve_open.visible = true
	elif(Global.nate_chosen):
		$nathan_open.visible = true
