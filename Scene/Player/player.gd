extends CharacterBody2D

#onready variables
@onready var animated_sprite = $AnimatedSprite2D
var canCarry = false
#constant
const SPEED = 5.0
func _ready():
	$PickUpLabel.visible = false

func _process(delta):
	if $PickUpLabel.visible == true and Input.is_action_just_pressed("interact"):
		canCarry = true
	
	if canCarry == true:
		$PickUpLabel.visible = false
		$PickUpDetectArea.get_overlapping_areas()[0].position = global_position
	if $PickUpLabel.visible == false and Input.is_action_just_pressed("interact"):
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




func _on_pick_up_detect_area_area_entered(area):
	if area.is_in_group("PickUpGrp") :
		$PickUpLabel.visible = true
	
	pass # Replace with function body.


func _on_pick_up_detect_area_area_exited(area):
	if area.is_in_group("PickUpGrp"):
		$PickUpLabel.visible = false
	pass # Replace with function body.
