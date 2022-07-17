extends DicePower

class_name DecreaseLazerForceDP

func get_ability_string()->String:
	return "when you roll a " + get_numeric_targets() + " , decrease lazer force by 1"

func get_flavor_text()->String:
	return "GET OVER HERE"

func found_matching_roll(d : DiceSignaler)->void:
	get_parent().lazer.force -= 1
