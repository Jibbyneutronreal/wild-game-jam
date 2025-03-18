extends Area2D

func _on_sticky_block_body_entered(body):
	if body.is_in_group("blocks"):
		if body.is_in_group("Sticked"):
			pass
		else:
			attach_to_block(body)

func attach_to_block(block):
	call_deferred("_attach_block_deferred", block)

func _attach_block_deferred(block):
	if block.is_inside_tree():
		var global_pos = block.global_position  # Store its global position
		block.get_parent().remove_child(block)
		add_child(block)
		block.global_position = global_pos  # Restore the global position
		block.add_to_group("Sticked")
		
