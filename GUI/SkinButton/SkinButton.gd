tool
extends Button
signal skin_changed

const SKINS: Array = [
	preload("res://Player/Sprites/Skin 1/p3_stand.png"),
	preload("res://Player/Sprites/Skin 2/p2_stand.png"),
	preload("res://Player/Sprites/Skin 3/p1_stand.png")
]

export(int, "Red", "Blue", "Green") var skin: int = 0 setget set_skin, get_skin

func _ready():
	set_skin(skin)

func set_skin(index: int):
	if index != skin:
		skin = (index % SKINS.size()) if index >= 0 else 0
		$CenterContainer/TextureRect.texture = SKINS[skin]
		emit_signal("skin_changed", skin)

func get_skin() -> int:
	return skin

func _on_SkinButton_pressed():
	set_skin(skin + 1)

func _on_SkinButton_mouse_entered():
	modulate = Color("#888")

func _on_SkinButton_mouse_exited():
	modulate = Color.white
