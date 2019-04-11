extends Node2D

# Level designed by Alessio Del Duca 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start_loc = $Player.position
	$Player.fall_reset = 4000
	$Player.fall_anim = 1000
	global.level = 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
