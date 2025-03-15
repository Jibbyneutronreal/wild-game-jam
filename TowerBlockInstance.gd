extends CharacterBody2D

var tower_block = preload("res://Block.tscn")
var last_block_y = 680  # Tracks the y position of the last spawned block
var block_gap = 125
var grav = 10
var numberBlocks = 5

func _ready():
	position.x = 480
func blockinstance():
	if numberBlocks > 0:
		var tower_block_instance = tower_block.instantiate()  
		
		# Set position to be above the last block
		tower_block_instance.position = Vector2(100, last_block_y - block_gap)  # Adjust X and Y as needed

		# Add the block to the scene
		get_tree().root.add_child(tower_block_instance)
		
		# Update last block's Y position
		last_block_y = tower_block_instance.position.y
		numberBlocks -=1
	
func _process(_delta):
	if numberBlocks < 0:
		numberBlocks = 0

	if Input.is_action_just_pressed("spawnBlock"):
		blockinstance()
