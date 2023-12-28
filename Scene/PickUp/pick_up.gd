extends Area2D

var spriteId: int
var names = ["Wood","Leather","Fabric","Coal","Iron","Gold","Amethyst","Emerald","Diamond"]
var itemLevel: int 
var itemQuality: int

func _ready():
	itemQuality = (randi()% 3) +1
	spriteId = randi() % 8
	itemLevel = spriteId % 3 + 1
	name = names[spriteId]
	#$AnimatedSprite2D.frame = spriteId
	#$Name.text = name
	#$quality.text = str(itemLevel) + "   " + str(itemQuality)
