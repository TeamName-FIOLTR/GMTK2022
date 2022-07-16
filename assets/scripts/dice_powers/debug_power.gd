extends DicePower

#this is a dice power that prints out a value if you match
#any of its rolls

#YOU HAVE THE POWER OF DEBUG

class_name DebugDicePower

func found_miss_match_roll(d : DiceSignaler):
	if global:
		print("someone rolled a ", d.roll_buffer)
	else:
		print("we rolled a ", d.roll_buffer)
	.found_miss_match_roll(d)
