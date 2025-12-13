class_name Battle_Nate extends Battle_Player
var defend_mod = 0
var base_health
var can_use_skill = true

func _init() -> void:
	health = 26
	base_health = health
	strength = 4
	speed = 6
	spirit = 10
	smarts = 8
	hp_increase = 70
	str_increase = 30
	spe_increase = 40
	spi_increase = 70
	sma_increase = 55
	level = 1
	experience = 0

func defend():
	if(speed - 5 <= 1):
		defend_mod = 1
	else:
		defend_mod = speed - 5
	
	health += defend_mod

func use_skill(my_enemy : Battle_Enemy):
	if(can_use_skill):
		my_enemy.confused = true
		print("enemy is confused")
	else:
		print("wait for cooldown")
