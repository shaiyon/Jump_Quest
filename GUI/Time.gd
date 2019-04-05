extends Label

#Timer by volzhs from https://godotengine.org/qa/3641/how-display-elapsed-time-in-game
var time_start = 0
var time_now = 0

func _ready():
	time_start = OS.get_unix_time()
	set_process(true)

func _process(delta):
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	var time_elapsed = "%02d : %02d" % [minutes, seconds]
	set_text(time_elapsed)
	print(time_elapsed)