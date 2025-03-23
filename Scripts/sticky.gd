extends Area2D

# IMPORTANT: Make sure this node is NOT in the "blocks" group!

func _ready():
	# Remove from blocks group if it was accidentally added
	if is_in_group("blocks"):
		remove_from_group("blocks")
	print("Sticky block initialized - NOT in blocks group")

func _on_body_entered(body):
	# Add an extra check to make sure we don't stick to ourselves
	if body == self or body.get_parent() == self:
		print("Ignoring self collision")
		return
		
	# Only stick to actual blocks
	if body.is_in_group("blocks") and not body.is_in_group("Sticked") and body != self:
		print("Valid block detected: " + body.name)
		stick_block(body)

func stick_block(block):
	# Save position
	var global_pos = block.global_position
	
	# Remove from parent
	var original_parent = block.get_parent()
	if original_parent:
		original_parent.remove_child(block)
	
	# Add to sticky block
	add_child(block)
	
	# Reset position
	block.global_position = global_pos
	
	# Disable physics
	if block is RigidBody2D:
		block.gravity_scale = 0
		block.freeze = true
	
	# Mark as sticked
	block.add_to_group("Sticked")
	print("Block sticked successfully: " + block.name)
