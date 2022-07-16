extends DicePower

class_name MinDuplicationDicePower

func main_ready()->void:
	.main_ready()
func get_ability_string()->String:
	return "when YOU roll a 1 on a dice,\n gain a damge dice of that type"
func get_flavor_text()->String:
	return "dice dice dice dice dice...."
func power(d : DiceSignaler)->void:
	if d is Dice:
		if d.roll_buffer == 1:
			d.get_dice_roller().dice_container.add_dice_from_number(d.dice_type)
	.power(d)
