extends DicePower

class_name DiceDamageIncreaseDicePower


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_ability_string()->String:
	return "When you roll a number, you will take 125% of damage"

func get_flavor_text()->String:
	return "Sticks and Stones may break your bones\nBut 125% more!"
func found_matching_roll(d : DiceSignaler):
	var parent = get_parent() 
	if parent is Player:
		parent.damaging_multiplier *= 1.25
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
