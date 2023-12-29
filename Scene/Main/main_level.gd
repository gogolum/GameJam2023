extends Node2D

var matScene: PackedScene = preload("res://Scene/PickUp/pick_up.tscn")
var inShop = false
func _ready():
	#initialisation
	Global.coin = 500
	Global.coinIncrement = 0
	Global.playerScore = 0
	Global.adversaireScore = 0
	Global.day = 0
	Global.isNextDay = true
	Global.tutoIsActive = false
	matShopSpawn()
	

func gen_opponent_advancement():
	var advancement = [0,0,0,0,0,0,0]
	for i in range(100):
		advancement[randi() % 7] += 1
	return advancement
	
var adversaireScoreDay = gen_opponent_advancement()

func _process(delta):
	
	if Global.tutoIsActive == true:
		$Tutorial.visible = true
	else:
		$Tutorial.visible = false
	
	if Input.is_action_just_pressed("giveItem") and Global.isNextDay:
		Global.isNextDay = false
		if $GiftBox.gift == null:
			$UI.zoomRendu(0,adversaireScoreDay,Global.day)
		else:
			$UI.zoomRendu(give_item($GiftBox.gift),adversaireScoreDay,Global.day)
		sell_items()
	
	if Global.playerScore >= 100:
		if Global.playerScore >= 100 and Global.adversaireScore>= 100:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
		else :
			get_tree().change_scene_to_file("res://Scene/EndScreen/winn_scene.tscn")
		pass
	
	if Global.adversaireScore>= 100:
		if Global.playerScore >= 100 and Global.adversaireScore>= 100:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
		pass

func matShopSpawn():
	for marker in get_tree().get_nodes_in_group("spawnShopMat"):
		var matShop = matScene.instantiate()
		matShop.position = marker.global_position 
		$ItemList.add_child(matShop)
		pass
func matShopDespawn():
	for mat in $ItemList.get_children() :
		if mat.ismat and !mat.isBought:
			mat.queue_free()
		pass


func _on_shop_area_body_entered(body):
	inShop = true
	
func _on_shop_area_area_exited(area):
	inShop = false
	if $Entities/Player.Carry:
		if Global.coin > $Entities/Player.carried.mat_price and !$Entities/Player.carried.isBought:	
			Global.coin -= $Entities/Player.carried.mat_price
			$Entities/Player.carried.isBought = true

func _on_trader_reroll_shop():
	matShopDespawn()
	matShopSpawn()
	pass # Replace with function body.

	
func sell_items():
	for element in $ItemList.get_children():
		if !element.ismat:
			Global.coinIncrement += element.itemScore * 4
			give_item(element)
			element.queue_free()

func give_item(item_gived : Area2D):
	var item = item_gived
	item_gived.queue_free()
	return item.itemScore * 3

