extends Node

#this script represents a dice container
#any dice node that is a child of this node
#is rolled

class_name DiceContainer
var dice_array : Array
func _ready():
	for node in get_children():
		(node as Dice).roller = get_parent()

func dice_count()->int:
	return len(get_children())

func get_dice_total_sum()->int:
	var ret_val : int = 0
	for dice in get_children():
		ret_val += dice.dice_type
	return ret_val

func roll()->int:
	var ret_val : int = 0
	for node in get_children():
		(node as Dice).roller = get_parent()
		ret_val += (node as Dice).roll()
	return ret_val

func add_dice_from_number(max_sides : int,roller = null)->void:
	var d : Dice = Dice.new()
	d.dice_type = max_sides
	d.roller = roller
	add_dice(d)

func add_dice(d : Dice)->void:
	d.owner = self
	add_child(d)

func remove_dice(d : Dice)->void:
	remove_child(d)
