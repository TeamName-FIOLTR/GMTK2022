extends AnimatedSprite3D

#this script controls the animation player running the dice characters face


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite3D_animation_finished():
	match animation:
		"roll":
			stop()
