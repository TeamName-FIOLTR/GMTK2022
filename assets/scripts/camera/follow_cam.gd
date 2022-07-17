extends Camera
#this is a camera that follows the players x and z position
#as desired
export(NodePath) var player_path : NodePath
onready var player : BootstrapPlayer = get_node(player_path)

export(float) var camera_snap : float = 3.0
export(float) var x_follow_threshold : float = 2.0
export(float) var z_follow_threshold : float = 2.0
export(float) var shake_amount = 0.1
export(float) var shaking_amount = 0

func _process(delta):
	var player_pos : Vector3 = player.get_player_global_position()
	var diff = player_pos - global_transform.origin
#	diff.y = global_transform.origin.y
	player_pos.y = global_transform.origin.y
	#only do the interpolation when the player moves two far
	var over_x = abs(diff.x)-x_follow_threshold
	var over_z = abs(diff.z)-z_follow_threshold
	if abs(diff.x) > x_follow_threshold:
		var buff = player_pos
		buff.z = global_transform.origin.z
		global_transform.origin = global_transform.origin.linear_interpolate(buff,camera_snap*delta*over_x)
	if abs(diff.z) > z_follow_threshold:
		var buff = player_pos
		buff.x = global_transform.origin.x
		global_transform.origin = global_transform.origin.linear_interpolate(buff,camera_snap*delta*over_z)
	if shaking_amount >= 0.1:
		var randius = sqrt(2.0*(randf()))
		var rangle = 2*PI*randf()
		var offset_vec = randius*Vector3(cos(rangle),0,sin(rangle))
		shaking_amount = lerp(shaking_amount,0,5*delta)
		global_transform.origin.x += offset_vec.x*shaking_amount
		global_transform.origin.z += offset_vec.y*shaking_amount

func recieve_player_takes_damage(damage):
	shaking_amount += shake_amount*damage/3
