extends Popup

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.isdead:
		popup(Rect2(50,50,50,50))


