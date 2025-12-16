class_name Battle_Eve extends Battle_Player
var defended = false
var can_use_skill = true
var temp_smarts = 2

func _init() -> void:
	health = 25
	base_health = health
	strength = 6
	speed = 7
	spirit = 4
	smarts = 10
	hp_increase = 40
	str_increase = 25
	spe_increase = 70
	spi_increase = 15
	sma_increase = 90
	level = 1
	experience = 0

func defend():
	defended = true

func use_skill(my_enemy : Battle_Enemy):
	if(can_use_skill):
		my_enemy.confused = true
		print("enemy is confused")
		smarts += temp_smarts
		print(smarts)
		can_use_skill = false
	else:
		print("wait for cooldown")
