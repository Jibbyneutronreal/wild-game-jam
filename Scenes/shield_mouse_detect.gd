extends Area2D

var dragging = false
var clickable = false
var drag_offset = Vector2.ZERO
@onready var tower_block = $".."

func _physics_process(delta):
	if dragging:
		# Smoothly update the block's position while dragging
		tower_block.global_position = get_global_mouse_position() + drag_offset

func _input(event):
	if event.is_action_pressed("holdItem") and clickable:
		dragging = true
		# Calculate offset to maintain accurate drag position
		drag_offset = tower_block.global_position - get_global_mouse_position()
	elif event.is_action_released("holdItem"):
		dragging = false



func _on_mouse_exited():
	clickable = false

func _on_mouse_entered():
	clickable = true
