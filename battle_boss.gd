class_name Battle_Boss extends Battle_Enemy

func attack(enemy_dodge : int) -> int:
	var dmg = 0
	@warning_ignore("integer_division")
	if(health <= (health/2)):
		if(enemy_dodge <= ((randi() + 1)*100)):
			dmg = get_damage()
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	else:
		if(enemy_dodge <= ((randi() + 1)*100) + 10):
			dmg = (int)(get_damage()*1.5)
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	
	return dmg
