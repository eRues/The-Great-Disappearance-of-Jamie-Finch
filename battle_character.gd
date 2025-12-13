@abstract
class_name Battle_Character extends Character

@abstract func attack(enemy_dodge : int) -> int
@abstract func defend()

func get_damage() -> int:
	@warning_ignore("integer_division")
	return (int)(strength/2)

func get_dodge() -> int:
	return (smarts + speed) * 2

func get_crit() -> int:
	@warning_ignore("integer_division")
	return (speed + spirit) /2
