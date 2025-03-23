extends RigidBody2D


var normal = preload("res://Scenes/Block.tscn")
var grav = 3
		
func _physics_process(delta):
	gravity_scale = grav

func _on_switch_mouse_detect_body_entered(body):
	if body.is_in_group("slippery"):
		var previous_position = body.position
		var normal_scene = normal.instantiate()
		normal_scene.position = previous_position  # Set position directly
		var parent = body.get_parent()  # Get the current parent node
		parent.add_child(normal_scene)  # Add the new block to the same parent
		
		body.queue_free()  # Remove the slippery block
