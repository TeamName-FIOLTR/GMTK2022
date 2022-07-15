extends Node

#this script represents a dice container
#any dice node that is a child of this node
#is rolled

class_name DiceContainer

func dice_count()->int:
	return len(get_children())

func roll()->int:
	var ret_val : int = 0
	for node in get_children():
		ret_val += (node as Dice).roll()
	return ret_val

func add_dice_from_number(max_sides : int)->void:
	var d : Dice = Dice.new(max_sides)
	add_dice(d)

func add_dice(d : Dice)->void:
	add_child(d)

func remove_dice(d : Dice)->void:
	remove_child(d)