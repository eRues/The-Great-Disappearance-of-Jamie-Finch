extends Control
@onready var icon = $inner_border/item_icon
@onready var quantity_label = $inner_border/item_quantity
@onready var details_panel = $details_panel
@onready var item_name = $details_panel/item_name
@onready var item_desc = $details_panel/item_description
@onready var item_effect = $details_panel/item_effects
@onready var use_panel = $use_panel

var item = null

func _on_item_button_pressed() -> void:
	if(item != null):
		use_panel.visible = !use_panel.visible

func _on_item_button_mouse_entered() -> void:
	if(item != null):
		use_panel.visible = false
		details_panel.visible = true

func _on_item_button_mouse_exited() -> void:
	details_panel.visible = false

func set_empty():
	icon.texture = null
	quantity_label.text = ""

func set_item(new_item):
	item = new_item
	icon.texture = new_item["item_texture"]
	quantity_label.text = str(new_item["quantity"])
	item_name.text = str(new_item["item_name"])
	item_desc.text = str(new_item["item_desc"])
	item_effect.text = str("item_effects")
