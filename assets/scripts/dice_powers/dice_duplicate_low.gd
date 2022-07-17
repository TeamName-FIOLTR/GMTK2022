extends DicePower

class_name MinDuplicationDicePower

func main_ready()->void:
	.main_ready()
func get_ability_string()->String:
	return "when YOU roll a 0 on a dice,duplicate that dice"
func get_flavor_text()->String:
	return "dice dice dice dice dice...."
func power(d : DiceSignaler)->void:
	if d is Dice:
		if d.roll_buffer == 0:
			d.get_dice_roller().dice_container.add_dice_from_number(d.dice_type)
	.power(d)
