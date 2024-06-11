extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://level/level_1.tscn")

func _on_exit_quit_pressed():
	get_tree().quit()
