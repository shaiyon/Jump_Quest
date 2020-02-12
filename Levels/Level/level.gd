extends Node

var num_platforms = randi() % 25 + 15
var initial_platform_size = randi() % 13 + 6
var max_platform_size = randi() % 12 + 6
var last_platform_location = Vector2()
const TILE_SIZE = 32
var tileset = "res://Assets/Tilesets/Platforms1"
var LeftTile = preload("res://Assets/Tilesets/Platforms1/LeftTile.tscn")
var RightTile = preload("res://Assets/Tilesets/Platforms1/RightTile.tscn")
var MiddleTile = preload("res://Assets/Tilesets/Platforms1/MiddleTile.tscn")
var OnlyTile = preload("res://Assets/Tilesets/Platforms1/OnlyTile.tscn")      

func _ready():
	randomize()
	generate_platform(Vector2(0,0))
	for i in range(0, num_platforms):
		var new_platform_location = generate_new_location(last_platform_location)
		generate_platform(new_platform_location)
		last_platform_location = new_platform_location
	
	
func generate_platform(location):
	var length = randi() % max_platform_size
	if length == 1:
		var new_tile = OnlyTile.instance()
		new_tile.position.x = location.x
		new_tile.position.y = location.y
		add_child(new_tile) 
	else:
		var maxIndex = length-1	
		for i in range(0, length):
			var new_tile
			match i:
				0:
					new_tile = LeftTile.instance()
				maxIndex:
					new_tile = RightTile.instance()
				_:
					new_tile = MiddleTile.instance()
			new_tile.position.x = location.x + (TILE_SIZE * i)
			new_tile.position.y = location.y
			add_child(new_tile)
		
		

func generate_new_location(last_location):
	var orientation = 1
	# New platform is to the left of last platform with prob 0.3
	if randf() < 0.3:
		orientation = -1
	var new_x = last_location.x + floor(rand_range(150, 200))
	var new_y = (last_location.y + floor(rand_range(100, 500)) - (1/2 * 30)) * orientation
	print(Vector2(new_x, new_y))
	return Vector2(new_x, new_y)

