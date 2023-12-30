extends Node2D

var matScene: PackedScene = preload("res://Scene/PickUp/pick_up.tscn")
var inShop = false

func _ready():
	#initialisation
	Global.valueChange.emit()
	if Global.canRestart == false:
		Global.coin = 250 
		Global.coinIncrement = 0
		Global.playerScore = 0
		Global.adversaireScore = 0
		Global.day = 0
		Global.isNextDay = true
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
			$UI.zoomRendu(0,adversaireScoreDay,Global.day, sell_items())
		else:
			$UI.zoomRendu(give_item($GiftBox.gift),adversaireScoreDay,Global.day, sell_items())
	
	if Global.playerScore >= 100:
		if Global.playerScore >= 100 and Global.adversaireScore>= 100:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
			Global.canRestart = false
		else :
			get_tree().change_scene_to_file("res://Scene/EndScreen/winn_scene.tscn")
			Global.canRestart = false
		pass
	
	if Global.adversaireScore>= 100:
		if Global.playerScore >= 100 and Global.adversaireScore>= 100:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
			Global.canRestart = false
		else:
			get_tree().change_scene_to_file("res://Scene/EndScreen/loose_screen.tscn")
			Global.canRestart = false
		pass
	
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://Scene/menu/menu.tscn")
		Global.canRestart = true
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
	var total_price = 0
	for element in $ItemList.get_children():
		if !element.ismat:
			total_price += element.itemScore
			element.queue_free()
	return total_price

func give_item(item_gived : Area2D):
	var item = item_gived
	item.queue_free()
	return item.itemScore / 2

