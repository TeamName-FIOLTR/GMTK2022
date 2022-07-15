extends Node
#this class represents the dice in the game
#and controls signal emission and movement
#of random dice roll data

class_name dice

#how high this dice can roll
export var dice_type : int = 6


#this is a buffer to store our random roll before returning
#we store it here so others can modify it before return
var roll_buffer : int

#returns a number from 1 to the dice type
func generate_random_roll()->int:
	return (randi() % dice_type) + 1

func roll()->int:
	roll_buffer = generate_random_roll()
	
	for node in get_tree().get_nodes_in_group("super_dice_changers"):
		node.recive_dice(self)
	
	for node in get_tree().get_nodes_in_group("dice_recivers"):
		node.recive_dice(self)
	
	for node in get_tree().get_nodes_in_group("dice_changers"):
		node.recive_dice(self)
	
	#return the value of the roll
	return roll_buffer
