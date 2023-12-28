extends Area2D

var spriteId: int
var names = ["Wood","Leather","Fabric","Coal","Iron","Gold","Amethyst","Emerald","Diamond"]
var itemLevel: int 
var itemQuality: int
var isCarry: bool = false

func _ready():
	itemQuality = (randi()% 3) +1
	spriteId = randi() % 8
	itemLevel = spriteId % 3 + 1
	#$Name.text = name
	#$quality.text = str(itemLevel) + "   " + str(itemQuality)
	

func _process(delta):
	if isCarry :
		#top_level = true
		isCarry = false
		pass

