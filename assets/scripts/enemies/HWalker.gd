extends Enemy
#this script is a dice enemy that walks back and forth
#and occasionally shoots the player
class_name EnemyHWalker
export(NodePath) var gun_path : NodePath
onready var gun = get_node(gun_path)
 
var just_left : bool = false

onready var starting_velocity = $phys_dice.linear_velocity

func _ready():
	gun.do_aim = true
	$phys_dice.apply_torque_impulse(Vector3(randf(),randf(),randf())*30)

func _on_VisibilityNotifier_camera_exited(camera):
	if not just_left:
		$phys_dice.linear_velocity *= -1

func _on_phys_dice_body_entered(body):
	$phys_dice.linear_velocity *= -1

func _process(delta):
	if gun.get_collider():
		gun.do_fire = true
	else:
		gun.do_fire = false
	if $phys_dice.linear_velocity.length_squared() > 0.1:
		$art/flat_art.rotation.y = -atan2(-$phys_dice.linear_velocity.x,$phys_dice.linear_velocity.z)

func take_damage(amount : int, source : Spatial)->void:
	if $phys_dice.rolled:
		#unlock the roll EXPLOSIVLY
		var collision_vec : Vector3 = ($phys_dice.global_transform.origin - source.global_transform.origin).normalized()*source.lazer.force*10
		$phys_dice.linear_velocity = collision_vec
#		print("EXPLOSION VELOCITY")
#		print($phys_dice.linear_velocity)
		$phys_dice.roll(gun.force*10)
	else:
		$phys_dice.snap_normal()
		$phys_dice.mode = RigidBody.MODE_RIGID
		.take_damage(amount,source)

func hit_target(target):
	if target is Player:
		target.take_damage(gun.damage)

func _on_physics_dice_body_entered(body):
	pass # Replace with function body.


