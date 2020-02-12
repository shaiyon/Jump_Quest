extends Node

var num_platforms
var initial_platform_size
var max_platform_size
var last_platform_location = Vector2()

func _init():
	initial_platform_size = randi() % 13 + 6
	max_platform_size = randi() % 12 + 6
	num_platforms = randi() % 18 + 10
	generate_platform(Vector2(0, 0))
	for i in range(0, num_platforms):
		var new_platform_location = generate_new_location(last_platform_location)
		generate_platform(new_platform_location)
	
	
func generate_platform(location):
	

func generate_new_location(last_location):
	var orientation = 1
	# New platform is to the left of last platform with prob 0.3
	if randf() < 0.3:
		orientation = -1
	var new_x = last_location.x + floor(rand_range(150, 410))
	var new_y = (last_location.y + floor(rand_range(400, 850)) - (1/2 * 30)) * orientation
	return Vector2(new_x, new_y)
