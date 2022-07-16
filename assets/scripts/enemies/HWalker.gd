extends Enemy
#this script is a dice enemy that walks back and forth
#and occasionally shoots the player
class_name EnemyHWalker
var just_left : bool = false

onready var starting_velocity = $phys_dice.linear_velocity

func _ready():
	$art/gun.do_aim = true

func _on_VisibilityNotifier_camera_exited(camera):
	if not just_left:
		$phys_dice.linear_velocity *= -1

func _on_phys_dice_body_entered(body):
	$phys_dice.linear_velocity *= -1

func _process(delta):
	if $art/gun.get_collider():
		$art/gun.do_fire = true
	else:
		$art/gun.do_fire = false

func take_damage(amount : int, source :Node)->void:
	$phys_dice.snap_normal()
	$phys_dice.lock_roll = false
	.take_damage(amount,source)
