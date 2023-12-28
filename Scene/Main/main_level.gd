extends Node2D

var matScene: PackedScene = preload("res://Scene/PickUp/pick_up.tscn")

func _ready():
	matShopSpawn()
	


func matShopSpawn():
	for marker in get_tree().get_nodes_in_group("spawnShopMat"):
		var matShop = matScene.instantiate()
		print(marker.position)
		matShop.position = marker.global_position 
		$ItemList.add_child(matShop)
		pass
