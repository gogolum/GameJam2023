extends Node

signal valueChange

var coin = 0:
	set(value):
		coin = value
		valueChange.emit()


var coinIncrement = 0:
	set(value):
		if value < 0 :
			if Global.coin > value:
				coinIncrement = value
			else :
				coinIncrement = 0
		else :
			coinIncrement = value
		valueChange.emit()


var playerScore = 0:
	set(value):
		playerScore = value
		valueChange.emit()

var adversaireScore = 0:
	set(value):
		adversaireScore = value
		valueChange.emit()

var day = 0:
	set(value):
		day = value
		valueChange.emit()
var isNextDay = true

var tutoIsActive = false

var canRestart = false
