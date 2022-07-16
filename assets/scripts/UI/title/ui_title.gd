extends Control
var dice_power : DicePower setget set_dice_power,get_dice_power
func set_dice_power(val : DicePower)->void:
	dice_power = val
	display_dice_power(dice_power)
func get_dice_power()->DicePower:
	return dice_power

export(String) var title : String = "This Is A Title" setget set_title,get_title
func set_title(val : String)->void:
	$"Main Display".text = val
func get_title()->String:
	return $"Main Display".text
export(String) var flavor_text : String = "indeed it is" setget set_flavor_text,get_flavor_text
func set_flavor_text(val : String)->void:
	$"flavor text".text = val
func get_flavor_text()->String:
	return $"flavor text".text

export(int) var damage_increase : int setget set_damage_increase,get_damage_increase
func set_damage_increase(val : int)->void:
	damage_increase = val
	$"damage increase".text = "+1d" + str(val) + " damage"
func get_damage_increase()->int:
	return damage_increase

func display_dice_power(dp : DicePower)->void:
	self.title = dice_power.get_ability_string()
	self.flavor_text = dice_power.get_flavor_text()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if visible:
		if Input.is_action_just_pressed("fire"):
			get_parent().take_power(dice_power,damage_increase)
			visible = false
		if Input.is_action_just_pressed("aim"):
			dice_power.queue_free()
			visible = false
