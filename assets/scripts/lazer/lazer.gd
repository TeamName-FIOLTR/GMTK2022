tool
extends Gun

#this class is a lazer... what did you expect

#IM FIREING MY LAZERS!!!!

class_name Lazer
export var time : float setget set_time,get_time

export(Color) var color : Color setget set_color,get_color

func set_color(val : Color)->void:
	print("SETTING COLOR")
	$CSGMesh2.mesh.material.set_shader_param("color",Vector3(val.r,val.g,val.b))
	color = val
func get_color()->Color:
	return color 


#convienence function to get the length of the lazer
export var length : float = 1 setget set_length, get_length
func set_length(val : float)->void:
	scale.x = val
	if Engine.editor_hint:
		original_length = val
func get_length()->float:
	return scale.x

var original_length : float

func _ready():
	original_length = scale.x
	print(original_length)

func get_collider()->Object:
	return $CSGMesh2/RayCast.get_collider()
func set_time(val : float)->void:
	time = val
	$CSGMesh2.mesh.material.set_shader_param("time",val)

func get_time()->float:
	return time

func _process(delta):
	if not Engine.editor_hint:
		if $CSGMesh2/RayCast.is_colliding():
			self.length = global_transform.origin.distance_to($CSGMesh2/RayCast.get_collision_point())
		else:
			self.length = original_length

#attempt to actually hit somthing
func fire()->void:
	visible = true
	self.color = Color.cyan
	if self.get_node("AnimationPlayer").current_animation != "fire_main":
		self.get_node("AnimationPlayer").play("fire_main")
	var col = get_collider()
	if col:
		get_parent().hit_target(col)

#toggle aim mode
func aim()->void:
	self.get_node("AnimationPlayer").play("RESET")
	self.visible = true
	self.color = Color.red
