class_name Battle_Enemy extends Battle_Character
var enemy_name = "rabbit_dee"
var confused = false
var is_boss = false

func _init(new_name : String) -> void:
	enemy_name = new_name
	if(enemy_name == "rabbit_dee"):
		is_boss = false
		agitation = Global.base_agitation
		health = (int)(10 * Global.base_agitation)
		strength = (int)(2 * Global.base_agitation)
		speed = (int)(9 * Global.base_agitation)
		smarts = (int)(5 * Global.base_agitation)
		spirit = (int)(7 * Global.base_agitation)
		experience = (int)(10 * Global.base_agitation)

func _ready() -> void:
	pass

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

func defend():
	pass
