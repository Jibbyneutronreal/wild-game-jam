extends Area2D

var is_stuck = false  # Track if the sticky block has attached
var pin_joint : PinJoint2D = null  # Variable to store the PinJoint2D

# Called when another object (body) enters the area of this block
func _on_body_entered(body):
	print("Collided with: ", body.name)
	if not is_stuck and body is RigidBody2D:
		stick_to_block(body)

# Called when another area enters the area of this block
func _on_area_entered(area):
	print("Entered area of: ", area.name)
	if not is_stuck and area is RigidBody2D:
		stick_to_block(area)

# Stick the block to the target block
func stick_to_block(target_block):
	if target_block is RigidBody2D and not is_stuck:
		# Create a PinJoint2D to keep the blocks together
		pin_joint = PinJoint2D.new()
		pin_joint.position = global_position  # Attach at the same position as this block
		pin_joint.node_a = get_path()  # This (sticky) block
		pin_joint.node_b = target_block.get_path()  # Target block
		
		# Add the joint to the parent node (the container of the blocks)
		get_parent().add_child(pin_joint)  
		
		# Mark the block as stuck
		is_stuck = true
		
		# Optionally adjust position of the sticky block relative to the target block
		self.position = target_block.position  # Align sticky block with target block

		# Set target block to Kinematic mode to prevent it from moving independently
