extends PhysicsDice

export(Texture) var testing_texture
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	face_normals = [Vector3(0.8506508469581604, -1.700621687916737e-08, -0.525731086730957),
					Vector3(0.8506508469581604, -8.503108439583684e-09, 0.525731086730957),
					Vector3(-0.525731086730957, 0.8506508469581604, 8.503108439583684e-09),
					Vector3(0.525731086730957, 0.8506508469581604, 1.700621687916737e-08),
					Vector3(-8.503108439583684e-09, -0.525731086730957, -0.8506508469581604),
					Vector3(-1.700621687916737e-08, 0.525731086730957, -0.8506508469581604),
					Vector3(8.503108439583684e-09, -0.525731086730957, 0.8506508469581604),
					Vector3(1.700621687916737e-08, 0.525731086730957, 0.8506508469581604),
					Vector3(-0.525731086730957, -0.8506508469581604, -8.503108439583684e-09),
					Vector3(0.525731086730957, -0.8506508469581604, -1.700621687916737e-08),
					Vector3(-0.8506508469581604, 0.0, -0.525731086730957),
					Vector3(-0.8506508469581604, 8.503108439583684e-09, 0.525731086730957)
					]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	get_tree().call_group("Arbitrary Data Recievers", "recieve_arbitrary_data", "d12 Rolled Face", get_rolled_face())
#	var curve = Curve.new()
#	pass
