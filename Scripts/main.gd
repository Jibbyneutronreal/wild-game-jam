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
	g.wave = 1



func _process(delta: float) -> void:
	coins.text = "Coins: " + str(g.coins) 
	waves.text = "Wave " + str(g.wave)
	time.text = str(int(gamet.time_left))
	if g.coins <= 0:
		g.coins = 0




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

func spawn_5leftwinds():
	spawn_left_wind()
	spawn_left_wind()
	spawn_left_wind()
	spawn_left_wind()
	spawn_left_wind()

func _on_block_pressed() -> void:
	if g.coins >= 20:
		var random_number = randi() % 10 + 1
		print("Random number: ", random_number)
		g.coins -= 20
		if random_number >= 9:
			spawn_slippery()
		else:
			var block_scene = block.instantiate()
			block_scene.position.x = randf_range(100, 1152)
			add_child(block_scene)

func _on_shield_pressed() -> void:
	if g.coins >= 50:
		var shield_scene = metal_block.instantiate()
		shield_scene.position.x = randf_range(100, 1152)
		add_child(shield_scene)
		g.coins -= 50

func _on_switcher_pressed() -> void:
	if g.coins >= 200:
		var switch_scene = switch_block.instantiate()
		switch_scene.position.x = randf_range(100, 1152)
		add_child(switch_scene)
		g.coins -= 200

func startwave():
	var amountwinds = g.wave 
	for i in range(amountwinds):
		spawn_5leftwinds()

func spawn_slippery():
	var slippery_scene = slippery_block.instantiate()
	slippery_scene.position.x = randf_range(100, 1152)
	add_child(slippery_scene)

func _on_gamet_timeout() -> void:
	startwave()
	g.coins += 100 + g.wave/2
	g.wave += 1 
	
