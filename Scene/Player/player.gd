extends CharacterBody2D

#onready variables
@onready var animated_sprite = $AnimatedSprite2D
var canCarry = false
var Carry = false
var carried : Area2D
var  changed_scale = false

#constant
var speed = 1000
var acceleration = 800
var deceleration = 200
var axis = Vector2.ZERO

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
	
	if canCarry == true and Input.is_action_just_pressed("interact"):
		Carry = true
	
	if Carry:
		if $PickUpDetectArea.get_overlapping_areas()[0].ismat:
			if !$PickUpDetectArea.get_overlapping_areas()[0].isBought and $PickUpDetectArea.get_overlapping_areas()[0].mat_price > Global.coin:
				Carry = false
	if Carry:
		$PickUpDetectArea.get_overlapping_areas()[0].position = global_position
		carried = $PickUpDetectArea.get_overlapping_areas()[0]
		canCarry = false


func _physics_process(delta):
	#directions, flip sprite
	axis.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	axis.y = Input.get_action_strength("down")-Input.get_action_strength("up")
		
	axis = axis.normalized() * speed

	velocity = velocity.lerp(axis, 0.1)
	if abs(velocity.x) > 250 :
		$AnimatedSprite2D/AnimationPlayer.play('Walk')
	else:
		$AnimatedSprite2D/AnimationPlayer.play('Idle')
	if Input.is_action_pressed("left"):
		if (!changed_scale):
			scale.x=-3.0
			changed_scale=true
	elif Input.is_action_pressed("right"):
		if (changed_scale):
			scale.x=-3.0
			changed_scale=false
	move_and_slide()


