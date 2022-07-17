extends DicePower

class_name DiceHealingIncreaseDicePower


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_ability_string()->String:
	return "When you roll a number, your healing is 125% as effective!"

func get_flavor_text()->String:
	return "Regenerative? Nah we just follow the instructions"
func found_matching_roll(d : DiceSignaler):
	var parent = get_parent() 
	if parent is Player:
		parent.healing_multiplier *= 1.25
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
