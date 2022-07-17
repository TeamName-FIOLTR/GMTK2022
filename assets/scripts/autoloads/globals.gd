extends Node
#this is the global script that 
#contains global variables
var enemy_count : int = 0
const MAX_ENEMY_COUNT = 50

var score : int = 1 setget set_score,get_score
func set_score(val : int)->void:
	score = val
	$"Gameplay UI/score/Label".text = "Score: " + str(score)
func get_score()->int:
	return score
