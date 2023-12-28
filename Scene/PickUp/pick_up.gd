extends Area2D

@onready var matsprite = $matSprite2D
@onready var itemsprite = $itemSprite2D2

var spriteId: int
var names_mat = ["Wood","Leather","Fabric","Coal","Iron","Gold","Amethyst","Emerald","Diamond"]
var itemLevel: int 
var itemQuality: int
var itemType : int
var ismat = true
var frame_counter_item : int


func _ready():
	itemQuality = (randi()% 3) +1
	spriteId = randi() % 8
	itemLevel = spriteId % 3 + 1
	name = names_mat[spriteId]
	if spriteId < 3:
		itemType = 1
	elif spriteId > 2 and spriteId < 6:
		itemType = 2
	else :
		itemType = 3
	matsprite.frame = spriteId
	if ismat == true:
		itemsprite.visible = false
		matsprite.visible = true
	if ismat == false:
		$itemSprite2D2.visible = true
		$matSprite2D.visible = false
		$itemSprite2D2.frame = frame_counter_item
	#$Name.text = name
	#$quality.text = str(itemLevel) + "   " + str(itemQuality)


