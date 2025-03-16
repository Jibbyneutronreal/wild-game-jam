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
		block.get_parent().remove_child(block)
		add_child(block)
		block.position = self.to_local(block.global_position)
		block.add_to_group("Sticked")
		
