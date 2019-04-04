extends Control


func _on_Start_game_pressed():
	get_tree().change_scene("res://Levels//Level 1//L1.tscn")


func _on_Quit_game_pressed():
	get_tree().quit()
