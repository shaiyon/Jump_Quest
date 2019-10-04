extends Control

func _on_Title_screen_pressed():
	get_tree().change_scene("res://Levels//Title Screen//Title Screen.tscn")

func _on_Quit_pressed():
	get_tree().quit()
