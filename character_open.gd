extends Node2D

@onready var interact_ui = $InteractUI
@onready var inventory_ui = $InventoryUI

func _ready() -> void:
	$ash_open.visible = false
	$tia_open.visible = false
	$eve_open.visible = false
	$nathan_open.visible = false
	inventory_ui.visible = false
	interact_ui.visible = false

func _process(_delta):
	if(Global.ash_chosen):
		$ash_open.visible = true
	elif(Global.tia_chosen):
		$tia_open.visible = true
	elif(Global.eve_chosen):
		$eve_open.visible = true
	elif(Global.nate_chosen):
		$nathan_open.visible = true
	
	if(Input.is_action_just_pressed("open") and inventory_ui.visible == false):
		inventory_ui.visible = true
		get_tree().paused = true
	elif(Input.is_action_just_pressed("open")):
		inventory_ui.visible = false
		get_tree().paused = false
		
func player():
	pass
