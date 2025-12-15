class_name Battle_Enemy extends Battle_Character
var enemy_name = "rabbit_dee"
var confused = false

func _init(new_name : String) -> void:
	enemy_name = new_name
	if(enemy_name == "rabbit_dee"):
		health = 10
		strength = 2
		speed = 9
		smarts = 5
		spirit = 7
		experience = 10

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
