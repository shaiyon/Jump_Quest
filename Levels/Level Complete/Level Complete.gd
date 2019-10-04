extends Area2D
# Transitions between levels 

# Variables
var next_level = "res://Levels//Level {0}//L{0}.tscn"
var end_screen = "res://Levels//End Screen//End Screen.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Change scene when touching player
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			# Change scene to next level 
			if global.level != global.max_level:
				get_tree().change_scene(next_level.format([global.level+1]))
			# Change scene to end screen 
			else:
				get_tree().change_scene(end_screen)

			
