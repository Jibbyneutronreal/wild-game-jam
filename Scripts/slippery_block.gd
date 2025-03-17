extends RigidBody2D

var slippery_block = preload("res://Scenes/Slippery_block.tscn")
var last_block_y = 680
var block_gap = 125
var grav = 300
var numberBlocks = 5
var is_stuck = false
var stick_to_body = null

func _ready():
	# These properties are valid for RigidBody2D
	contact_monitor = true
	max_contacts_reported = 10

func blockinstance():
	if numberBlocks > 0:
		var tower_block_instance = slippery_block.instantiate()  
		get_tree().root.add_child(tower_block_instance)
		tower_block_instance.global_position = Vector2(global_position.x, last_block_y - block_gap)
		last_block_y -= block_gap
		numberBlocks -= 1

func _process(delta):
	if numberBlocks < 0:
		numberBlocks = 0

func _physics_process(delta):
	if not is_stuck:
		position.y += grav * delta
