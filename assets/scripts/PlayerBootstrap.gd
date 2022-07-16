extends Spatial

class_name BootstrapPlayer

export(NodePath) var camera : NodePath

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func get_player_global_position()->Vector3:
	return $Player.global_transform.origin

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.cam = get_node(camera)
	$Player/ObjectSpawner.spawn_end = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
