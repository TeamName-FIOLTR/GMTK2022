extends Enemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func take_damage(amount : int, source)->void:
	if $phys_dice.rolled:
		#unlock the roll EXPLOSIVLY
		var collision_vec : Vector3 = ($phys_dice.global_transform.origin - source.global_transform.origin).normalized()*source.lazer.force*10
		$phys_dice.linear_velocity = collision_vec
		$phys_dice.roll(source.lazer.force*10)
	else:
		$phys_dice.snap_normal()
		$phys_dice.mode = RigidBody.MODE_RIGID
	.take_damage(amount,source)
func _on_phys_dice_body_entered(body):
	
	pass # Replace with function body.
