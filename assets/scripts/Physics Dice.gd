extends RigidBody

class_name PhysicsDice

var dice_signaler = DiceSignaler.new()

var check_vector = Vector3(0,1,0)
export(float) var linear_velocity_threashold = 0.1
export(float) var angular_velocity_threashold = 0.1
export(bool) var lock_roll = true
var rolled : bool = false
export(Array, Vector3) var face_normals = []
export(Array, int) var face_numbers = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(dice_signaler)
#	print(3^2)
#	apply_torque_impulse(100*Vector3.ONE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if !rolled and (linear_velocity.length() <= linear_velocity_threashold and angular_velocity.length() <= angular_velocity_threashold):
		rolled = true
		if lock_roll:
#			$CollisionShape.disabled = true
#			set_physics_process(false)
#			set_physics_process_internal(false)
			mode = RigidBody.MODE_STATIC
#			print("I'M DONE")
		dice_signaler.roll_buffer = get_rolled_face()
		dice_signaler.emit_self()
		pass
	elif rolled and !lock_roll:
		if linear_velocity.length() >= linear_velocity_threashold or angular_velocity.length() >= angular_velocity_threashold:
			rolled = false

func get_rolled_face():
	var idx = 0
	var max_idx = 0
	var current_facing = 0.0
	var max_facing = 0.0
	var local_check_vector = global_transform.affine_inverse().basis*check_vector
	for normal in face_normals:
		current_facing = local_check_vector.dot(normal)
		if current_facing > max_facing:
			max_facing = current_facing
			max_idx = idx
		idx += 1
	if max_idx < len(face_numbers):
		return face_numbers[max_idx]
	if len(face_numbers) == 0:
		max_idx += 1
	return max_idx

func _input(event):
	if event.is_action_pressed("ui_accept"):
#		apply_impulse(Vector3(randf(),randf(),randf()),10*Vector3(randf(),randf(),randf()))
		apply_torque_impulse(10*Vector3(randf(),randf(),randf()))
