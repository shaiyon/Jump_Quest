
const LEVEL_HEIGHT = 100
const LEVEL_WIDTH = 200

var map = []

class TileInfo:
	var unblocked_start
	var unblocked_end

func _init():
	for tile_x in range(0, LEVEL_WIDTH):
		map.append([])
		var column = map.back()
		for tile_y in range(0, LEVEL_HEIGHT):
			column.append(TileInfo.new())
			
func generate():
	for i in range(0, LEVEL_HEIGHT * LEVEL_WIDTH):
		var x = randi() % LEVEL_WIDTH
		var y = randi() % LEVEL_HEIGHT
		map[x][y].platform_until = randi() % 100