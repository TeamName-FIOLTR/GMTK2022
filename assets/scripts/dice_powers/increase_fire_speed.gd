extends DicePower

class_name DicePowerIncreaseFireSpeed

func get_ability_string()->String:
	return "increase fire speed when you roll a " + get_numeric_targets()

func get_flavor_text()->String:
	return "pewpewpewpewpewpew\n-sun tzu, the art of war, probably"

func found_matching_roll(d : DiceSignaler):
	(get_parent().lazer as Gun).cool_down_time -= 0.1
