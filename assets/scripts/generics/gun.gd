extends Spatial
#this class contains all of the logic and stats that every gun would use

class_name Gun


export(NodePath) var raycast_path : NodePath
onready var raycast : RayCast = get_node(raycast_path)

export(NodePath) var container_path : NodePath
var container

func get_collider()->Object:
	return raycast.get_collider()

var cool_down_time : float = 1.0 setget set_cool_down_time, get_cool_down_time
func set_cool_down_time(val : float)->void:
	cool_down_time = val
	$cool_down.wait_time = cool_down_time
func get_cool_down_time()->float:
	return $cool_down.wait_time

var fire_range : float = 1.0

func _ready():
	$cool_down.wait_time = cool_down_time
	
	if container_path:
		container = get_node(container_path)
	else:
		container = get_parent()

#alerts the parent of a collision
func alert_hit(col):
	container.hit_target(col)

#called when we want to shoot, inteanded to be
#overloaded by the child class
func fire():
	var col = get_collider()
	if col:
		container.hit_target(col)

#turns on sights for aiming
func aim():
	pass

#called when the user wants to input fire
func input_fire():
	if $cool_down.time_left == 0:
		fire()
		$cool_down.start()

var do_fire : bool = false
var do_aim : bool = false

export(bool) var player_controled : bool = false

func _process(delta):
	if do_fire or (player_controled and Input.is_action_pressed("fire")):
		input_fire()
	elif do_aim or (player_controled and Input.is_action_pressed("aim")):
		aim()
	else:
		self.visible = false
