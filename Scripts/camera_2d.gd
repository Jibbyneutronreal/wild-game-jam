extends Camera2D
#
#@onready var smoothcam = $smoothcam
#@onready var blockcd = $blockcd
#
#
#var camsmoothnum = 10
#
#func _ready():
	#position.x = 576
	#position.y = 314
#
#func _physics_process(delta):
	##if camsmoothnum == 0:
		##blockcd.start()
	#if Input.is_action_just_pressed("spawnBlock"):
		#camsmoothnum = 10
		#CamMove()
		#
#func CamMove():
	#if camsmoothnum > 0:
		#position.y -= 5
		#smoothcam.start()
		#camsmoothnum -= 1
	#
#
#
#func _on_smoothcam_timeout():
	#CamMove()
	#
##func _on_blockcd_timeout():
	##camsmoothnum = 10
