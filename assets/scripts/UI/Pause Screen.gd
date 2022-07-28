extends Control

export(NodePath) var how_2_play_menu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = visible
	$main/VBoxContainer/CONTINUE.grab_focus()
	seed(OS.get_unix_time())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("pause"):
		visible = !visible
		Globals.play_music_when_paused(!visible)
		get_tree().paused = visible
		if (!visible):
			Globals.alert_unpause()
		$main/VBoxContainer/CONTINUE.grab_focus()
		pass
	if event.is_action_pressed("ui_cancel") and visible:
			$main.visible = true
			$credits.visible = false
			$h2p.visible = false
			$main/VBoxContainer/CONTINUE.grab_focus()


func _on_CONTINUE_pressed():
	visible = !visible
	get_tree().paused = visible
	pass # Replace with function body.


func _on_H2P_pressed():
	$main.visible = false
	$credits.visible = false
	$h2p.visible = true
	pass # Replace with function body.


func _on_WHO_DID_THIS_pressed():
	$main.visible = false
	$credits.visible = true
	$h2p.visible = false
	pass # Replace with function body.


func _on_GOOD_bye_pressed():
	get_tree().quit()
	pass # Replace with function body.
