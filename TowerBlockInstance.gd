extends CharacterBody2D

var tower_block = preload("res://Block.tscn")

func _ready():
	blockinstance()
func blockinstance():

	var tower_block_instance = tower_block.instantiate()  
	get_tree().root.add_child(tower_block_instance)
	print("instanced")

func _process(_delta) -> void:
	if Input.is_action_just_pressed("LeftClick"):
		blockinstance()
