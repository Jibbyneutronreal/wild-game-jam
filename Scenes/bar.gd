extends Area2D



func _on_body_entered(body) -> void:
	g.passcondition = true
	print("passing")

func _on_body_exited(body) -> void:
	g.passcondition = false
	print("e")
	
	
