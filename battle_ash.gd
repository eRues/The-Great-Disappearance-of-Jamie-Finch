class_name Battle_Ash extends Battle_Player
var defend_mod = 0
var can_use_skill = true

func _init() -> void:
	health = 30
	base_health = health
	strength = 10
	speed = 8
	spirit = 5
	smarts = 4
	hp_increase = 80
	str_increase = 80
	spe_increase = 50
	spi_increase = 40
	sma_increase = 35
	level = 1
	experience = 0

func _process(_delta) -> void:
	pass

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
