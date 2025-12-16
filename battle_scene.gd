extends Node2D
var enemy
var defended = false
var player_turn = true
var skill_used = false
var turns_since_skill = 5
var defeated = false
var exp_added = false
var damage_done = 0
@onready var sprite = get_node("placeholder_sprite")
@onready var text = get_node("end_battle")

func _ready() -> void:
	enemy = Battle_Enemy.new("rabbit_dee")
	exp_added = false
	damage_done = 0

func _process(_delta) -> void:
	if(defeated):
		pass
	else:
		if(enemy.health > 0 && player_turn):
			pass
		if(enemy.health > 0 && !player_turn):
			if(enemy.confused):
				print("enemy is confused, cannot attack")
				player_turn = true
			else:
				var damage = enemy.attack(Global.battle_type.get_dodge())
				damage_done += damage
				Global.battle_type.health -= damage
				print("enemy attacked!")
				print("enemy does " + str(damage) + " damage. You have " + str(Global.battle_type.health) + " health points remaining.")
				player_turn = true
			if(turns_since_skill == 1):
					enemy.confused = false
		if(enemy.health <= 0):
			defeated = true
			if(!exp_added):
				Global.battle_type.add_exp(enemy.experience)
				print(str(Global.battle_type.experience))
				exp_added = false
				print("exp_added")
			else:
				pass
			if((int)(Global.battle_type.experience / Global.battle_type.exp_to_next_level) >= 1):
				Global.battle_type.add_level()
			sprite.visible = false
			text.visible = true
			if(enemy.is_boss == false):
				Global.base_agitation += 0.5
			else:
				Global.base_agitation = 1
			print(str(Global.base_agitation))

func _on_run_button_pressed() -> void:
	if(defeated):
		pass
	else:
		get_tree().change_scene_to_file("res://opening_cutscene.tscn")

func _on_skill_button_pressed() -> void:
	if(defeated):
		pass
	else:
		if(turns_since_skill >= 4):
			Global.battle_type.can_use_skill = true
			Global.battle_type.use_skill(enemy)
			turns_since_skill = 0
			print("you used your skill, the enemy is now confused.")
			skill_used = true
		elif(turns_since_skill >= 0 && turns_since_skill <=4):
			Global.battle_type.use_skill(enemy)
		else:
			Global.battle_type.use_skill(enemy)
			player_turn = false
			Global.battle_type.can_use_skill = false

func _on_inventory_button_pressed() -> void:
	if(defeated):
		pass
	else:
		Global.battle_type.check_inventory()

func _on_defend_button_pressed() -> void:
	if(defeated):
		pass
	else:
		Global.battle_type.defend()
		if(skill_used && Global.tia_chosen):
			Global.battle_type.speed -= 5
			Global.battle_type.strength -= 5
			skill_used = false
		elif(skill_used && Global.eve_chosen):
			Global.battle_type.smarts -= 2
			skill_used = false
		defended = true
		player_turn = false
	
	turns_since_skill += 1

func _on_attack_button_pressed() -> void:
	if(defeated):
		pass
	else:
		var damage = Global.battle_type.attack(enemy.get_dodge())
		enemy.health -= damage
		if(skill_used && Global.tia_chosen):
			Global.battle_type.speed -= 5
			Global.battle_type.strength -= 5
			skill_used = false
		elif(skill_used && Global.eve_chosen):
			Global.battle_type.smarts -= 2
			skill_used = false
		player_turn = false
		print("you attacked!")
		if(enemy.health >= 0):
			print("you do " + str(damage) + " damage. Enemy has " + str(enemy.health) + " health points remaining.")
		else:
			print("you do " + str(damage) + " damage. Enemy has 0 health points remaining.")
	turns_since_skill += 1
