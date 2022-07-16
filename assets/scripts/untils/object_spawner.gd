extends Spatial

#spawns the given objects into the game
#in a planar radius with the object spawner
class_name ObjectSpawner

export(Array,PackedScene) var objects : Array
export(float) var radius
export(NodePath) var spawn_end_path : NodePath
onready var spawn_end = get_node(spawn_end_path)

func spawn_object()->void:
	#all work is done in local space
	#and then exported to global at the end of the process
	var to_spawn = objects[randi()%len(objects)]
	var rad = sqrt(2.0*randf()*radius) #function whose derivative is itself :D
	var angle = randf()*3.14159*2
	
	var local_position = Vector3(cos(angle),0,sin(angle))*rad
	
	var inst = to_spawn.instance()
	
	spawn_end.add_child(inst)
	
	if inst is Spatial:
		inst.global_transform.origin = global_transform*transform*local_position


func _on_enemy_spawn_timer_timeout():
	spawn_object()
