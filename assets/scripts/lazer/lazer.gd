tool
extends Spatial

#this class is a lazer... what did you expect

#IM FIREING MY LAZERS!!!!

class_name Lazer
export var time : float setget set_time,get_time

#convienence function to get the length of the lazer
export var length : float = 1 setget set_length, get_length
func set_length(val : float)->void:
	scale.x = val
func get_length()->float:
	return scale.x
	
func get_collider():
	return $CSGMesh2/RayCast.get_collider()

func set_time(val : float)->void:
	time = val
	$CSGMesh2.mesh.material.set_shader_param("time",val)
func get_time()->float:
	return time
