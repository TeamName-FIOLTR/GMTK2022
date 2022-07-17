extends DicePower

class_name AddD20DicePower

func get_ability_string()->String:
	return "when you roll a 20, gain +1d20"

func get_flavor_text()->String:
	return "UNLIMITED POWAH"

func found_miss_match_roll(d : DiceSignaler)->void:
	if d.roll_buffer == 20:
		(get_parent().dice_container).add_dice_from_number(20)
