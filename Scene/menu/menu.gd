extends Control

var fullScreenState: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  fullScreenState == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if  fullScreenState == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/main_level.tscn")
	pass # Replace with function body.


func _on_tuto_buton_button_down():
	Global.tutoIsActive = false
	pass # Replace with function body.


func _on_tuto_buton_button_up():
	Global.tutoIsActive = true
	pass # Replace with function body.


func _on_full_scree_button_pressed():
	fullScreenState = !fullScreenState
	pass # Replace with function body.
