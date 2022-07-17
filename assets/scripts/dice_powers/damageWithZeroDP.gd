extends DicePower

#this is a dice power that prints out a value if you match
#any of its rolls

#YOU HAVE THE POWER OF DEBUG

class_name DamageOnLessThanZeroDP

func get_ability_string():
	return "any time you roll less than 0, deal 5 damage to all enemies"

func get_flavor_text():
	return "It's the little ones you gotta look out for"

func found_miss_match_roll(d : DiceSignaler):
	if d.roll_buffer < 0:
		for node in get_tree().get_nodes_in_group("enemy"):
			node.take_damage(5,get_parent())
	.found_matching_roll(d)
