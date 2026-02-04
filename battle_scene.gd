extends Node2D
var enemy
var defended = false
var player_turn = true
var skill_used = false
var turns_since_skill = 5
var defeated = false
var exp_added = false
var damage_done = 0
var continued = false
var attacked = false
@onready var sprite = $placeholder_sprite
@onready var text = get_node("end_battle")
@onready var inventory_ui = $CanvasLayer
@onready var text_box = $battle_text
@onready var desc_text = $battle_text/text

func _ready() -> void:
	if(Global.is_boss):
		enemy = Battle_Boss.new(Global.enemy_name)
	else:
		enemy = Battle_Enemy.new(Global.enemy_name)
	exp_added = false
	damage_done = 0
	$health_bar_e.max_value = enemy.base_health
	$health_bar_p.max_value = Global.battle_type.base_health

func _process(_delta) -> void:
	sprite.texture = (enemy.enemy_sprite)
	$health_label_e.text = str(enemy.health)
	$health_label_p.text = str(Global.battle_type.health)
	$health_bar_e.value = enemy.health
	$health_bar_p.value = Global.battle_type.health
	
	if(Input.is_action_just_pressed("space")):
		text_box.visible = false
		continued = true
		if(attacked):
			player_turn = false
			attacked = false
	
	if(Global.battle_type.health <= 0):
		text_box.visible = true
		desc_text.text = "Game Over!"
		if(continued):
			if(Global.tutorial_finished != true):
				Global.tutorial_finished = true
				Global.char_position_x = 1655
				Global.char_position_y = 147
				get_tree().change_scene_to_file("res://Areas/1st_floor_hallway.tscn")
			else:
				get_tree().change_scene_to_file("res://main_menu.tscn")
	if(defeated):
		pass
	elif(continued):
		continued = false
		if(enemy.health > 0 && player_turn):
			pass
		if(enemy.health > 0 && !player_turn):
			if(enemy.confused):
				text_box.visible = true
				desc_text.text = "The enemy is confused, it cannot attack"
				defended = false
				player_turn = true
			else:
				var damage = enemy.attack(Global.battle_type.get_dodge())
				damage_done += damage
				Global.battle_type.health -= damage
				text_box.visible = true
				desc_text.text = "It attacked! It does " + str(damage) + " damage. You have " + str(Global.battle_type.health) + " health points remaining."
				defended = false
				player_turn = true
			if(turns_since_skill == 1):
				enemy.confused = false
		if(enemy.health <= 0):
			defeated = true
			if(!exp_added):
				Global.battle_type.add_exp(enemy.experience)
				exp_added = true
			else:
				pass
			if((int)(Global.battle_type.experience / Global.battle_type.exp_to_next_level) >= 1):
				Global.battle_type.add_level()
			sprite.visible = false
			text.visible = true
			text_box.visible = false
			if(Global.is_boss == false):
				Global.base_agitation += 0.2
			else:
				Global.base_agitation += 1

func _on_run_button_pressed() -> void:
	if(defeated || Global.dont_run):
		text_box.visible = true
		desc_text.text = "You cannot run from this fight."
	else:
		get_tree().change_scene_to_file(Global.battle_target)

func _on_skill_button_pressed() -> void:
	if(defeated):
		pass
	else:
		if(turns_since_skill >= 4):
			Global.battle_type.can_use_skill = true
			Global.battle_type.use_skill(enemy)
			turns_since_skill = 0
			text_box.visible = true
			desc_text.text = "You used your skill, the enemy is now confused."
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
		inventory_ui.visible = !inventory_ui.visible

func _on_defend_button_pressed() -> void:
	if(defeated || defended):
		text_box.visible = true
		desc_text.text = "You cannot defend right now!"
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
	continued = false
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
		if(enemy.health >= 0):
			text_box.visible = true
			desc_text.text = "You attacked! You do " + str(damage) + " damage. It has " + str(enemy.health) + " health points remaining."
		else:
			text_box.visible = true
			desc_text.text = "You attacked! You do " + str(damage) + " damage. Enemy has 0 health points remaining."
	turns_since_skill += 1
	attacked = true

func _on_exit_pressed() -> void:
	inventory_ui.visible = false
