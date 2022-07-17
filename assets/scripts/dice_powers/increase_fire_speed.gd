extends DicePower

class_name DicePowerIncreaseFireSpeed

func get_ability_string()->String:
	var ret_val = "increase fire speed when you roll a "
	if len(rolls_to_match) > 0:
		for roll in rolls_to_match:
			ret_val += " " + str(roll)
	return ret_val

func get_flavor_text()->String:
	return "pewpewpewpewpewpew\n-sun tzu, the art of war, probably"

func found_matching_roll(d : DiceSignaler):
	(get_parent().gun as Gun).cool_down_time -= 1
