extends AnimationPlayer

export var mesh_path : NodePath
onready var mesh : CSGMesh = get_node(mesh_path)

enum LAZER_SHADER_MODES {
	FLICKER,
	SCALE_WITH_TIME,
	PEW_PEW
}
func play(name : String = "", custom_blend : float = -1, custom_speed: float = 1.0, from_end: bool = false)->void:
	match name:
		"pew pew fire":
			mesh.mesh.material.set_shader_param("mode",LAZER_SHADER_MODES.PEW_PEW)
			
		"fire_main":
			mesh.mesh.material.set_shader_param("mode",LAZER_SHADER_MODES.SCALE_WITH_TIME)
		_:
			mesh.mesh.material.set_shader_param("mode",LAZER_SHADER_MODES.FLICKER)	
	.play(name,custom_blend,custom_speed,from_end)
