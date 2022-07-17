extends DicePower

class_name GlobalPowerIncreaseDP

func get_ability_string()->String:
	return "when ANYONE rolls " + get_numeric_targets() + ", increase the roll by 1 \noccures before all other abilities"
func get_flavor_text()->String:
	return "HIT ITS WEAK POINT FOR MAXIMUM DAMAGE"
func main_ready()->void:
	add_to_group("super_dice_changers")

func found_matching_roll(d : DiceSignaler)->void:
	d.roll_buffer += 1
