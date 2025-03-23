extends Area2D

var dragging = false
var clickable = false
var drag_offset = Vector2.ZERO
@onready var tower_block = $".."

func _physics_process(delta):
	if not tower_block.is_in_group("Sticked"):
		if dragging:
			# Smoothly update the block's position while dragging
			tower_block.global_position = get_global_mouse_position() + drag_offset
	else:
		pass

func _input(event):
	if not tower_block.is_in_group("Sticked"):
		if event.is_action_pressed("holdItem") and clickable:
			dragging = true
			# Calculate offset to maintain accurate drag position
			drag_offset = tower_block.global_position - get_global_mouse_position()
		elif event.is_action_released("holdItem"):
			dragging = false

func _on_mouse_entered():
	clickable = true

func _on_mouse_exited():
	clickable = false
