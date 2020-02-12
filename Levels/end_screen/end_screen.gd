extends Control

func _on_Title_screen_pressed():
	get_tree().change_scene("res://Levels/title_screen/title_screen.tscn")

func _on_Quit_pressed():
	get_tree().quit()
