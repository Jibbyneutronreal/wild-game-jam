extends RigidBody2D

var last_block_y = 680
var block_gap = 125
var grav = 3
var numberBlocks = 5

func _ready():
	gravity_scale = grav  # Set initial gravity

func _physics_process(delta):
	if self.is_in_group("Sticked"):
		gravity_scale = 0  # Disable gravity if in "Sticked" group
	else:
		gravity_scale = grav  # Enable gravity otherwise

		
