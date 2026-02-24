extends Node2D


@onready var inventory_ui = $InventoryUI
@onready var ash_cam = $ash_open/ash_cam
@onready var tia_cam = $tia_open/tia_cam
@onready var eve_cam = $eve_open/eve_cam
@onready var nate_cam = $nathan_open/nate_cam
@onready var char_text = $ash_open/ash_text


func _ready() -> void:
	$ash_open.visible = false
	$tia_open.visible = false
	$eve_open.visible = false
	$nathan_open.visible = false
	inventory_ui.visible = false
#	char_text.dialogue_finished.connect(_on_char_text_dialogue_finished())
	
	if(Global.ash_chosen):
		$ash_open.visible = true
		$ash_open/ash_cam.enabled = true
		$tia_open.queue_free()
		$eve_open.queue_free()
		$nathan_open.queue_free()
	elif(Global.tia_chosen):
		$tia_open.visible = true
		$tia_open/tia_cam.enabled = true
		$ash_open.queue_free()
		$eve_open.queue_free()
		$nathan_open.queue_free()
	elif(Global.eve_chosen):
		$eve_open.visible = true
		$eve_open/eve_cam.enabled = true
		$ash_open.queue_free()
		$tia_open.queue_free()
		$nathan_open.queue_free()
	elif(Global.nate_chosen):
		$nathan_open.visible = true
		$nathan_open/nate_cam.enabled = true
		$ash_open.queue_free()
		$tia_open.queue_free()
		$eve_open.queue_free()
	
	if(get_tree().current_scene.name == "1st_floor_hallway"):
		if(Global.ash_chosen):
			ash_cam.limit_bottom = 300
			ash_cam.limit_top = 50
			ash_cam.limit_left = 0
			ash_cam.limit_right = 1825
		elif(Global.tia_chosen):
			tia_cam.limit_bottom = 200
			tia_cam.limit_top = 50
			tia_cam.limit_left = 0
			tia_cam.limit_right = 1825
		elif(Global.eve_chosen):
			eve_cam.limit_bottom = 200
			eve_cam.limit_top = 50
			eve_cam.limit_left = 0
			eve_cam.limit_right = 1825
		elif(Global.nate_chosen):
			nate_cam.limit_bottom = 200
			nate_cam.limit_top = 50
			nate_cam.limit_left = 0
			nate_cam.limit_right = 1825
	elif(get_tree().current_scene.name == "basement"):
		if(Global.ash_chosen):
			ash_cam.limit_bottom = 345
			ash_cam.limit_top = 0
			ash_cam.limit_left = 0
			ash_cam.limit_right = 1150
			ash_cam.zoom = Vector2(2, 2)
		elif(Global.tia_chosen):
			tia_cam.limit_bottom = 345
			tia_cam.limit_top = 0
			tia_cam.limit_left = 0
			tia_cam.limit_right = 1150
			tia_cam.zoom = Vector2(2, 2)
		elif(Global.eve_chosen):
			eve_cam.limit_bottom = 345
			eve_cam.limit_top = 0
			eve_cam.limit_left = 0
			eve_cam.limit_right = 1150
			eve_cam.zoom = Vector2(2, 2)
		elif(Global.nate_chosen):
			nate_cam.limit_bottom = 345
			nate_cam.limit_top = 0
			nate_cam.limit_left = 0
			nate_cam.limit_right = 1150
			nate_cam.zoom = Vector2(2, 2)
	elif(get_tree().current_scene.name == "courtyard"):
		if(Global.ash_chosen):
			ash_cam.limit_bottom = 950
			ash_cam.limit_top = 0
			ash_cam.limit_left = 0
			ash_cam.limit_right = 1600 
			ash_cam.zoom = Vector2(2, 2)
		elif(Global.tia_chosen):
			tia_cam.limit_bottom = 950
			tia_cam.limit_top = 0
			tia_cam.limit_left = 0
			tia_cam.limit_right = 1600 
			tia_cam.zoom = Vector2(2, 2)
		elif(Global.eve_chosen):
			eve_cam.limit_bottom = 950
			eve_cam.limit_top = 0
			eve_cam.limit_left = 0
			eve_cam.limit_right = 1600 
			eve_cam.zoom = Vector2(2, 2)
		elif(Global.nate_chosen):
			nate_cam.limit_bottom = 950
			nate_cam.limit_top = 0
			nate_cam.limit_left = 0
			nate_cam.limit_right = 1600 
			nate_cam.zoom = Vector2(2, 2)

func _process(_delta):
	if(Input.is_action_just_pressed("open") and inventory_ui.visible == false):
		inventory_ui.visible = true
		get_tree().paused = true
	elif(Input.is_action_just_pressed("open")):
		inventory_ui.visible = false
		get_tree().paused = false
	
	if(Input.is_action_just_pressed("enter") && Global.can_interact):
		$ash_open/ash_text.start()

func _on_yes_button_pressed() -> void:
	if(get_tree().current_scene.name == "1st_floor_hallway.tscn"):
		if(Global.basement_stairs):
			get_tree().change_scene_to_file("res://Areas/basement.tscn")

func _on_char_text_dialogue_finished():
	if(Global.basement_stairs):
		$confirm_area.visible = true

func _on_no_button_pressed() -> void:
	self.visible = true
