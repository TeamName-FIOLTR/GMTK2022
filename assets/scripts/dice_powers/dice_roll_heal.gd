extends DicePower

class_name DiceHealDicePower


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_ability_string()->String:
	return "When you roll " + get_numeric_targets() + " you will heal 10 Health"

func get_flavor_text()->String:
	return "woooooow baby a triple :D"
func found_matching_roll(d : DiceSignaler):
	var parent = get_parent() 
	if parent is Player:
		parent.heal(10)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
