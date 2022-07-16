extends Gun

#this class is a lazer... what did you expect

#IM FIREING MY LAZERS!!!!

class_name Lazer
export var time : float setget set_time,get_time



export(Color) var color : Color setget set_color,get_color

func set_color(val : Color)->void:
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
	$CSGMesh2/RayCast.collision_mask = collision_mask
	print(original_length)

func set_time(val : float)->void:
	time = val
	$CSGMesh2.mesh.material.set_shader_param("time",val)

func get_time()->float:
	return time

func _process(delta):
	if not Engine.editor_hint:
		if $CSGMesh2/RayCast.is_colliding():
			var dist = global_transform.origin.distance_to($CSGMesh2/RayCast.get_collision_point())
			if dist < original_length:
				self.length = dist
		else:
			self.length = original_length
	get_tree().call_group("Arbitrary Data Recievers", "recieve_arbitrary_data", "lazer do be hit this", get_collider())

#attempt to actually hit somthing
func fire()->void:
	visible = true
	self.color = Color.cyan
	if self.get_node("AnimationPlayer").current_animation != "fire_main":
		self.get_node("AnimationPlayer").play("fire_main")
	.fire()

#toggle aim mode
func aim()->void:
	self.get_node("AnimationPlayer").play("RESET")
	self.visible = true
	self.color = Color.red
	.aim()
