extends Spatial

class_name Enemy

export var dice_container_path : NodePath
onready var dice_container : Node = get_node(dice_container_path)

export var starting_hp : int = 6
var hp : int

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = starting_hp
	add_to_group("enemy")

#called when we hit a target
func hit_target(target)->void:
	pass

func _process(delta):
	$art.translation = $phys_dice.translation

func die():
	queue_free()

func take_damage(amount : int, src: Spatial)->void:
	hp -= amount
	if hp <= 0:
		die()
