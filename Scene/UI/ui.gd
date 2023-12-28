extends Control

@onready var coinLable: Label = $CanvasLayer/MarginContainer/HBoxContainer/Coin

func _ready():
	Global.connect("valueChange",changeCoinValue)
	pass 



func _process(delta):
	pass

func changeCoinValue():
	coinLable.text = " " + str(Global.coin)
	pass
