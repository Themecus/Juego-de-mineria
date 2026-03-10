extends Control


func _on_play_pressed() -> void:
	get_tree().paused = !get_tree().paused
	$".".visible=!$".".visible
