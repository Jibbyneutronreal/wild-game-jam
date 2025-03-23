extends Area2D

var leftward_wind = Vector2(300000, 0)
var rightward_wind = Vector2(300000, 0)
var move_speed = 1600  # Speed of wind movement
var direction = -1  # Start moving leftward (-1 for left, 1 for right)
@onready var sprite = $wind_art

func right_wind(body):
	body.apply_force(rightward_wind, Vector2.ZERO)

func left_wind(body):
	body.apply_force(leftward_wind, Vector2.ZERO)

func _on_body_entered(body):
	if body is RigidBody2D:
		if sprite.flip_h == false:
			right_wind(body)
		else:
			left_wind(body)

func _process(delta):
	position.x += move_speed * direction * delta
	if direction == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
		






		

		
  
