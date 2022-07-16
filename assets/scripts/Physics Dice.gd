extends RigidBody

class_name PhysicsDice

var dice_signaler = DiceSignaler.new()

var check_vector = Vector3(0,1,0)
export(float) var linear_velocity_threashold = 0.1
export(float) var angular_velocity_threashold = 0.1
export(float) var facing_threashold = 0.1
export(bool) var lock_roll = true

export(NodePath) var cool_anim_mesh_path
export(float) var radial_reveal = 1 setget set_radial_reveal
export(float) var line_thickness = 0.2 setget set_line_thickness
export(float) var brightness = 4 setget set_brightness
var rolled : bool = false
var freash_dice : bool = true
export(Array, Vector3) var face_normals = []
export(Array, int) var face_numbers = []


onready var cool_anim_mesh : MeshInstance = get_node(cool_anim_mesh_path)

func set_radial_reveal(n_reveal):
	radial_reveal = n_reveal
	if not is_inside_tree(): yield(self, "ready")
	update_cool_shader()

func set_line_thickness(n_thickness):
	line_thickness = n_thickness
	if not is_inside_tree(): yield(self, "ready")
	update_cool_shader()

func set_brightness(n_brightness):
	brightness = n_brightness
	if not is_inside_tree(): yield(self, "ready")
	update_cool_shader()

func update_cool_shader():
	if cool_anim_mesh:
		var mat = (cool_anim_mesh as MeshInstance).get_surface_material(0)
		mat.set_shader_param("Radial_Fill", radial_reveal)
		mat.set_shader_param("Line_Thickness", line_thickness)
		mat.set_shader_param("Brightness", brightness)
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
	if !freash_dice and !rolled and (linear_velocity.length() <= linear_velocity_threashold and angular_velocity.length() <= angular_velocity_threashold and get_face_closeness()>=(1.0-facing_threashold)):
		rolled = true
		if lock_roll:
#			$CollisionShape.disabled = true
#			set_physics_process(false)
#			set_physics_process_internal(false)
			mode = RigidBody.MODE_STATIC
#			print("I'M DONE")
		thingy_func()
		dice_signaler.roll_buffer = get_rolled_face()
		dice_signaler.emit_self()
	elif rolled and !lock_roll:
		if linear_velocity.length() >= linear_velocity_threashold or angular_velocity.length() >= angular_velocity_threashold:
			rolled = false
	elif freash_dice:
		if linear_velocity.length() >= linear_velocity_threashold or angular_velocity.length() >= angular_velocity_threashold:
			freash_dice = false

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

func get_face_closeness():
	var face = get_rolled_face()
	var face_norm = face_normals[face-1]
	var local_check_vector = global_transform.affine_inverse().basis*check_vector
	var amount = local_check_vector.dot(face_norm)
	return amount

#snaps the dice to the nearest roll and stops all rolling
func snap_normal()->void:
#	rotation
#	look_at(global_transform*Vector3(1,0,0),Vector3(0,1,0))
	
	var face_n = get_rolled_face()
	if len(face_numbers) > 0 and face_n in face_numbers:
		pass
	else:
		print("target normal ", face_normals[face_n-1])
		var target_normal = face_normals[face_n-1]
		var new_y = target_normal
		var new_x = new_y.cross(global_transform.affine_inverse().basis*Vector3(0,1,0))
		var new_z = new_x.cross(target_normal)
		new_x = new_x.normalized()
		new_z = new_z.normalized()
		new_y = new_y.normalized()
		
		#y is wacky
		
		print("new x ", new_x)
		print("new y ", new_y)
		print("new z ", new_z)
		
		# trans rights
		var new_trans = Transform(new_x,new_y,new_z,Vector3(0,0,0))
		
		global_transform.basis = new_trans.affine_inverse().basis
	linear_velocity = Vector3(0,0,0)
	angular_velocity = Vector3(0,0,0)
	sleeping = true
	yield(get_tree(),"idle_frame")
	print(global_transform.basis)
#	global_transform.basis = new_trans.basis


func _input(event):
	if event.is_action_pressed("ui_accept"):
#		apply_impulse(Vector3(randf(),randf(),randf()),10*Vector3(randf(),randf(),randf()))
		apply_torque_impulse(10*Vector3(randf(),randf(),randf()))


func thingy_func():
	pass
