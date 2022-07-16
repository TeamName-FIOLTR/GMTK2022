extends Camera
#this is a camera that follows the players x and z position
#as desired
export(NodePath) var player_path : NodePath
onready var player : BootstrapPlayer = get_node(player_path)

export(float) var camera_snap : float = 3.0
export(float) var x_follow_threshold : float = 2.0
export(float) var z_follow_threshold : float = 2.0

func _process(delta):
	var diff : Vector3 = player.get_player_global_position()
	diff.y = global_transform.origin.y
	#only do the interpolation when the player moves two far
	if abs(diff.x - global_transform.origin.x) > x_follow_threshold:
		var buff = diff
		buff.z = global_transform.origin.z
		global_transform.origin = global_transform.origin.linear_interpolate(buff,camera_snap*delta)
	if abs(diff.z - global_transform.origin.z) > z_follow_threshold:
		var buff = diff
		buff.x = global_transform.origin.x
		global_transform.origin = global_transform.origin.linear_interpolate(buff,camera_snap*delta)
		
