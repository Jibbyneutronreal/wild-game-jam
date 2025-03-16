extends Area2D

var dragging = false
var offset = Vector2.ZERO

@onready var sticky_block = $".."
var clickable = false

func _process(_delta):
	if dragging:
		# Apply the offset while updating the block's position
		sticky_block.global_position = sticky_block.global_position.lerp(get_global_mouse_position(), 0.25)


func _input(event):
	if Input.is_action_pressed("holdItem") and clickable:
		# Calculate the offset when starting to drag
		offset = get_global_mouse_position() - sticky_block.global_position
		dragging = true
	elif Input.is_action_just_released("holdItem"):
		dragging = false

func _on_mouse_entered():
	print("Mouse entered block")
	clickable = true

func _on_mouse_exited():
	print("Mouse exited block")
	clickable = false
