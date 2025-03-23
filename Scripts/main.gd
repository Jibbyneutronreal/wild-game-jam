extends Node2D

@onready var block = preload("res://Scenes/Block.tscn")
@onready var sticky_block = preload("res://Scenes/sticky_block.tscn")
@onready var slippery_block = preload("res://Scenes/Slippery_block.tscn")
@onready var metal_block = preload("res://Scenes/metal_block.tscn")
@onready var wind = preload("res://Scenes/Wind.tscn")
@onready var switch_block = preload("res://Scenes/switch_block.tscn")
@onready var gamet = $gamet
@onready var time = $text/time
@onready var coins = $text/coins
@onready var waves = $text/waves

func _ready():
	g.coins = g.starting_coins
func spawn_switch():
	if g.coins >= 20:
		var switch_scene = switch_block.instantiate()
		switch_scene.position.x = randf_range(100, 1152)
		add_child(switch_scene)
func spawn_block():
	if g.coins >= 10:
		# Spawn a standard or slippery block based on a random chance
		var random_number = randi() % 10 + 1
		print("Random number: ", random_number)
		if random_number >= 2:
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
		
func spawn_right_wind():
	var wind_scene = wind.instantiate()
	wind_scene.position.y = randf_range(-178, 811)
	wind_scene.position.x = 1353
	wind_scene.direction = -1  # Set initial direction
	add_child(wind_scene)


func spawn_left_wind():
	var wind_scene = wind.instantiate()
	wind_scene.position.y = randf_range(-178, 811)
	wind_scene.position.x = -831
	wind_scene.direction = 1
	add_child(wind_scene)

func _physics_process(delta):
	coins.text = "Coins: " + str(g.coins) 
	waves.text = "Wave " + str(g.wave)
	# Handle block spawning based on input actions
	if Input.is_action_just_pressed("spawnBlock"):
		spawn_block()
	if Input.is_action_just_pressed("spawnShield"):
		spawn_metal()
	if Input.is_action_just_pressed("spawnSwitch"):
		spawn_switch()
	if Input.is_action_just_pressed("rightWind"):
		spawn_right_wind()
	if Input.is_action_just_pressed("leftWind"):
		spawn_left_wind()
	# Update the text to display the time remaining
	time.text = str(int(gamet.time_left))
	if g.coins <= 0:
		g.coins = 0

func _on_gamet_timeout():
	get_tree().reload_current_scene()
	
