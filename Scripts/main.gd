extends Node2D
@onready var block = preload("res://Scenes/Block.tscn")
@onready var sticky_block = preload("res://Scenes/sticky_block.tscn")

func spawn_block():
	var block_scence = block.instantiate()
	block_scence.position.x = randf_range(100, 1152)
	add_child(block_scence)
	
	
func spawn_stick():
	var sticky_scene = sticky_block.instantiate()
	sticky_scene.position.x = randf_range(100, 1152)
	add_child(sticky_scene)
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_block()
	if Input.is_action_just_pressed("spawnSticky"):
		spawn_stick()
