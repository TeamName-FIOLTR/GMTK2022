extends Spatial
#this class contains all of the logic and stats that every gun would use

class_name Gun

var cool_down_time : float = 1.0 setget set_cool_down_time, get_cool_down_time
func set_cool_down_time(val : float)->void:
	cool_down_time = val
	$cool_down.wait_time = cool_down_time
func get_cool_down_time()->float:
	return $cool_down.wait_time

var fire_range : float = 1.0

func _ready():
	$cool_down.wait_time = cool_down_time

#alerts the parent of a collision
func alert_hit(col):
	get_parent().hit_target(col)

#called when we want to shoot, inteanded to be
#overloaded by the child class
func fire():
	pass

#turns on sights for aiming
func aim():
	pass

#called when the user wants to input fire
func input_fire():
	if $cool_down.time_left == 0:
		fire()
		$cool_down.start()

func _input(event):
	if Input.is_action_pressed("fire"):
		input_fire()
	elif Input.is_action_pressed("aim"):
		aim()
	else:
		self.visible = false
