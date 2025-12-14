extends Node2D
var enemy
var defended = false
var player_turn = true
var skill_used = false
var turns_since_skill = 0

func _ready() -> void:
	enemy = Battle_Enemy.new("rabbit_dee")

func _process(_delta) -> void:
	if(skill_used || turns_since_skill >= 1):
		turns_since_skill +=1
		skill_used = false
	
	if(turns_since_skill >= 4):
		Global.battle_type.can_use_skill = true
	
	if(enemy.health > 0 && player_turn):
		pass
	if(enemy.health > 0 && !player_turn):
		if(enemy.confused):
			print("enemy is confused, cannot attack")
			player_turn = true
			enemy.confused = false
		else:
			var damage = enemy.attack(Global.battle_type.get_dodge())
			Global.battle_type.health -= damage
			print("enemy attacked!")
			print("enemy does " + str(damage) + " damage. You have " + str(Global.battle_type.health) + " health points remaining.")
			player_turn = true

func _on_run_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_skill_button_pressed() -> void:
	Global.battle_type.use_skill(enemy)
	player_turn = false
	skill_used = true
	turns_since_skill = 0
	Global.battle_type.can_use_skill = false
	print("you used your skill, the enemy is now confused.")

func _on_inventory_button_pressed() -> void:
	Global.battle_type.check_inventory()
	player_turn = false

func _on_defend_button_pressed() -> void:
	Global.battle_type.defend()
	defended = true
	player_turn = false

func _on_attack_button_pressed() -> void:
	var damage = Global.battle_type.attack(enemy.get_dodge())
	enemy.health -= damage
	player_turn = false
	print("you attacked!")
	print("you do " + str(damage) + " damage. Enemy has " + str(enemy.health) + " health points remaining.")
