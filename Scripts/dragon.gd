extends CharacterBody2D

@onready var point = $Marker2D
@onready var fireball = preload("res://Scenes/fireball.tscn")

func _ready():
	spawn_fireball_timer()

func spawn_fireball_timer():
	while true:
		await get_tree().create_timer(randf_range(2, 6)).timeout  # Wait between 0.5 to 2 seconds
		spawn_fireball()

func spawn_fireball():
	var fire_instance = fireball.instantiate()
	
	# Randomize Y coordinate within a certain range (adjust as needed)
	var y_offset = randf_range(-500, 200)
	fire_instance.position = point.position + Vector2(0, y_offset)
	
	add_child(fire_instance)
