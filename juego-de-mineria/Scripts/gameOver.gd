extends Control


func _on_continue_pressed() -> void:
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://Scene/test_zone.tscn")


func _on_end_pressed() -> void:
		get_tree().quit()
