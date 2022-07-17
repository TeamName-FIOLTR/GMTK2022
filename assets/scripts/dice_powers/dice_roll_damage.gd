extends DicePower

class_name DiceDamageDicePower


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_ability_string()->String:
	return "When you roll a number, you will take 10 damage"

func get_flavor_text()->String:
	return "Roulette Time!"
func found_matching_roll(d : DiceSignaler):
	var parent = get_parent() 
	if parent is Player:
		print("roll of the power dice yeahha")
		parent.take_damage(10)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
