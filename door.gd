extends Area2D

const file_begin = "res://level/level_"

func _on_area_entered(area):
	if area.is_in_group("Player"):
		print("player collided")
		var current_scene_file = get_tree().current_scene.scene_file_path
		print(current_scene_file)
		var next_level_number = current_scene_file.to_int() + 1
		print(next_level_number)
		var next_level_path = file_begin + str(next_level_number)+".tscn"
		get_tree().change_scene_to_file(next_level_path)
