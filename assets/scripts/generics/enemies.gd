extends Spatial

class_name Enemy

export var dice_container_path : NodePath
onready var dice_container : Node = get_node(dice_container_path)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#called when we hit a target
func hit_target(target)->void:
	pass

func _process(delta):
	$art.translation = $phys_dice.translation

func take_damage(amount : int, src: Node)->void:
	pass
