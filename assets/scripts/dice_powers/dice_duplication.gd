extends DicePower

class_name MaxDuplicateDicePower

func main_ready()->void:
	.main_ready()
func get_ability_string()->String:
	return "when YOU roll the highest number on a dice,\n gain another damge dice of that type"
func get_flavor_text()->String:
	return "dice dice dice dice dice...."
func power(d : DiceSignaler)->void:
	if d is Dice:
		if d.roll_buffer == d.dice_type:
			d.get_dice_roller().dice_container.add_dice_from_number(d.dice_type)
	.power(d)
