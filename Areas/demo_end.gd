extends Node2D

func _on_menu_button_pressed() -> void:
	Global.ash_chosen = false
	Global.tia_chosen = false
	Global.eve_chosen = false
	Global.nate_chosen = false
	Global.enemy_name = "rabbit_dee"
	Global.is_boss = false
	Global.dont_run = false
	Global.base_agitation = 1.00
	Global.tutorial_finished = false
	Global.walkin = true
	Global.debris_interact = false
	Global.granola_interact = false
	Global.basement_stairs = false
	Global.char_position_x = 30
	Global.char_position_y = 147
	Global.dee_defeat = false
	Global.dum_defeat = false
	Global.dan_defeat = false
	Global.dave_defeat = false
	Global.bart_defeat = false
	Global.rabbit_count = 0
	Global.in_chat = false
	Global.target_scene = ""
	Global.battle_target = ""
	Global.from_battle = false
	
	get_tree().change_scene_to_file("res://main_menu.tscn")
