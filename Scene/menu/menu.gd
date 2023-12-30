extends Control

var fullScreenState: bool = false
const main_scene = preload("res://Scene/Main/main_level.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.canRestart:
		$VBoxContainer/RestartButon.visible = true
	else: $VBoxContainer/RestartButon.visible = false
	
	if  fullScreenState == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if  fullScreenState == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	if Global.tutoIsActive :
		print("shishsi")
		$VBoxContainer/TutoButon.text = "Tutorial : ON"
	else :
		$VBoxContainer/TutoButon.text = "Tutorial : OFF"


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/main_level.tscn")

func _on_full_scree_button_pressed():
	fullScreenState = !fullScreenState
	pass # Replace with function body.


func _on_restart_buton_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/main_level.tscn")
	Global.canRestart = false

func _on_tuto_buton_pressed():
	Global.tutoIsActive = !Global.tutoIsActive


func _on_exit_buton_pressed():
	get_tree().quit()
