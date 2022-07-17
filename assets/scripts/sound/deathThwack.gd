extends AudioStreamPlayer3D

#actually remove the effect after it plays
func _on_death_timer_timeout():
	queue_free()
