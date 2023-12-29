extends Node2D

var matScene: PackedScene = preload("res://Scene/PickUp/pick_up.tscn")
var inShop = false

func _ready():
	Global.coin = 500
	matShopSpawn()

func _process(delta):
	if Input.is_action_just_pressed("sell"):
		sell_items()

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

func gen_opponent_advancement():
	var advancement = [0,0,0,0,0,0,0]
	for i in range(100):
		advancement[randi() % 6] += 1
	return advancement

		


func _on_trader_reroll_shop():
	matShopDespawn()
	matShopSpawn()
	pass # Replace with function body.

	
func sell_items():
	for element in $ItemList.get_children():
		if !element.ismat:
			Global.coin += element.itemScore * 4
			give_item(element)
			element.queue_free()

func give_item(item_gived : Area2D):
	var item = item_gived
	item_gived.queue_free()
	return item.itemScore * 3

