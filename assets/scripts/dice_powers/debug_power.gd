extends DicePower

#this is a dice power that prints out a value if you match
#any of its rolls

#YOU HAVE THE POWER OF DEBUG

class_name DebugDicePower
func get_ability_string():
	if len(rolls_to_match) != 0:
		return "print all rolls not in " + str(rolls_to_match)
	return "print all rolls"
func get_flavor_text():
	return "(dice2)woopsy doopsy forgot to remove debug"
func found_miss_match_roll(d : DiceSignaler):
	if global:
		print("someone rolled a ", d.roll_buffer)
	else:
		print("we rolled a ", d.roll_buffer)
	.found_miss_match_roll(d)
