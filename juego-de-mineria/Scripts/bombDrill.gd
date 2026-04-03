extends bomb

func exploded():
	await get_tree().create_timer(3.0).timeout
	queue_free()

func _on_drill_zone_area_exited(area):#esto es para que no se quede flotando en el aire
	# Despertar el motor de físicas
	rigid_body.sleeping = false
	# Aplicar pequeñas fuerzas aleatorias (sacudida)
	for i in range(1):  
		var fuerza = Vector2(
			randf_range(-1, 1),
			randf_range(-1, 1)
		)
		rigid_body.apply_central_impulse(fuerza)
