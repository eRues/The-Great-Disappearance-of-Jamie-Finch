@abstract
class_name Battle_Player extends Battle_Character

var hp_increase
var str_increase
var spe_increase
var sma_increase
var spi_increase
var rnd = RandomNumberGenerator.new()

@abstract func use_skill(my_enemy : Battle_Enemy)

func attack(enemy_dodge : int, dmg : int) -> int: 
	if(enemy_dodge <= ((randi() + 1)*100)):
		dmg = get_damage()
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	return dmg

func check_inventory() -> void:
	print("inventory checked")

func add_level() -> void:
	if(((randi() + 1) * 100) <= hp_increase):
		health += 1
	if(((randi() + 1) * 100) <= str_increase):
		strength += 1
	if(((randi() + 1) * 100) <= spe_increase):
		speed += 1
	if(((randi() + 1) * 100) <= sma_increase):
		smarts += 1
	if(((randi() + 1) * 100) <= spi_increase):
		spirit += 1
	level += 1

func add_exp(enemy_exp : int) -> void:
	experience += enemy_exp
