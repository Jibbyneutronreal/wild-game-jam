extends RigidBody2D

var tower_block = preload("res://Scenes/Block.tscn")
var last_block_y = 680
var block_gap = 125
var grav = 300
var numberBlocks = 5
var is_stuck = false

func _ready():
	# These properties are valid for RigidBody2D
	contact_monitor = true
	max_contacts_reported = 10

func _process(delta):
	if self.is_in_group("Sticked"):
		grav = 0

func _physics_process(delta):
	position.y += grav * delta

	
