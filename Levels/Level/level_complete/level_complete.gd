extends Area2D
# Transitions between levels 

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		# Change scene to next level 
		if global.level != global.max_level:
			randomize()
			get_tree().change_scene("res://Levels/level/level.tscn")
		# Change scene to end screen 
