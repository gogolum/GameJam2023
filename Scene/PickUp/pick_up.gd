extends Area2D

var spriteId: int
var names_mat = ["Wood","Leather","Fabric","Coal","Iron","Gold","Amethyst","Emerald","Diamond"]
var names_item = [[[]]]
var itemLevel: int 
var itemQuality: int
var itemType : int

func _ready():
	itemQuality = (randi()% 3) +1
	spriteId = randi() % 8
	itemLevel = spriteId % 3 + 1
	name = names_mat[spriteId]
	if spriteId < 3:
		itemQuality = 1
	elif spriteId > 2:
		itemQuality = 2
	else :
		itemQuality = 3
	#$AnimatedSprite2D.frame = spriteId
	#$Name.text = name
	#$quality.text = str(itemLevel) + "   " + str(itemQuality)
