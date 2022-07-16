extends EnemyHWalker
#this is a simple enemy class that follows the player

class_name EnemyFollower

var player : Player

#evil acceleration hack
#so we can remove forces
var acceleration : float = 100
var terminal_velocity : float = 20

func _ready():
	#yes this is clunky, but it grabs the player
	#and im TIRED
	player = get_tree().get_nodes_in_group("player")[0]
	$phys_dice.linear_damp = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if $phys_dice.get_rolling():
		$phys_dice.linear_velocity += (player.global_transform.origin-global_transform.origin).normalized()*acceleration*delta
		if $phys_dice.linear_velocity.length() > terminal_velocity:
			$phys_dice.linear_velocity = $phys_dice.linear_velocity.normalized()*terminal_velocity
