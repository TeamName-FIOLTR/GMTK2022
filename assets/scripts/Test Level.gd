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
