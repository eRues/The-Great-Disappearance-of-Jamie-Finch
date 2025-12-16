extends RichTextLabel
func _ready() -> void:
	self.visible = true

func _on_visibility_changed() -> void:
	self.clear()
	self.add_text("Enemy Defeated!")
	self.newline()
	self.add_text("Level: " + str(Global.battle_type.level))
	self.newline()
	self.add_text("Experience: " + str(Global.battle_type.experience) + " / " + str(Global.battle_type.exp_to_next_level))
	self.newline()
	self.add_text("Health = " + str(Global.battle_type.health) + " / " + str(Global.battle_type.base_health))
	self.newline()
	self.add_text("Strength = " + str(Global.battle_type.strength))
	self.newline()
	self.add_text("Speed = " + str(Global.battle_type.speed))
	self.newline()
	self.add_text("Smarts = " + str(Global.battle_type.smarts))
	self.newline()
	self.add_text("Spirit = " + str(Global.battle_type.spirit))
	
