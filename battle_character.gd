@abstract
class_name Battle_Character extends Character

@abstract func attack()
@abstract func defend()

func get_dodge() -> int:
	return (smarts + speed) * 2

func get_crit() -> int:
	return (speed + spirit) /2
