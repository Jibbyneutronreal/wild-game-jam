extends RigidBody2D

var grav = 3

func _ready():
	contact_monitor = true
	max_contacts_reported = 10
	add_to_group("blocks")
	# Make sure the sticky block is NOT in this group!
	
func _physics_process(delta):
	gravity_scale = grav
