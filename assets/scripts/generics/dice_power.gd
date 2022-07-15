extends Node

#this class represents a dice power and can be added
#to an entity in order to run the power on that entity 

class_name DicePower

#does this power work with ALL dice or YOUR dice
export var global : bool = false

#this function is inteanded to impliment the power of the dice
#it is ONLY called if the given dice matches the global
#or local behavior
func power(d : DiceSignaler)->void:
	pass

#called when a dice is rolled, only runs if it makes
#sense to run
func recive_dice(d : DiceSignaler)->void:
	if global or d.get_roller() == self:
		power(d)
