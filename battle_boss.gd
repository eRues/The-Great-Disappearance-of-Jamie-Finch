class_name Battle_Boss extends Battle_Enemy

func _init(new_name : String) -> void:
	Global.enemy_name = new_name
	if(Global.enemy_name == "phleg_intro"):
		agitation = Global.base_agitation
		health = (int)(150 * Global.base_agitation)
		base_health = health
		strength = (int)(14 * Global.base_agitation)
		speed = (int)(10 * Global.base_agitation)
		smarts = (int)(10 * Global.base_agitation)
		spirit = (int)(10 * Global.base_agitation)
		experience = (int)(10 * Global.base_agitation)
		enemy_sprite = load("res://Assets/Enemy Characters/Phlegathon/phleg_sprite_one.png")
	elif(Global.enemy_name == "keeper"):
		agitation = Global.base_agitation
		health = (int)(20 * Global.base_agitation)
		base_health = health
		strength = (int)(5 * Global.base_agitation)
		speed = (int)(4 * Global.base_agitation)
		smarts = (int)(4 * Global.base_agitation)
		spirit = (int)(2 * Global.base_agitation)
		experience = (int)(20 * Global.base_agitation)
		enemy_sprite = load("res://Assets/Enemy Characters/Groundskeeper/keeper_battle.png")

func attack(enemy_dodge : int) -> int:
	var dmg = 0
	@warning_ignore("integer_division")
	if(health <= (base_health/2)):
		if(enemy_dodge <= ((randi() + 1)*100)):
			dmg = get_damage()
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
		@warning_ignore("integer_division")
	elif(health <= (base_health*(2/3))):
		if(enemy_dodge <= ((randi() + 1)*100)):
			dmg = (int)(get_damage()*1.1)
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	else:
		if(enemy_dodge <= ((randi() + 1)*100) + 10):
			dmg = (int)(get_damage()*1.25)
		
		if(((randi() + 1)*100) <= get_crit()):
			dmg *= 2
	
	return dmg
