extends Control

@onready var coinLable: Label = $CanvasLayer/MarginContainer/HBoxContainer/Coin
@onready var coinIncrementLabel: Label = $CanvasLayer/MarginContainer/HBoxContainer/coinIncrement
@onready var adversaireBar: ProgressBar = $CanvasLayer/HBoxContainer/adversaireBar
@onready var playerBar: ProgressBar = $CanvasLayer/HBoxContainer/BarPlayer
@onready var nextDayButon: Button = $CanvasLayer/NextDayButton
@onready var dayLabel: Label = $CanvasLayer/HBoxContainer/DayLabel
func _ready():
	$CanvasLayer/ColorRect2.visible = false
	nextDayButon.visible = false
	Global.connect("valueChange",changeValue)
	dayLabel.text = "Day: " + str(Global.day)
	pass 


func changeValue():
	coinLable.text = " : " + str(Global.coin)
	adversaireBar.value = Global.adversaireScore
	playerBar.value = Global.playerScore
	dayLabel.text = "Day: " + str(Global.day)
	pass

func zoomRendu(playerScoreDay,adversaireScoreDay,day, increment):
	$CanvasLayer/ColorRect2.visible = true
	$CanvasLayer/MarginContainer/HBoxContainer.visible = true
	$CanvasLayer/MarginContainer.visible = true
	$CanvasLayer/HBoxContainer.position.y += 400
	$CanvasLayer/HBoxContainer.position.x -= 50
	$CanvasLayer/AudioStreamPlayer2D.play()
	
	if increment == null:
		increment = 0
		
	await  get_tree().create_timer(1).timeout

	increment -= (playerScoreDay * 2)
	increment += (Global.day + 1) * 10
	
	Global.playerScore += playerScoreDay
	Global.adversaireScore += adversaireScoreDay[day] 
	
	await  get_tree().create_timer(0.5).timeout
	
	coinIncrementLabel.visible = true
	coinIncrementLabel.text = "+ " + str(increment)
	Global.coin += increment
	
	await  get_tree().create_timer(0.5).timeout
	
	nextDayButon.visible = true
	

func NextDay():
	$CanvasLayer/ColorRect2.visible = false
	$CanvasLayer/MarginContainer/HBoxContainer.visible = true
	$CanvasLayer/MarginContainer.visible = true
	$CanvasLayer/HBoxContainer.position.y -= 400
	$CanvasLayer/HBoxContainer.position.x += 50
	coinIncrementLabel.visible = false
	Global.coin += Global.coinIncrement
	Global.isNextDay = true
	Global.day += 1
	nextDayButon.visible = false
	pass

func _on_button_pressed():
	NextDay()
	pass # Replace with function body.
