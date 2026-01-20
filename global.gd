extends Node

#character selection variables
var ash_chosen = false
var tia_chosen = false
var eve_chosen = false
var nate_chosen = false

#enemy variables
var enemy_name = "keeper"
var is_boss = true

#which character is used in battle, changed in character select
var battle_type = Battle_Ash.new()

#determines if running from a battle is possible
var dont_run = false

#which enemy will be shown in the battle screen
var current_enemy = ""

#agitation of the phlegathon, added to the agitation of all non-boss enemies
var base_agitation = 1.00
