extends Area2D

var objects_on_table = []

func _ready():
	pass # Replace with function body.

func _process(delta):
	check_objects()
	

func check_objects():
	var prim : Area2D
	var sec : Area2D
	var ter : Area2D
	objects_on_table = get_overlapping_areas()
	for elements in objects_on_table:
		if elements.itemType == 1:
			prim = elements
		elif elements.itemType == 2:
			sec = elements
		else :
			ter = elements
	print(prim, sec, ter)
		
