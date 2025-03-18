extends CharacterBody2D

@onready var dragon = $"../dragon"
@onready var shield_block = $"../Shield_block"

func _physics_process(delta):
	velocity.x = -2000  # Move left at 50 pixels per second
	move_and_slide()
#
func _on_area_2d_body_entered(body):
	# Only remove bodies that are not part of the "Dragon" group
	if not body.is_in_group("Dragon") and body != self and not body.is_in_group("shield"):
		body.queue_free()
	elif body.is_in_group("shield"):
		self.queue_free()
	
