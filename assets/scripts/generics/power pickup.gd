extends Spatial

#this class holds a power for the player to pick up
class_name PowerPickup

export(int) var dice_increase : int = 6

var power : DicePower = null
var power_array : Array = []

export (float) var bright : float = 10.0 setget set_bright, get_bright
func set_bright(val : float)->void:
	bright = val
	#if $art:
	#$art.get_child(0).get_child(0).material.shader_param("Brightness",bright)
func get_bright()->float:
	return bright

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("on_start")
	power_array = []
	for node in get_children():
		if node is DicePower:
			power = node
			power_array += [node]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#get's a random power (wowzers)
func get_random_power():
	var power_count = len(power_array)
#	rand_seed()
	var index = randi()%power_count
	return power_array[index]

#true if we are giving a power
var giving = null
func _on_Area_body_entered(body):
	if body is Player and not is_instance_valid(giving):
		$AnimationPlayer.play("pickup")
		giving = body


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"pickup":
			giving.ask_power(get_random_power(),dice_increase)
			queue_free()
