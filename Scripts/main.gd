extends Node2D
@onready var block = preload("res://Scenes/Block.tscn")
@onready var sticky_block = preload("res://Scenes/sticky_block.tscn")
@onready var slippery_block = preload("res://Scenes/Slippery_block.tscn")
@onready var gamet = $gamet
@onready var time = $text/time
@onready var shield_block = preload("res://Scenes/shield_block.tscn")

func spawn_block():
	# Generate a random integer from 1 to 10
	var random_number = randi() % 10 + 1
	print("Random number: ", random_number)
	if random_number >= 5:
		spawn_slippery()
	else:
		var block_scene = block.instantiate()
		block_scene.position.x = randf_range(100, 1152)
		add_child(block_scene)
	
func spawn_sticky():
	var sticky_scene = sticky_block.instantiate()
	sticky_scene.position.x = randf_range(100, 1152)
	add_child(sticky_scene)
	
func spawn_slippery():
	var slippery_scene = slippery_block.instantiate()
	slippery_scene.position.x = randf_range(100, 1152)
	add_child(slippery_scene)
	
	
func spawn_sheild():
	var shield_scene = shield_block.instantiate()
	shield_scene.position.x = randf_range(100, 1152)
	add_child(shield_scene)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_block()
	if Input.is_action_just_pressed("spawnSticky"):
		spawn_sticky()
	if Input.is_action_just_pressed("spawnSheild"):
		spawn_sheild()
		
	# Update the text to display the time remaining.
	# Assuming 'gamet' is a Timer node, and it has a 'time_left' property.
	time.text = str(int(gamet.time_left))

func _on_gamet_timeout():
	get_tree().reload_current_scene()
