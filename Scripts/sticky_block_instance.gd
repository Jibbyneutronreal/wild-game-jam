extends RigidBody2D

var grav = 3

func _ready():
	# These properties are valid for RigidBody2D
	contact_monitor = true
	max_contacts_reported = 10

func _physics_process(delta):
	gravity_scale = grav
