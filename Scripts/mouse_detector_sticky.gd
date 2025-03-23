extends Area2D

var dragging = false
var clickable = false
var drag_offset = Vector2.ZERO
@onready var sticky_block = $".."

func _physics_process(delta):
	if dragging:
		var target_pos = get_global_mouse_position() + drag_offset
		sticky_block.global_position = target_pos
	for child in sticky_block.get_children():
		if child.is_in_group("Sticked"):
			child.global_position = sticky_block.global_position

func _input(event):
	if event.is_action_pressed("holdItem") and clickable:
		dragging = true
		drag_offset = sticky_block.global_position - get_global_mouse_position()
	elif event.is_action_released("holdItem"):
		dragging = false

func _on_mouse_entered():
	clickable = true

func _on_mouse_exited():
	clickable = false

func attach_block(block):
	if block.is_in_group("blocks") and not block.is_in_group("Sticked"):
		var global_pos = block.global_position
		block.get_parent().remove_child(block)
		sticky_block.add_child(block)
		block.global_position = global_pos
		block.add_to_group("Sticked")
		block.gravity_scale = 0
