extends Node2D

@onready var geolabel : Label = $Geologist_Label
@onready var detectionzone = $DetectZoneMat

# Called when the node enters the scene tree for the first time.
func _ready():
	$DetectZonePlayer/AnimatedSprite2D/AnimationPlayer.play('Idle')
	geolabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if geolabel.visible and Input.is_action_just_pressed("craft"):
		getInfoGeo()
		Global.coin -= 5

func getInfoGeo():
	var overlap = detectionzone.get_overlapping_areas()
	print(overlap)
	if overlap != []:
		if len(overlap) >= 2:
			pass
		else :
			if overlap[0].ismat and Global.coin >= 5:
				overlap[0].matpopUpDisplay()
				Global.coin -= 5



func _on_detect_zone_body_entered(body):
	geolabel.visible = true
	print("yesmùan")
	
func _on_detect_zone_body_exited(body):
	geolabel.visible = false
