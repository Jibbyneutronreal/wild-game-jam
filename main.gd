extends Node2D
@onready var block = preload("res://Block.tscn")
@onready var sticky_block = preload("res://sticky_block.tscn")

func spawn_tower_block():
	var block_scence = block.instantiate()
	block_scence.position.x = randf_range(100, 1152)
	add_child(block_scence)
	
func spawn_sticky_block():
	var sticky_block_scence = sticky_block.instantiate()
	sticky_block_scence.position.x = randf_range(100,1152)
	add_child(sticky_block_scence)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_tower_block()
	if Input.is_action_just_pressed("spawnSticky"):
		spawn_sticky_block()
