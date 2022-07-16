extends DiceSignaler
#this class represents the dice in the game
#and controls signal emission and movement
#of random dice roll data

class_name Dice


#how high this dice can roll
export var dice_type : int = 6


func get_roller()->Node:
	return get_parent()

#returns a number from 1 to the dice type
func generate_random_roll()->int:
	return (randi() % dice_type) + 1
	
func roll()->int:
	roll_buffer = generate_random_roll()
	
	#tell everyone about the roll
	emit_self()
	
	#return the value of the roll
	return roll_buffer
