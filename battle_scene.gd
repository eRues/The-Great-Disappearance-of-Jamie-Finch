extends Node2D
var enemy
var defended = false
var player_turn = true

func _ready() -> void:
	enemy = Battle_Enemy.new("rabbit_dee")

func _process(_delta) -> void:
	if(enemy.health > 0 && player_turn):
		pass
	if(enemy.health > 0 && !player_turn):
		if(enemy.confused):
			print("enemy is confused, cannot attack")
		else:
			Global.battle_type.health -= enemy.attack()
			print("enemy attacked!")
			print("enemy does " + enemy.get_damage() + " damage. You have " + Global.battle_type.health + " health points remaining.")

func _on_run_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_skill_button_pressed() -> void:
	Global.battle_type.use_skill(enemy)
	player_turn = false
	print("you used your skill, the enemy is now confused.")

func _on_inventory_button_pressed() -> void:
	Global.battle_type.check_inventory()
	player_turn = false

func _on_defend_button_pressed() -> void:
	Global.battle_type.defend()
	defended = true
	player_turn = false

func _on_attack_button_pressed() -> void:
	enemy.health -= Global.battle_type.attack()
	player_turn = false
	print("you attacked!")
	print("you do " + Global.battle_type.get_damage() + " damage. Enemy has " + enemy.health + " health points remaining.")
