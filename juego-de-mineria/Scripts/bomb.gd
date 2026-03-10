extends Node2D
class_name bomb

func exploded():
	await get_tree().create_timer(1.0).timeout
	queue_free()


func _on_rigid_body_2d_body_entered(body):
	await exploded() 
	pass
