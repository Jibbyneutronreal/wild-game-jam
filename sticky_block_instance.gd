extends RigidBody2D

var sticky_block = preload("res://sticky_block.tscn")
var last_block_y = 680  # Tracks the y position of the last spawned block
var block_gap = 125
var grav = 200
var numberBlocks = 5


func _ready():
	pass
func blockinstance():
	if numberBlocks > 0:
		var sticky_block_instance = sticky_block.instantiate()  
		
		# Add the block to the scene
		get_tree().root.add_child(sticky_block_instance)
		
		# Update last block's Y position
		numberBlocks -=1
	
func _process(_delta):
	if numberBlocks < 0:
		numberBlocks = 0
		
func _physics_process(delta):
	position.y += grav*delta
