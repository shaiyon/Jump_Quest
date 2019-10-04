extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start_loc = $Player.position
	$Player.fall_reset = 4000
	$Player.fall_threshold = 1000
	$Player/Sprite.play("Idle{0}".format([global.skin]))	
	global.level = 1
