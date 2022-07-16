extends Spatial

#this class holds a power for the player to pick up
class_name PowerPickup

export(int) var dice_increase : int = 6

var power : DicePower = null

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
	for node in get_children():
		if node is DicePower:
			power = node


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#true if we are giving a power
var giving = null
func _on_Area_body_entered(body):
	if not is_instance_valid(giving):
		$AnimationPlayer.play("pickup")
		giving = body


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"pickup":
			giving.ask_power(power,dice_increase)
			queue_free()
