extends Node

#character selection variables
var ash_chosen = false
var tia_chosen = false
var eve_chosen = false
var nate_chosen = false

#enemy variables
var enemy_name = "rabbit_dee"
var is_boss = false

#which character is used in battle, changed in character select
var battle_type = Battle_Ash.new()

#determines if running from a battle is possible
var dont_run = false

#which enemy will be shown in the battle screen
var current_enemy = ""

#agitation of the phlegathon, added to the agitation of all non-boss enemies
var base_agitation = 1.00

#determines whether tutorial infographics and rocks appear in first hallway
var tutorial_finished = false

#determines what dialogue will be played
var walkin = true
var debris_interact = false
var granola_interact = false
var basement_stairs = false
var pre_phleg_1 = false
var pre_phleg_2 = false
var pre_phleg_3 = false
var post_tutorial = false
var rock_interact = false
var courtyard_door = false
var courtyard_cutscene = false
var rabbit_one = false
var rabbit_two = false
var rabbit_three = false
var rabbit_four = false
var rabbit_five = false

#tracks character position
var char_position_x = 30
var char_position_y = 147

#tracks what enemies are defeated
var dee_defeat = false
var dum_defeat = false
var dan_defeat = false
var dave_defeat = false
var bart_defeat = false
var rabbit_count = 0

#determines if character can move during dialogue
var in_chat = false

#variable that determines which scene a transition want to go to
var target_scene = ""
var battle_target = ""
var from_battle = false

#variable to prevent the character from moving for cutscenes
var can_move = true
