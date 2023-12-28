extends CharacterBody2D

#onready variables
@onready var animated_sprite = $AnimatedSprite2D

#constant
const SPEED = 5.0

func _physics_process(delta):

	#directions, flip sprite
	if Input.get_action_strength("left"):
		position.x -= SPEED
		transform.y * (-1)
	if Input.get_action_strength("right"):
		position.x += SPEED
		transform.y * 1
	if Input.get_action_strength("up"):
		position.y -= SPEED
	if Input.get_action_strength("down"):
		position.y += SPEED
	
	move_and_slide()
