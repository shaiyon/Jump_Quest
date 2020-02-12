extends KinematicBody2D

# Variables
var velocity = Vector2()
var start_loc = Vector2(0,-100)
var isdead = false
var fall_reset = 8000
var fall_threshold = 4000
var canmove = true
var direction = 1
var time_multiplier = 1.0
# Constants 
const UP = Vector2(0, -1)
const GRAVITY = 30
const FRICTION = 0.08
const WALL_FRICTION = 0.3
const AIR_RESISTANCE = 0.05
const ACCELERATION = 28
const SPEED = 410
const JUMP = 930

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Graviy 
	velocity.y += GRAVITY
	  
	# Move right 
	if Input.is_action_pressed("ui_right") && canmove:
		# Acceleration 
		velocity.x = min(velocity.x+ACCELERATION * time_multiplier, SPEED * time_multiplier) 
		# Walk right animation 
		$Sprite.flip_h = false
		direction = 1
		$Sprite.play("Walk{0}".format([global.skin]))
	# Move left 
	elif Input.is_action_pressed("ui_left") && canmove:
		# Acceleration 
		velocity.x = max(velocity.x-ACCELERATION * time_multiplier, -SPEED * time_multiplier)
		# Walk left animation 
		$Sprite.flip_h = true
		direction = -1
		$Sprite.play("Walk{0}".format([global.skin]))
	# Idle animation 
	else:
		$Sprite.play("Idle{0}".format([global.skin]))
		
	# Pause menu
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused =  !get_tree().paused
	
	if !isdead:
		# Jump 
		if Input.is_action_just_pressed("ui_up") && !(is_on_ceiling()):
			velocity.y = -JUMP * time_multiplier
		# Friction 
		velocity.x = lerp(velocity.x, 0, FRICTION)
		canmove = true
	# Fall animation 
	elif position.y < fall_threshold:
		canmove = false
	else:
		# Jump animation 
		$Sprite.play("Jump{0}".format([global.skin]))
		# Air resistance 
		velocity.x = lerp(velocity.x, 0, AIR_RESISTANCE)
	
	if !canmove:
		$Sprite.play("Fall{0}".format([global.skin]))
		
	# Slow down significantly while on ceiling or wall
	if (is_on_ceiling() || is_on_wall()) && velocity.y < 0:
		velocity.y = lerp(velocity.y, 0, WALL_FRICTION)
	
	# Die when below reset threshold 		
	if position.y > fall_reset:
		isdead = true
 
	if isdead:
		death_reset()
	
	if global.hit:
		enemy_collide()
		global.hit = false
	
	velocity = move_and_slide(velocity, UP)
	
func enemy_collide():
	var air_direction = 0
	if velocity.y > 0:
		air_direction = 1
	if velocity.y < 0:
		air_direction = -1
	# Knockback
	velocity.x = (-direction * 2700) + (-direction * velocity.y)
	velocity.y = (-velocity.y / 6) + (-air_direction * 500)
	# Timer to disable movement after collision 
	$KnockbackTimer.start()
	canmove = false
	
func death_reset():
	set_position(start_loc)
	velocity = Vector2(0,0)
	global.deaths += 1
	$GUI/PanelContainer2/Deaths.set_text("Deaths: {0}".format([global.deaths]))
	isdead = false
	canmove = true

func _on_Timer_timeout():
	canmove = true
