@abstract
class_name Battle_Player extends Battle_Character

var hp_increase_chance
var str_increase_chance
var spe_increase_chance
var sma_increase_chance
var spi_increase_chance

@abstract func use_skill()

func add_level() -> void:
	level += 1
