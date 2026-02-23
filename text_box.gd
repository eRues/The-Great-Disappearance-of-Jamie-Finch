extends Control
signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var finished = false

func _ready():
	self.visible = false
	if(Global.walkin):
		self.position.x = -37

func start():
	finished = false
	if(Global.basement_stairs):
		if(self.global_position.x >= 1425):
			self.global_position.x = 1487
	if(!finished):
		self.visible = true
		Global.in_chat = true
		dialogue = load_dialogue()
		current_dialogue_id = -1
		next_script()
	else:
		pass

func load_dialogue():
	if(Global.ash_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/Opening Scenes/ash_opening.json", FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	elif(Global.tia_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/Opening Scenes/tia_opening.json", FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	elif(Global.eve_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/Opening Scenes/eve_opening.json" , FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	elif(Global.nate_chosen && get_tree().current_scene.scene_file_path == "res://opening_cutscene.tscn"):
		var file = FileAccess.open("res://TextFiles/Opening Scenes/nathan_opening.json" , FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	elif(Global.walkin):
		if(Global.ash_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Walking In/ash_tutorial_walkin.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			Global.walkin = false
			return content
		elif(Global.tia_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Walking In/tia_tutorial_walkin.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			Global.walkin = false
			return content
		elif(Global.eve_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Walking In/eve_tutorial_walkin.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			Global.walkin = false
			return content
		elif(Global.nate_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Walking In/nate_tutorial_walkin.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			Global.walkin = false
			return content
	elif(Global.debris_interact):
		if(Global.ash_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Interaction/ash_tutorial_objint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.tia_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Interaction/tia_tutorial_objint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.eve_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Interaction/eve_tutorial_objint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.nate_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Interaction/nate_tutorial_objint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
	elif(Global.granola_interact):
		if(Global.ash_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Pickup/ash_tutorial_objpick.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.tia_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Pickup/tia_tutorial_objpick.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.eve_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Pickup/eve_tutorial_objpick.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.nate_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Object Pickup/nate_tutorial_objpick.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
	elif(Global.basement_stairs):
		if(Global.ash_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Door Interact/ash_tutorial_doorint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.tia_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Door Interact/tia_tutorial_doorint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.eve_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Door Interact/eve_tutorial_doorint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content
		elif(Global.nate_chosen):
			var file = FileAccess.open("res://TextFiles/Tutorial/Door Interact/nate_tutorial_doorint.json" , FileAccess.READ)
			var content = JSON.parse_string(file.get_as_text())
			return content

func _input(event):
	if(event.is_action_pressed("space") && self.visible):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		self.visible = false
		emit_signal("dialogue_finished")
		Global.in_chat = false
		self.position.x = -175
		finished = true
		return
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]['text']
