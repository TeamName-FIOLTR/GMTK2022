extends Spatial

var display_data : Dictionary = {}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_display_data()
#	pass

func update_display_data():
	$Control/Label.text = ""
	var n_str = ""
	for data in display_data.keys():
		n_str += "%s: %s\n"%[data,display_data[data]]
	$Control/Label.text = n_str

func recieve_arbitrary_data(data, value):
	display_data[data] = value
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_SPACE:
			$Player/Player/ObjectSpawner.spawn_object()

func _on_Timer_timeout():
	var n_x = 2*randf()-1
	var n_y = 2*randf()-1
	var d4 = load("res://scenes/dice/Physics d4.tscn").instance()
	var d6 = load("res://scenes/dice/Physics d6.tscn").instance()
	add_child(d4)
	d4.global_transform.origin = Vector3(5*n_x,3,5*n_y)
	d4.play_spawn_anim()
#	(d4 as RigidBody).apply_torque_impulse(30*Vector3(randf(),randf(),randf()))
	(d4 as PhysicsDice).freash_dice = true
	(d4 as PhysicsDice).rolled = false
	
	
	n_x = 2*randf()-1
	n_y = 2*randf()-1
	add_child(d6)
	d6.global_transform.origin = Vector3(5*n_x,3,5*n_y)
	d6.play_spawn_anim()
#	(d4 as RigidBody).apply_torque_impulse(30*Vector3(randf(),randf(),randf()))
	(d6 as PhysicsDice).freash_dice = true
	(d6 as PhysicsDice).rolled = false
	pass # Replace with function body.
