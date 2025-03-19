extends Area2D

var dragging = false
var clickable = false
var drag_offset = Vector2.ZERO
@onready var slippery_block = $".."

func _physics_process(delta):
	if dragging:
		# Smoothly move the block while dragging
		var target_pos = get_global_mouse_position() + drag_offset
		slippery_block.global_position = target_pos

func _input(event):
	if event.is_action_pressed("holdItem") and clickable:
		dragging = true
		# Calculate the offset to maintain grab accuracy
		drag_offset = slippery_block.global_position - get_global_mouse_position()
	elif event.is_action_released("holdItem"):
		dragging = false

func _on_mouse_entered():
	clickable = true

func _on_mouse_exited():
	clickable = false
