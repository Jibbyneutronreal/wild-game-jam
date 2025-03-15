extends Area2D

var MouseInArea = false
var Dragging = false


func _process(delta):
	if MouseInArea == true:
		if Input.is_action_pressed("LeftClick"):
			global_position = get_global_mouse_position()
			Dragging = true
			print("dragging")
		elif Input.is_action_just_released("LeftClick"):
			Dragging = false

func _on_mouse_entered() -> void:
	print("mouse on block")
	MouseInArea = true

func _on_mouse_exited() -> void:
	print("mouse exited block")
	MouseInArea = false
