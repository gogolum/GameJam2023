extends CharacterBody2D

#onready variables
@onready var animated_sprite = $AnimatedSprite2D
var canCarry = false
var Carry = false

#constant
const SPEED = 10.0
func _ready():
	$PickUpLabel.visible = false

func _process(delta):
	if $PickUpDetectArea.get_overlapping_areas() and Carry == false:
		canCarry = true
		$PickUpLabel.visible = true
	else:
		canCarry = false
		$PickUpLabel.visible = false
	
	if  Input.is_action_just_pressed("interact"):
		Carry = false
		Global.coin +=1
	
	if canCarry == true and Input.is_action_just_pressed("interact"):
		Carry = true
	
	if Carry:
		$PickUpDetectArea.get_overlapping_areas()[0].position = global_position
		canCarry = false




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


