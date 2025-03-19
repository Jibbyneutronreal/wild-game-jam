extends RigidBody2D

var sticky_block = preload("res://Scenes/sticky_block.tscn")
var last_block_y = 680  # Tracks the y position of the last spawned block
var block_gap = 125
var grav = 3
var numberBlocks = 5
@onready var sheild1 = $"."
@onready var shield2 = $ShieldMouseDetect
@onready var wall = $"../StaticBody2D"
@onready var fireball = $"../fireball"


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
	gravity_scale = grav


func _on_shield_killer_body_entered(body):
	if body == fireball:
		body.queue_free()

func _on_shield_killer_area_entered(area):
	pass # Replace with function body.
