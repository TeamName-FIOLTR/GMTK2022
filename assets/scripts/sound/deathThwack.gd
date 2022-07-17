extends AudioStreamPlayer3D

func _ready():
	$Particles.emitting = true
#actually remove the effect after it plays
func _on_death_timer_timeout():
	queue_free()
