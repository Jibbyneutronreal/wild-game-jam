extends Area2D
var dragging = false
@onready var sticky_block = $".."
var clickable = false
var drag_offset = Vector2.ZERO

func _ready():
	# Ensure we're tracking the initial state
	pass

func _physics_process(delta):
	if dragging:
		# When dragging, set the velocity directly instead of position
		var target_pos = get_global_mouse_position() + drag_offset
		var current_pos = sticky_block.global_position
		
		# Option 1: For more stable physics when interacting with sticky blocks
		sticky_block.linear_velocity = (target_pos - current_pos) / delta
		sticky_block.sleeping = false  # Wake up the physics body
		
		# Option 2: For direct positioning (may still cause some shaking with joints)
		# tower_block.global_position = target_pos
		
		# Option 3: Turn off physics while dragging
		# tower_block.freeze = true
		# tower_block.global_position = target_pos

func _input(event):
	if Input.is_action_just_pressed("holdItem") and clickable:
		dragging = true
		# Store offset from mouse to block center to maintain grab point
		drag_offset = sticky_block.global_position - get_global_mouse_position()
		
		# If using Option 3, enable this:
		# tower_block.freeze = true
		
	elif Input.is_action_just_released("holdItem"):
		dragging = false
		
		# If using Option 3, enable this:
		# tower_block.freeze = false
		
		# When releasing, give a slight velocity in the direction of movement
		# tower_block.linear_velocity = (get_global_mouse_position() - tower_block.global_position) * 2

func _on_mouse_entered():
	clickable = true

func _on_mouse_exited():
	clickable = false
