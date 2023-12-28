extends Node

signal valueChange

var coin = 0:
	set(value):
		coin = value
		valueChange.emit()
