extends Entity


export(Vector2) var movement_vector
export(Vector2) var point_vector setget set_point_vector
export(float) var speed = 10

func set_point_vector(n_vector : Vector2):
	point_vector = n_vector.normalized()
	if not is_inside_tree(): yield()
	rotation_degrees.y = atan2(point_vector.z,point_vector.x)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
#	apply_central_impulse(Vector3(movement_vector.x,0,-movement_vector.y)*delta*speed)
	linear_velocity = Vector3(movement_vector.x,0,-movement_vector.y)*speed
	pass


func _input(event):
	if (event is InputEventKey or event is InputEventJoypadMotion):
		movement_vector = Input.get_vector("move_left","move_right","move_down","move_up")
	if event is InputEventAction:
		if event.action in ["point_left","point_right","point_up","point_down"]:
			self.point_vector = Input.get_vector("point_left","point_right","point_down","point_up")
	pass
