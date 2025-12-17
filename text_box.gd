extends Control
signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false

func start():
	$NinePatchRect.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func load_dialogue():
	if(Global.ash_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/ash_opening.json", FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	elif(Global.tia_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/tia_opening.json", FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	
func _input(event):
	if event.is_action_pressed("space"):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")

	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]['text']
