extends Node2D


func clean():
	queue_free()

func _on_patch_tree_exiting() -> void:
	clean()
	
