extends KinematicBody2D

# Variables
var velocity = Vector2()
var start_loc
var isdead = false
var fall_reset
var fall_threshold
var canmove = true
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
		velocity.x = min(velocity.x+ACCELERATION, SPEED)
		# Walk right animation 
		$Sprite.flip_h = false
		$Sprite.play("Walk{0}".format([global.skin]))
	# Move left 
	elif Input.is_action_pressed("ui_left") && canmove:
		# Acceleration 
		velocity.x = max(velocity.x-ACCELERATION, -SPEED)
		# Walk left animation 
		$Sprite.flip_h = true
		$Sprite.play("Walk{0}".format([global.skin]))
	# Idle animation 
	else:
		$Sprite.play("Idle{0}".format([global.skin]))	
	
	if is_on_floor() && canmove:
		# Jump 
		if Input.is_action_just_pressed("ui_up") && !(is_on_ceiling() || is_on_wall()):
			velocity.y = -JUMP
		# Friction 
		velocity.x = lerp(velocity.x, 0, FRICTION)
	# Fall animation 
	elif position.y > fall_threshold:
		$Sprite.play("Fall{0}".format([global.skin]))
		canmove = false
	else:
		# Jump animation 
		$Sprite.play("Jump{0}".format([global.skin]))
		# Air resistance 
		velocity.x = lerp(velocity.x, 0, AIR_RESISTANCE)
		
	# Slow down significantly while on ceiling or wall
	if (is_on_ceiling() || is_on_wall()) && velocity.y < 0:
		velocity.y = lerp(velocity.y, 0, WALL_FRICTION)
	
	# Die when below reset threshold 		
	if position.y > fall_reset:
		isdead = true
	
	if isdead:
		set_position(start_loc)
		velocity = Vector2(0,0)
		global.deaths += 1
		isdead = false
		canmove = true
		enemy_death_counter = 0
		
	velocity = move_and_slide(velocity, UP)
	