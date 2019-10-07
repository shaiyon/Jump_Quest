extends KinematicBody2D

var direction = 1
var velocity = Vector2()
var counter = 0
const SPEED = 65
const VERT_SPEED = 40

func _physics_process(delta):
	velocity.y = sin(position.y) * 40 * direction 
	velocity.x = VERT_SPEED
	velocity.x = clamp(velocity.x, -VERT_SPEED, VERT_SPEED)
	
	# Control direction 
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	# Switch directions if next to an edge or wall 
	if is_on_wall() || counter > 400:
		direction *= -1
		counter = 0
	
	counter += 1	
	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		global.hit = true 

