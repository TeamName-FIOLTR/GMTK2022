extends KinematicBody

class_name Entity

export var dice_container_path : NodePath
onready var dice_container : DiceContainer = get_node(dice_container_path)



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#called when we hit a target
func hit_target(target)->void:
	pass
