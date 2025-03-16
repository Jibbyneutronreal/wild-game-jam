extends RigidBody2D

var tower_block = preload("res://Scenes/Block.tscn")
var last_block_y = 680
var block_gap = 125
var grav = 300
var numberBlocks = 5
var is_stuck = false
var stick_to_body = null

func _ready():
	# These properties are valid for RigidBody2D
	contact_monitor = true
	max_contacts_reported = 10
	
	# Get the sticky detection area and connect its signal
	var sticky_area = $sticky_detection
	if sticky_area:
		sticky_area.connect("body_entered", Callable(self, "_on_sticky_detection_body_entered"))
	else:
		print("Error: sticky_detection node not found!")

func blockinstance():
	if numberBlocks > 0:
		var tower_block_instance = tower_block.instantiate()  
		get_tree().root.add_child(tower_block_instance)
		tower_block_instance.global_position = Vector2(global_position.x, last_block_y - block_gap)
		last_block_y -= block_gap
		numberBlocks -= 1

func _process(delta):
	if numberBlocks < 0:
		numberBlocks = 0

func _physics_process(delta):
	if not is_stuck:
		position.y += grav * delta

# Called when the sticky area detects a collision
func _on_sticky_detection_body_entered(body):
	# Check if the colliding body is another block or something we want to stick to
	if body != self and not is_stuck and body is RigidBody2D:
		print("Sticking to: ", body.name)
		is_stuck = true
		stick_to_body = body
		
		# Create a joint to connect the bodies
		var joint = PinJoint2D.new()
		joint.name = "StickJoint"
		add_child(joint)
		joint.global_position = global_position
		joint.node_a = get_path()
		joint.node_b = body.get_path()
		
		# Make the joint stiff
		joint.bias = 0.5  # Using 0.5 instead of 0.9 for more stability
		joint.disable_collision = true
