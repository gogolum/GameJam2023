extends Node2D

var itemScene: PackedScene = preload("res://Scene/PickUp/pick_up.tscn")
var objects_on_table = []
@onready var area = $CraftingBenchArea
var canCraft = false
var items = [[[[0],[1],[2]],[[3],[4],[5]], [[6],[7],[8]]], [[[9],[10],[11]], [[12],[13],[14]], [[15],[16],[17]]], [[[18],[19],[20]], [[21],[22],[23]], [[24],[25],[26]]]]
var materials = []

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		materials = check_objects()
		
	if Input.is_action_just_pressed("craft") and canCraft == true:
		craft(materials[0], materials[1], materials[2])
		canCraft = false

func check_objects():
	var prim : Area2D
	var sec : Area2D
	var ter : Area2D
	objects_on_table = area.get_overlapping_areas()
	for element in objects_on_table:
		if element.matType == 1 and prim == null:
			prim = element
			element.position = $PrimaryPick_Up.global_position
		if element.matType == 2 and sec == null:
			sec = element
			element.position = $SecondaryPick_Up.global_position
		if element.matType == 3 and ter == null:
			ter = element
			element.position = $TertiaryPick_Up.global_position
			
	if prim != null and sec != null and ter != null:
		$CanCraft.text = "Press space to craft !"
		canCraft = true
	return [prim,sec,ter]
		
func craft(primary, secondary, tersiary):
	var num = 0
	num = items[primary.matLevel - 1][secondary.matLevel - 1][tersiary.matLevel - 1]
	var item = itemScene.instantiate()
	item.itemScore = ((primary.matLevel + secondary.matLevel * 2 + tersiary.matLevel * 3)/6) * ((secondary.matQuality  * tersiary.matQuality)/4)
	item.ismat = false
	#envoyer des infos pour les popUp
	item.itemQuality = (secondary.matQuality  * tersiary.matQuality)/4
	item.itemType = primary.matLevel
	item.gemType = tersiary.matLevel
	
	item.frame_counter_item = num[0]
	item.position = Vector2(200,200)
	item.scale = Vector2(4, 4)
	$"../ItemList".add_child(item)
	primary.queue_free()
	secondary.queue_free()
	tersiary.queue_free()
