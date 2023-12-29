extends Control

@onready var QualityLabel: Label = $PanelContainer/VBoxContainer2/Container/QualityLabel
@onready var TypeLabel: Label = $PanelContainer/VBoxContainer2/Container/TypeLabel
@onready var GemLabel: Label = $PanelContainer/VBoxContainer2/Container/GemLabel
@onready var PowerLabel: Label = $PanelContainer/VBoxContainer2/VBoxContainer/PowerLabel

var Quality: String
var Type: String
var Gem: String
var Power: String

var QualityColor: String
var TypeColor: String
var GemColor: String

func changeStat():
	var QualityLabel: Label = $PanelContainer/VBoxContainer2/Container/QualityLabel
	var TypeLabel: Label = $PanelContainer/VBoxContainer2/Container/TypeLabel
	var GemLabel: Label = $PanelContainer/VBoxContainer2/Container/GemLabel
	var PowerLabel: Label = $PanelContainer/VBoxContainer2/VBoxContainer/PowerLabel
	QualityLabel.text = Quality
	TypeLabel.text = Type
	GemLabel.text = "of " + Gem
	PowerLabel.text = "power: " + Power
	QualityLabel.add_theme_color_override("font_color", QualityColor)

