extends Area2D

var MouseInArea = false
var Dragging = false

func _process(delta):
	if MouseInArea == true:
		if Input.is_action_pressed("LeftClick"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("LeftClick"):
			pass

func _on_mouse_entered() -> void:
	print("mouse on block")
	var MouseInArea = true

func _on_mouse_exited() -> void:
	print("mouse exited block")
	var MouseInArea = false
