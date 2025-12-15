@abstract
class_name Battle_Player extends Battle_Character

var hp_increase
var str_increase
var spe_increase
var sma_increase
var spi_increase
var exp_to_next_level = 10
var skill_cooldown = 0
var leveled_up = false

@abstract func use_skill(my_enemy : Battle_Enemy)

func attack(enemy_dodge : int) -> int: 
	var dmg = 0
	if(enemy_dodge <= ((randi() + 1)*100)):
		dmg = get_damage()
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	return dmg

func check_inventory() -> void:
	print("inventory checked")

func add_level() -> void:
	leveled_up = true
	if(((randf()*100) + 1) <= hp_increase):
		health += 1
	if(((randf()*100) + 1) <= str_increase):
		strength += 1
	if(((randf()*100) + 1) <= spe_increase):
		speed += 1
	if(((randf()*100) + 1) <= sma_increase):
		smarts += 1
	if(((randf()*100) + 1) <= spi_increase):
		spirit += 1
	level += 1
	experience = experience % exp_to_next_level
	exp_to_next_level += 10
	leveled_up = false

func add_exp(enemy_exp : int) -> void:
	experience += enemy_exp
