extends Control

@onready var passing = $passing_failing


func _process(delta: float) -> void:
	if g.passcondition == true:
		passing.text = "passing"
	else:
		passing.text = "failing"
