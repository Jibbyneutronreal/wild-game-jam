extends RigidBody2D

var last_block_y = 680
var block_gap = 125
var grav = 3
var numberBlocks = 5

func _ready():
	pass


func _physics_process(delta):
	gravity_scale = grav
