extends CollisionShape2D


func _on_door_2_area_entered(area):
	get_tree().change_scene_to_file("res://level/end_level.tscn")
