extends Node2D

@onready var traderLabel: Label = $"Press space to reroll for 5"

signal rerollShop
# Called when the node enters the scene tree for the first time.
func _ready():
	$DetectZone/AnimatedSprite2D/AnimationPlayer.play('Idle')
	traderLabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if traderLabel.visible and Input.is_action_just_pressed("craft"):
		rerollShop.emit()
		Global.coin -= 5
	
	pass





func _on_detect_zone_body_entered(body):
	traderLabel.visible = true
	pass # Replace with function body.


func _on_detect_zone_body_exited(body):
	traderLabel.visible = false
	pass # Replace with function body.
