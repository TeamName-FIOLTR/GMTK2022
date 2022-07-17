extends Node
#this is the global script that 
#contains global variables
var enemy_count : int = 0
const MAX_ENEMY_COUNT = 50
var smooth_enemy_count : float = 0 setget set_smooth_enemy_count
var player_alive = true
var score : int = 1 setget set_score,get_score
func set_score(val : int)->void:
	score = val
	get_tree().call_group("Player Status Recievers", "recieve_player_score", score)
#	$"Gameplay UI/score/Label".text = "Score: " + str(score)

func set_smooth_enemy_count(n_count):
	smooth_enemy_count = n_count
	if not is_inside_tree(): yield(self, "ready")
	set_music_volumes()

func get_score()->int:
	return score

func _ready():
	$"Big Music".play()
	$base.play()
	$cymbalss.play()
	pass

func get_volume_range(count, start, end):
	return linear2db(clamp(range_lerp(count,start,end,0,1),0,1))
	pass

func set_music_volumes():
	var base_volume = get_volume_range(smooth_enemy_count,1,3)
	var treble_volume = get_volume_range(smooth_enemy_count,3,5)
	var main_volume = get_volume_range(smooth_enemy_count,5,20)
	
	$base.volume_db = base_volume
	$cymbalss.volume_db = treble_volume
	$"Big Music".volume_db = main_volume
	pass

func set_music_pitch():
	var pitchy = Engine.time_scale
	
	if pitchy != $base.pitch_scale:
		$base.pitch_scale = pitchy
		$cymbalss.pitch_scale = pitchy
		$"Big Music".pitch_scale = pitchy
	

func _process(delta):
	self.smooth_enemy_count = lerp(smooth_enemy_count,enemy_count*float(player_alive),delta)
	set_music_pitch()
#	var new_trans = Vector2(0,0)
#	new_trans.linear_interpolate()
	
