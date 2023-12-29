extends Area2D

@onready var matsprite = $matSprite2D
@onready var itemsprite = $itemSprite2D2

@onready var popUpScene: PackedScene = preload("res://Scene/UI/popup.tscn")

# matériaux
var spriteId: int
var names_mat = ["Wood","Leather","Fabric","Coal","Iron","Gold","Amethyst","Emerald","Diamond"]
var mat_list_prices = [3,6,12,6,12,24,12,24,48]
var mat_price : float
var matLevel: int 
var matQuality: int
var matType : int
var ismat = true
var isBought = false

# item
var frame_counter_item : int
var itemScore : float
var itemQuality : float
var itemType : int 
var gemType : int

func _ready():
	if ismat == true:
		matQuality = (randi()% 9) +1
		spriteId = randi() % 9
		matLevel = spriteId % 3 + 1
		mat_price = mat_list_prices[spriteId] + randi_range(-(mat_list_prices[spriteId]/2), mat_list_prices[spriteId]/2)
		name = names_mat[spriteId]
		if spriteId < 3:
			matType = 1
		elif spriteId > 2 and spriteId < 6:
			matType = 2
		else :
			matType = 3
		matsprite.frame = spriteId
		itemsprite.visible = false
		matsprite.visible = true
		$Price.text = str(mat_price)
	if ismat == false:
		name = ""
		$itemSprite2D2.visible = true
		$matSprite2D.visible = false
		$itemSprite2D2.frame = frame_counter_item
	#$Name.text = name
	#$quality.text = str(itemLevel) + "   " + str(itemQuality)

func popUpDisplay():
	var popUp = popUpScene.instantiate()
	popUp.global_position.x += 8
	if itemQuality >= 0 and itemQuality <= 3:
		popUp.Quality = "Mediocre"
	elif itemQuality > 3 and itemQuality <= 5:
		popUp.Quality = "Acceptable"
	elif itemQuality > 5 and itemQuality <= 10:
		popUp.Quality = "Great"
	elif itemQuality > 10 and itemQuality <= 15:
		popUp.Quality = "Magnificiante"
	elif itemQuality > 15 and itemQuality <= 18:
		popUp.Quality = "MasterPiece"
	elif itemQuality > 18  and itemQuality <= 20:
		popUp.Quality = "GOOD"
	
	if itemType == 1:
		popUp.Type = "bracelet"
	elif  itemType == 2:
		popUp.Type = "neckless"
	elif  itemType == 3:
		popUp.Type = "ring"
	
	if gemType == 1:
		popUp.Gem = "amethyste"
	elif  gemType == 2:
		popUp.Gem = "emerald"
	elif  gemType == 3:
		popUp.Gem = "diamond"
	
	popUp.Power = str(itemScore)
	popUp.changeStat()
	add_child(popUp) 
	pass
