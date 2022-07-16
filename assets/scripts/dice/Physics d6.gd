extends PhysicsDice



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	face_normals = [Vector3(0.0, -1.0, -0.0),
					Vector3(-1.0, 0.0, 0.0),
					Vector3(0.0, 0.0, 1.0),
					Vector3(0.0, 0.0, -1.0),
					Vector3(1.0, 0.0, 0.0),
					Vector3(0.0, 1.0, 0.0),
					]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_tree().call_group("Arbitrary Data Recievers", "recieve_arbitrary_data", "d6 Rolled Face", get_rolled_face())
#	pass
