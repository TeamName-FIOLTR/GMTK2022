extends Entity


export(Vector2) var movement_vector
export(Vector2) var point_vector setget set_point_vector
export(float) var speed = 10

export(NodePath) var camera_path : NodePath
onready var cam : Camera = get_node(camera_path)

export(Vector3) var linear_velocity : Vector3

#is true if the mouse is in the game
var mouse_in : bool = false

func set_point_vector(n_vector : Vector2):
	point_vector = n_vector.normalized()
	if not is_inside_tree(): yield()
	rotation_degrees.y = atan2(point_vector.z,point_vector.x)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
#	apply_central_impulse(Vector3(movement_vector.x,0,-movement_vector.y)*delta*speed)
#	rotation.y = -point_vector.angle()
	
	linear_velocity = Vector3(movement_vector.x,0,-movement_vector.y)*speed
	
	var joy_vector : Vector2 = Input.get_vector("point_left","point_right","point_up","point_down")
	if joy_vector.length_squared() > 0.9:
			point_vector = joy_vector
	
	rotation.y = -atan2(point_vector.y,point_vector.x)
	if mouse_in:
		look_at_mouse()
	#look_at(global_transform*transform.affine_inverse()*Vector3(point_vector.x,0,point_vector.y),global_transform*transform.affine_inverse()*Vector3(0,1,0))
	move_and_collide(linear_velocity*delta)


func look_at_mouse()->void:
	var cam_target = cam.project_ray_normal(get_viewport().get_mouse_position())
		
	var collision_plane = Plane.PLANE_XZ
	collision_plane.d = 0
		
		
	var target_point = collision_plane.intersects_ray(cam.translation,cam_target.normalized())
		
	target_point = transform*global_transform.affine_inverse()*target_point - translation
		
		
		
	point_vector.x = target_point.x
	point_vector.y = target_point.z

#control wether or not the mouse is in the screen
func _notification(what):
	match what:
		NOTIFICATION_WM_MOUSE_ENTER:
			mouse_in = true
		NOTIFICATION_WM_MOUSE_EXIT:
			mouse_in = false

func _input(event):
	if (event is InputEventKey or event is InputEventJoypadMotion):
		movement_vector = Input.get_vector("move_left","move_right","move_down","move_up")
	if event is InputEventAction:
		if event.action in ["point_left","point_right","point_up","point_down"]:
			self.point_vector = Input.get_vector("point_left","point_right","point_down","point_up")
