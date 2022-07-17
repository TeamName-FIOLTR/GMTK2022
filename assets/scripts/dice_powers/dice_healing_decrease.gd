extends DicePower

class_name DiceHealingDecreaseDicePower


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_ability_string()->String:
	return "When you roll a number, your healing decreases to 80%"

func get_flavor_text()->String:
	return "Unfortunately, your subscription to Healing+ has ended."
func found_matching_roll(d : DiceSignaler):
	var parent = get_parent() 
	if parent is Player:
		parent.healing_multiplier *= 0.8
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
