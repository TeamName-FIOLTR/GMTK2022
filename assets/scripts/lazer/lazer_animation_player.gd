extends AnimationPlayer

export var mesh_path : NodePath
onready var mesh : CSGMesh = get_node(mesh_path)

var pew_pew_shader = load("res://assets/shaders/pew_pew_lazer.gdshader")
var rail_shader = load("res://assets/shaders/rail_gun.gdshader")
var flicker_shader = load("res://assets/shaders/lazer_flicker.gdshader")

func play(name : String = "", custom_blend : float = -1, custom_speed: float = 1.0, from_end: bool = false)->void:
	match name:
		"pew pew fire":
			mesh.mesh.material.shader = pew_pew_shader
			
		"fire_main":
			mesh.mesh.material.shader = rail_shader
		_:
			mesh.mesh.material.shader = flicker_shader
	.play(name,custom_blend,custom_speed,from_end)
