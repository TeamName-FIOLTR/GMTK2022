extends Node

#this class represents a dice power and can be added
#to an entity in order to run the power on that entity 

class_name DicePower

#does this power work with ALL dice or YOUR dice
export var global : bool = false
#should the power be running?
export var enabled : bool = false

func get_ability_string()->String:
	return "A Default Power"
func get_flavor_text()->String:
	return "much wow"

export(Array,int) var rolls_to_match : Array


#this function is inteanded to be called whenever
#a dice whose value matches the given values is rolled
func found_matching_roll(d : DiceSignaler)->void:
	pass
#this function is inteanded to be called whenever
#a dice whose value does NOT match is rolled
func found_miss_match_roll(d : DiceSignaler)->void:
	pass

#this function is inteanded to impliment the power of the dice
#it is ONLY called if the given dice matches the global
#or local behavior

#it has some default behavior for convinence
#if you want to overload it go ahead, nothing should break :)
func power(d : DiceSignaler)->void:
	if d.roll_buffer in rolls_to_match:
		found_matching_roll(d)
	else:
		found_miss_match_roll(d)

#called when a dice is rolled, only runs if it makes
#sense to run
func recive_dice(d : DiceSignaler)->void:
	if enabled and (global or d.get_roller() == self):
		power(d)

#overidable ready in case you want to 
#change the group the node is in
func main_ready():
	add_to_group("dice_recivers")

func _ready():
	main_ready()
