extends Node2D

@onready var block = preload("res://Scenes/Block.tscn")
@onready var sticky_block = preload("res://Scenes/sticky_block.tscn")
@onready var slippery_block = preload("res://Scenes/Slippery_block.tscn")
@onready var shield_block = preload("res://Scenes/shield_block.tscn")
@onready var gamet = $gamet
@onready var time = $text/time

func spawn_block():
	# Spawn a standard or slippery block based on a random chance
	var random_number = randi() % 10 + 1
	print("Random number: ", random_number)
	if random_number >= 7:
		spawn_slippery()
	else:
		var block_scene = block.instantiate()
		block_scene.position.x = randf_range(100, 1152)
		add_child(block_scene)

func spawn_sticky():
	# Spawn a sticky block
	var sticky_scene = sticky_block.instantiate()
	sticky_scene.position.x = randf_range(100, 1152)
	add_child(sticky_scene)

func spawn_slippery():
	# Spawn a slippery block
	var slippery_scene = slippery_block.instantiate()
	slippery_scene.position.x = randf_range(100, 1152)
	add_child(slippery_scene)

func spawn_shield():
	# Spawn a shield block
	var shield_scene = shield_block.instantiate()
	shield_scene.position.x = randf_range(100, 1152)
	add_child(shield_scene)

func _physics_process(delta):
	# Handle block spawning based on input actions
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_block()
	if Input.is_action_just_pressed("spawnSticky"):
		spawn_sticky()
	if Input.is_action_just_pressed("spawnShield"):
		spawn_shield()
	if Input.is_action_just_pressed("spawnSlippery"):
		spawn_slippery()

	# Update the text to display the time remaining
	time.text = str(int(gamet.time_left))

func _on_gamet_timeout():
	# Reload the current scene when the timer runs out
	get_tree().reload_current_scene()
