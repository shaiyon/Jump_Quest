extends KinematicBody2D

var direction = 1
var velocity = Vector2()
const SPEED = 65

func _physics_process(delta):
	
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	if is_on_wall() || !$RayCast2D.is_colliding():
		direction *= -1
		$RayCast2D.position.x *= -1
	
	velocity = move_and_slide(velocity)
	
	