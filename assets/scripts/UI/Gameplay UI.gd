extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_max_health = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var todays_random_number = randi()
	$random.text = "Today's random number is %s"%todays_random_number
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func recieve_player_health(health):
	$Health/VBoxContainer/Bar/ColorRect.anchor_right = health/player_max_health
	$Health/VBoxContainer/Text/Label.text = "Health: %4.1f"%health

func recieve_player_max_health(max_health):
	player_max_health = max_health
