extends Control


func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Level/level.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_SkinButton_skin_changed(index: int):
	global.skin = index + 1
