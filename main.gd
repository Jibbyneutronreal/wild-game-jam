extends Node2D
@onready var block = preload("res://Block.tscn")

func spawn_object():
	var block_scence = block.instantiate()
	block_scence.position.x = randf_range(100, 1152)
	add_child(block_scence)
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_object()
