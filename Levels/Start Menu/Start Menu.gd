extends Control


func _on_Start_pressed():
	get_tree().change_scene("res://Levels//Level 1//L1.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Change_skin_pressed():
	global.skin += 1
