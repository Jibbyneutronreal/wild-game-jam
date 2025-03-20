extends RigidBody2D

var last_block_y = 680
var block_gap = 125
var grav = 3
var numberBlocks = 5

func _ready():
	# Set initial gravity based on group membership
	if is_in_group("Sticked"):
		gravity_scale = 0
	else:
		gravity_scale = grav

func attach_to_sticky():
# Handle logic to attach block and disable gravity
	if not is_in_group("Sticked"):
		add_to_group("Sticked")
		gravity_scale = 0
		global_position = get_parent().global_position  # Sync position if needed

func detach_from_sticky():
# Reset gravity and detach from group
	if is_in_group("Sticked"):
		remove_from_group("Sticked")
		gravity_scale = grav

func _physics_process(delta):
	if is_in_group("Sticked"):
		gravity_scale = 0  # Just in case
		grav = 0
	else:
		gravity_scale = grav


		
