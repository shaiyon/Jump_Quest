extends Label

func _on_Timer_timeout():
	global.levelTime += 1
	var seconds = global.levelTime % 60
	var minutes =  global.levelTime % 3600 / 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	set_text(str(str_elapsed))
