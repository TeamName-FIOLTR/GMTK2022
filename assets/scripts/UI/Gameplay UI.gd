extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_max_health = 100.0
export(float) var timey_scale = 1 setget set_timey_scale

func set_timey_scale(n_scale):
	timey_scale = n_scale
	Engine.time_scale = timey_scale


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

func recieve_player_death():
#	Engine.time_scale = 0.2
	$DEATH.visible = true
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("DEATH")
	$"DEATH/CenterContainer/VBoxContainer/RETRY BUTTON".grab_focus()


func _on_RETRY_BUTTON_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_EXIT_BUTTON_pressed():
	get_tree().quit()
	pass # Replace with function body.



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "DEATH":
		Engine.time_scale = 1
		get_tree().paused = true
	pass # Replace with function body.

func _input(event):
	if (event.is_action_pressed("pause") or event.is_action_pressed("ui_cancel")) and $DEATH.visible:
		get_tree().quit()
#	if event.is_action_pressed()
