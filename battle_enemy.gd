class_name Battle_Enemy extends Battle_Character
var enemy_sprite: Texture
var confused = false
var base_health = 0

func _init(new_name : String) -> void:
	Global.enemy_name = new_name
	if(Global.enemy_name == "rabbit_dee"):
		agitation = Global.base_agitation
		health = (int)(10 * Global.base_agitation)
		base_health = health
		strength = (int)(2 * Global.base_agitation)
		speed = (int)(9 * Global.base_agitation)
		smarts = (int)(5 * Global.base_agitation)
		spirit = (int)(7 * Global.base_agitation)
		experience = (int)(10 * Global.base_agitation)
		enemy_sprite = load("res://Assets/battle_placeholder.png")

func _ready() -> void:
	pass

func attack(enemy_dodge : int) -> int:
	var dmg = 0
	@warning_ignore("integer_division")
	if(health <= (base_health/2)):
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
