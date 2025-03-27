extends Area2D



func _on_body_entered(body) -> void:
	if body.position == get_global_mouse_position():
		g.passcondition = false
	else:
		g.passcondition = true
		print("passing")

func _on_body_exited(body) -> void:
	g.passcondition = false
	print("e")
	
	
