extends Control


func _on_play_pressed() -> void:
	get_tree().paused = !get_tree().paused
	$".".visible=!$".".visible


func _on_quit_pressed() -> void:
	get_tree().quit()
