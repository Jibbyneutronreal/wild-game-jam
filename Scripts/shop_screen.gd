extends Control


func _on_back_to_end_pressed():
	get_tree().change_scene_to_file("res://end_screen.tscn")

func _on_coin_upgrade_pressed():
	g.starting_coins += 10
