extends Area2D

var dragging = false

@onready var tower_block = $".."

var clickable = false

func _process(_delta):
	if dragging:
		tower_block.global_position = get_global_mouse_position()

func _input(event):
	if Input.is_action_pressed("holdItem") and clickable:
		dragging = true
	elif Input.is_action_just_released("holdItem") and clickable:
		dragging = false

func _on_mouse_entered():
	print("Mouse entered block")
	clickable = true

func _on_mouse_exited():
	print("Mouse exited block")
	clickable = false
