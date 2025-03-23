extends RigidBody2D

var last_block_y = 680
var block_gap = 125
var grav = 3
var numberBlocks = 5

func _ready():
	if is_in_group("Sticked"):
		gravity_scale = 0
	else:
		gravity_scale = grav


func _physics_process(delta):
	if is_in_group("Sticked"):
		gravity_scale = 0  # Just in case
		grav = 0
	else:
		gravity_scale = grav


		
