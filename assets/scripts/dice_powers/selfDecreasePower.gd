extends DicePower

class_name SelfDecreasePowerDP

func get_ability_string()->String:
	return "Decrease all of your rolls by 1"

func get_flavor_text()->String:
	return "Honey, I shrunk the player"

func main_ready()->void:
	add_to_group("super_dice_changers")

func found_miss_match_roll(d : DiceSignaler)->void:
	d.roll_buffer -= 1
