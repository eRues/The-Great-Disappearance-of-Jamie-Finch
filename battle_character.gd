@abstract
class_name Battle_Character extends Character

@abstract func attack(enemy_dodge : int, dmg : int) -> int
@abstract func defend()

func get_damage() -> int:
	return (int)(strength/2)

func get_dodge() -> int:
	return (smarts + speed) * 2

func get_crit() -> int:
	return (speed + spirit) /2
