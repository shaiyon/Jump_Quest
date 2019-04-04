extends KinematicBody2D

# Declare member variables 
const UP = Vector2(0, -1)
const SPEED = 250
const GRAVITY = 25
const JUMP = 700
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
#func _ready():

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	
	# Basic movement 
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED 
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_down"):
		motion.x = 0
	else: 
		motion.x = 0
	
	# 
	if is_on_floor():
		motion.y = 0
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP
	
	motion = move_and_slide(motion, UP)
