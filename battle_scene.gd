extends Node2D
var enemy

func _ready() -> void:
	enemy = Battle_Enemy.new("rabbit_dee")

func _on_run_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_skill_button_pressed() -> void:
	Global.battle_type.use_skill(enemy)

func _on_inventory_button_pressed() -> void:
	Global.battle_type.check_inventory()
