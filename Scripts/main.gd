extends Node2D

@onready var block = preload("res://Scenes/Block.tscn")
@onready var sticky_block = preload("res://Scenes/sticky_block.tscn")
@onready var slippery_block = preload("res://Scenes/Slippery_block.tscn")
@onready var metal_block = preload("res://Scenes/metal_block.tscn")
@onready var gamet = $gamet
@onready var time = $text/time
@onready var coins = $text/coins


func _ready():
	g.coins = g.starting_coins


func spawn_block():
	if g.coins >= 10:
		# Spawn a standard or slippery block based on a random chance
		var random_number = randi() % 10 + 1
		print("Random number: ", random_number)
		if random_number >= 7:
			spawn_slippery()
		else:
			var block_scene = block.instantiate()
			block_scene.position.x = randf_range(100, 1152)
			add_child(block_scene)
		g.coins -= 10

func spawn_sticky():
	if g.coins >= 20:
		# Spawn a sticky block
		var sticky_scene = sticky_block.instantiate()
		sticky_scene.position.x = randf_range(100, 1152)
		add_child(sticky_scene)
	g.coins -= 20

func spawn_slippery():
	# Spawn a slippery block
	var slippery_scene = slippery_block.instantiate()
	slippery_scene.position.x = randf_range(100, 1152)
	add_child(slippery_scene)

func spawn_metal():
	if g.coins >= 20:
		# Spawn a shield block
		var metal_scene = metal_block.instantiate()
		metal_scene.position.x = randf_range(100, 1152)
		add_child(metal_scene)
		g.coins -= 20

func _physics_process(delta):
	coins.text = "Coins: " + str(g.coins) 
	# Handle block spawning based on input actions
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_block()
	if Input.is_action_just_pressed("spawnSticky"):
		spawn_sticky()
	if Input.is_action_just_pressed("spawnShield"):
		spawn_metal()
	# Update the text to display the time remaining
	time.text = str(int(gamet.time_left))
	if g.coins <= 0:
		g.coins = 0

func _on_gamet_timeout():
	# Reload the current scene when the timer runs out
	get_tree().reload_current_scene()
