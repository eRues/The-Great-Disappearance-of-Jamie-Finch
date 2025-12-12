extends Node2D
var enemy
var defended = false

func _ready() -> void:
	enemy = Battle_Enemy.new("rabbit_dee")

func _on_run_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_skill_button_pressed() -> void:
	Global.battle_type.use_skill(enemy)

func _on_inventory_button_pressed() -> void:
	Global.battle_type.check_inventory()

func _on_defend_button_pressed() -> void:
	Global.battle_type.defend()
	defended = true



func _on_attack_button_pressed() -> void:
	pass # Replace with function body.
