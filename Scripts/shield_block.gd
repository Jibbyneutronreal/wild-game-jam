extends RigidBody2D

var tower_block = preload("res://Scenes/shield_block.tscn")
var last_block_y = 680
var block_gap = 125
var grav = 300
var numberBlocks = 5
var is_stuck = false
var stick_to_body = null
@onready var wall = $"../StaticBody2D"
@onready var shield_mouse_detect = $ShieldMouseDetect
@onready var shield_block = $"."

func _ready():
	contact_monitor = true
	max_contacts_reported = 10

func blockinstance():
	if numberBlocks > 0:
		var tower_block_instance = tower_block.instantiate()
		get_tree().root.add_child(tower_block_instance)
		tower_block_instance.global_position = Vector2(global_position.x, last_block_y - block_gap)
		last_block_y -= block_gap
		numberBlocks -= 1

func _process(delta):
	if numberBlocks < 0:
		numberBlocks = 0

func _physics_process(delta):
	if not is_stuck:
		position.y += grav * delta

# Fix: Use a short delay before freeing the body to prevent immediate deletion
func _on_shield_killer_body_entered(body):
	if body != wall and !shield_mouse_detect and !shield_block:
		print("Shield killer hit:", body.name)
		body.call_deferred("queue_free")  # Use call_deferred to avoid physics callback errors

func _on_shield_killer_area_entered(area):
	if area != wall and !shield_mouse_detect and !shield_block:
		print("Shield killer hit area:", area.name)
		area.call_deferred("queue_free")  # Ensure safe deletion
