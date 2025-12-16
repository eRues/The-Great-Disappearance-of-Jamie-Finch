extends Node2D
@onready var selected = get_node("Selected")
@onready var not_selected = get_node("NotSelected")
var slot_selected = false
var pressed = false

func _ready() -> void:
	pass

func _process(_delta) -> void:
	if(pressed):
		slot_selected = true
	
	if(slot_selected):
		selected.visible = true
		not_selected.visible = false
	else:
		selected.visible = false
		not_selected.visible = true

func _on_select_pressed() -> void:
	if(slot_selected):
		selected.visible = false
		not_selected.visible = true
		pressed = false
	else:
		selected.visible = true
		not_selected.visible = false
		slot_selected = true
		pressed = true

func _on_select_mouse_entered() -> void:
	slot_selected = true

func _on_select_mouse_exited() -> void:
	if(pressed):
		pass
	else:
		slot_selected = false
