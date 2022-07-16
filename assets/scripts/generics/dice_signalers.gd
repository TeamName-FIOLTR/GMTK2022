extends Node

#this class represents a buffer space
#that signals its roll before returning it

class_name DiceSignaler


#this is a buffer to store our random roll before returning
#we store it here so others can modify it before return
var roll_buffer : int
var roller : Node = null
#tell everyone about our roll
#seperate so non rng dice can emit numbers on their roll
func emit_self()->void:
	for node in get_tree().get_nodes_in_group("super_dice_changers"):
		node.recive_dice(self)
	
	for node in get_tree().get_nodes_in_group("dice_recivers"):
		node.recive_dice(self)
	
	for node in get_tree().get_nodes_in_group("dice_changers"):
		node.recive_dice(self)
func get_roller()->Node:
	if roller:
		return roller
	return get_parent()
#gets the roll, but AFTER all of the dice powers
#have done their work
func get_modified_buffer()->int:
	emit_self()
	return roll_buffer
