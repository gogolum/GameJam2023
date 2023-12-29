extends Area2D

var candonate = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_area_entered(area):
	if !area.ismat:
		candonate = true
		
	else:
		candonate = false

func _on_area_exited(area):
	if get_overlapping_areas() == []:
		candonate = false
