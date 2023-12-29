extends Control

@onready var coinLable: Label = $CanvasLayer/MarginContainer/HBoxContainer/Coin
@onready var coinIncrementLabel: Label = $CanvasLayer/MarginContainer/HBoxContainer/coinIncrement
@onready var adversaireBar: ProgressBar = $CanvasLayer/HBoxContainer/adversaireBar
@onready var playerBar: ProgressBar = $CanvasLayer/HBoxContainer/BarPlayer
@onready var nextDayButon: Button = $CanvasLayer/NextDayButton

func _ready():
	$CanvasLayer/ColorRect2.visible = false
	nextDayButon.visible = false
	Global.connect("valueChange",changeValue)
	pass 



func _process(delta):
	pass

func changeValue():
	coinLable.text = " : " + str(Global.coin)
	adversaireBar.value = Global.adversaireScore
	playerBar.value = Global.playerScore
	pass

func zoomRendu(playerScoreDay,adversaireScoreDay,day):
	$CanvasLayer/ColorRect2.visible = true
	$CanvasLayer/MarginContainer/HBoxContainer.visible = true
	$CanvasLayer/MarginContainer.visible = true
	$CanvasLayer/HBoxContainer.position.y += 400
	$CanvasLayer/HBoxContainer.position.x -= 50
	$CanvasLayer/AudioStreamPlayer2D.play()
	await  get_tree().create_timer(1).timeout
	day = Global.day
	Global.playerScore += playerScoreDay
	Global.adversaireScore += adversaireScoreDay[day] 
	await  get_tree().create_timer(0.5).timeout
	coinIncrementLabel.visible = true
	coinIncrementLabel.text = "+ " + str(Global.coinIncrement)
	await  get_tree().create_timer(0.5).timeout
	nextDayButon.visible = true
	pass

func NextDay():
	$CanvasLayer/ColorRect2.visible = false
	$CanvasLayer/MarginContainer/HBoxContainer.visible = true
	$CanvasLayer/MarginContainer.visible = true
	$CanvasLayer/HBoxContainer.position.y -= 400
	$CanvasLayer/HBoxContainer.position.x += 50
	coinIncrementLabel.visible = false
	Global.coin += Global.coinIncrement
	Global.day += 1
	nextDayButon.visible = false
	pass

func _on_button_pressed():
	NextDay()
	pass # Replace with function body.
