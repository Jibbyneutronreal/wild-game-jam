extends CharacterBody2D

@onready var point = $Marker2D

@onready var fireball = preload("res://Scenes/fireball.tscn")
func _physics_process(delta):
	if Input.is_action_just_pressed("debugFire"):
		var fire_instance = fireball.instantiate()
		fire_instance.position.x = point.position.x
		fire_instance.position.y = point.position.y
		add_child(fire_instance)
