class_name Battle_Tia extends Battle_Player
var defended = false
var can_use_skill = true

func _init() -> void:
	health = 28
	base_health = health
	strength = 6
	speed = 10
	spirit = 9
	smarts = 5
	hp_increase = 65
	str_increase = 35
	spe_increase = 80
	spi_increase = 60
	sma_increase = 25
	level = 1
	experience = 0

func defend():
	defended = true

func use_skill(_my_enemy : Battle_Enemy):
	if(can_use_skill):
		strength += 5
	else:
		print("wait for cooldown")
