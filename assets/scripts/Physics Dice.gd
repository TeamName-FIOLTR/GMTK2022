extends RigidBody

class_name PhysicsDice

var check_vector = Vector3(0,1,0)
export(Array, Vector3) var face_normals = []
export(Array, int) var face_numbers = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
