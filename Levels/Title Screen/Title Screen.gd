extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Levels//Level 1//L1.tscn")
	
func _on_Change_skin_pressed():
	# Cycle through 3 skins 
	global.skin += 1
	if global.skin > 3:
		global.skin = 1
	# Change text of button to show current skin
	$CenterContainer/VBoxContainer/Change_skin.set_text("Change skin (skin {0})".format([global.skin]))
	
func _on_Quit_pressed():
	get_tree().quit()


