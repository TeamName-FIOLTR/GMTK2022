extends Entity
#this represents the main player class of the game

class_name Player

export(NodePath) var camera_path : NodePath
onready var cam : Camera = get_node(camera_path)
export(NodePath) var lazer_path : NodePath
onready var lazer : Lazer = get_node(lazer_path)
export(NodePath) var dice_display_label_path : NodePath
onready var dice_label : Label = get_node(dice_display_label_path) as Label

export(Vector2) var movement_vector
export(Vector2) var point_vector setget set_point_vector
export(float) var speed = 10


export(Vector3) var linear_velocity : Vector3

export (bool) var y_lock : bool = true

export(float) var health = 100 setget set_health
export(float) var max_health = 100 setget set_max_health
export(float) var healing_multiplier = 1
export(float) var damaging_multiplier = 1

func set_health(n_health):
	health = n_health
	get_tree().call_group("Player Status Recievers", "recieve_player_health", health)
	check_death()

func set_max_health(n_max):
	health = n_max
	get_tree().call_group("Player Status Recievers", "recieve_player_max_health", max_health)



var y_lock_val : float = 0.0

func _ready()->void:
	dice_label.text = dice_container.get_dice_container_str()
	add_to_group("player")
	if y_lock:
		y_lock_val = translation.y
	Globals.score = 0
#is true if the mouse is in the game
var mouse_in : bool = true

func set_point_vector(n_vector : Vector2):
	point_vector = n_vector.normalized()
	if not is_inside_tree(): yield()
	rotation_degrees.y = atan2(point_vector.z,point_vector.x)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
#	apply_central_impulse(Vector3(movement_vector.x,0,-movement_vector.y)*delta*speed)
#	rotation.y = -point_vector.angle()
	
	linear_velocity = Vector3(movement_vector.x,0,-movement_vector.y)*speed
	

	var joy_vector : Vector2 = Input.get_vector("point_left","point_right","point_up","point_down")
	
	if joy_vector.length_squared() > 0.9:
			point_vector = joy_vector
	elif mouse_in:
		look_at_mouse()
	elif linear_velocity.length_squared() > 0.9:
		point_vector = Vector2(linear_velocity.x,linear_velocity.z)

	if not Input.is_action_pressed("deny_rotation"):
		rotation.y = -atan2(point_vector.y,point_vector.x)
	
	#look_at(global_transform*transform.affine_inverse()*Vector3(point_vector.x,0,point_vector.y),global_transform*transform.affine_inverse()*Vector3(0,1,0))
	move_and_collide(linear_velocity*delta)
	
	if y_lock:
		translation.y = y_lock

func look_at_mouse()->void:
	var cam_target = cam.project_ray_normal(get_viewport().get_mouse_position())
		
	var collision_plane = Plane.PLANE_XZ
	collision_plane.d = 0
		
		
	var target_point = collision_plane.intersects_ray(cam.translation,cam_target.normalized())
		
	target_point = transform*global_transform.affine_inverse()*target_point - translation
		
		
		
	point_vector.x = target_point.x
	point_vector.y = target_point.z

#control wether or not the mouse is in the screen
func _notification(what):
	match what:
		NOTIFICATION_WM_MOUSE_ENTER:
			mouse_in = true
		NOTIFICATION_WM_MOUSE_EXIT:
			mouse_in = false

func _input(event):
	if (event is InputEventKey or event is InputEventJoypadMotion):
		movement_vector = Input.get_vector("move_left","move_right","move_down","move_up")

func hit_target(target):
	target = target.get_parent()
	if target.has_method("take_damage"):
		var delt_damage = dice_container.roll()
		target.take_damage(delt_damage,self)
		get_tree().call_group("Player Status Recievers", "recieve_player_deals_damage", delt_damage)

#actually takes the power
func take_power(power : DicePower,damage_up : int)->void:
	power.enabled = true
	add_child(power)
	
	dice_container.add_dice_from_number(damage_up,self)
#sets up the ui to ask if we want to take the power
func ask_power(power : DicePower,damage_up : int)->void:
	#query the user wether or not they want to confirm
	#this power
	if power.get_parent():
		power.get_parent().remove_child(power)
	$"Power Title".dice_power = power
	$"Power Title".damage_increase = damage_up
	$"Power Title".visible = true

func check_death():
	if health <= 0:
		DEATH()

func DEATH():
	$"Power Title".visible = false
	get_tree().call_group("Player Death Recievers", "recieve_player_death")
	get_tree().call_group("Player Status Recievers", "recieve_player_death")
	Globals.player_alive = false

func take_damage(damage):
#	print("took ", damage, " damage")
	self.health -= damage*damaging_multiplier
	get_tree().call_group("Player Status Recievers", "recieve_player_takes_damage", damage)

func heal(amount):
	self.health += amount*healing_multiplier
	get_tree().call_group("Player Status Recievers", "recieve_player_heals", amount)


func _on_DiceContainer_on_dice_add():
	dice_label.text = dice_container.get_dice_container_str()


func _i_is_player():
	pass #Literally just here because "OOoOoo CyCLIcAl REfErANCe OoOoooO"
		#Imagine unironically being able to check if something is also the same class
		#Unreal do be looking kinda compitent tho í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€í ½í±€0_0


func _on_survival_timer_timeout():
	Globals.score += 1
	$ObjectSpawner/enemy_spawn_timer.wait_time -= 0.5
	if $ObjectSpawner/enemy_spawn_timer.wait_time < 0.3:
		$ObjectSpawner/enemy_spawn_timer.wait_time = 0.3
