extends Node2D
class_name bomb
@onready var rigid_body = $RigidBody2D
func exploded():
	await get_tree().create_timer(1.0).timeout
	queue_free()

func _on_rigid_body_2d_body_entered(body):
	await exploded() 
	pass


func _on_explosion_zone_area_exited(area):
	# Despertar el motor de físicas
	rigid_body.sleeping = false
	# Aplicar pequeñas fuerzas aleatorias (sacudida)
	for i in range(1):  
		var fuerza = Vector2(
			randf_range(-1, 1),
			randf_range(-1, 1)
		)
		rigid_body.apply_central_impulse(fuerza)
