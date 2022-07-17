extends DicePower

class_name increaseLazerForceDP

func get_ability_string()->String:
	return "when you roll a " + get_numeric_targets() + " , increase lazer force by 1"

func get_flavor_text()->String:
	return "IM FIRIN' MY LAAAAAAZEEEEER"

func found_matching_roll(d : DiceSignaler)->void:
	get_parent().lazer.force += 1
