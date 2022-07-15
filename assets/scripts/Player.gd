extends RigidBody


export(Vector2) var movement_vector
export(Vector2) var point_vector = Vector2(0,1) setget set_point_vector
export(float) var speed = 10

func set_point_vector(n_vector : Vector2):
	point_vector = n_vector.normalized()
	if not is_inside_tree(): yield()
	self.rotation.y = atan2(point_vector.y,point_vector.x)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	self.rotation.y = atan2(point_vector.y,point_vector.x)
	pass


func _physics_process(delta):
#	apply_central_impulse(Vector3(movement_vector.x,0,-movement_vector.y)*delta*speed)
#	self.point_vector = Input.get_vector("point_left","point_right","point_down","point_up")
#	rotation.y = 1
	linear_velocity = Vector3(movement_vector.x,0,-movement_vector.y)*speed
#	rotation.y = atan2(point_vector.y,point_vector.x)
#	call_deferred("set_rotation",Vector3(0,atan2(point_vector.y,point_vector.x),0))
	get_tree().call_group("Arbitrary Data Recievers", "recieve_arbitrary_data", "player lin vel", linear_velocity)
	get_tree().call_group("Arbitrary Data Recievers", "recieve_arbitrary_data", "player matrix", global_transform)
	
	pass


func _input(event):
	if (event is InputEventKey or event is InputEventJoypadMotion):
		movement_vector = Input.get_vector("move_left","move_right","move_down","move_up")
		self.point_vector = Input.get_vector("point_left","point_right","point_down","point_up")
#	if event is InputEventAction:
#		if event.action in ["point_left","point_right","point_up","point_down"]:
#			self.point_vector = Input.get_vector("point_left","point_right","point_down","point_up")
	pass
