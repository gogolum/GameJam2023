extends Area2D

var candonate = false
var gift: Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		interact()


func _on_area_entered(area):
	if !area.ismat:
		candonate = true
		gift = area
		print(area)
	else : 
		false

func interact():
	if gift != null and len(get_overlapping_areas()) == 1:
		gift.position = $Snap_Point.global_position
		gift.position.y
	
