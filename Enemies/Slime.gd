extends KinematicBody2D

var direction = 1
var velocity = Vector2()
const SPEED = 65

func _physics_process(delta):
	
	velocity.x = SPEED * direction
	
	# Control direction 
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	# Switch directions if next to an edge or wall 
	if is_on_wall() || !($Ledge.is_colliding()):
		direction *= -1
		$Ledge.position.x *= -1
	
	# Check for collision with the player 
	velocity = move_and_slide(velocity)

# 
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		global.hit = true