extends KinematicBody2D

var direction = 1
var velocity = Vector2()
var counter = 0
var amp = 1/30
var vert_speed = 300
var counter_threshold = 440
const SPEED = 80

func _physics_process(delta):

	# Move in cos wave pattern 
	velocity.y = cos(position.x * 1/40) * vert_speed * direction 
	velocity.x = SPEED * direction
	
	# Control direction 
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	# Switch directions if at threshold or next to wall 
	if is_on_wall() || counter > counter_threshold:
		direction *= -1
		counter = 0
	
	counter += 1	
	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		global.hit = true
