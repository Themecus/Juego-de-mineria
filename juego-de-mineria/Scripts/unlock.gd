extends RigidBody2D
class_name unlocks
var touching_ground: bool = false
var air_time: float = 0.0

func _process(delta):
	if touching_ground:
		air_time = 0.0
	else:
		air_time += delta
		# Aplicar sacudida mientras está en el aire (pasamos delta)
		apply_air_shake(delta)

func _on_area_2d_area_entered(area: Area2D) -> void:
	# Verificar si el área que detectamos es suelo
	if area.is_in_group("floor"):
		touching_ground = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	# Verificar si el área que dejamos es suelo
	if area.is_in_group("floor"):
		touching_ground = false

func apply_air_shake(delta):
	# Sacudida basada en el tiempo en el aire
	var shake_intensity = min(air_time * 50, 200)  # Aumenta con el tiempo, máximo 200
	
	# Aplicar fuerza aleatoria para sacudir
	var shake_force = Vector2(
		randf_range(-shake_intensity, shake_intensity),
		randf_range(-shake_intensity * 0.3, shake_intensity * 0.3)  # Menos vertical
	)
	# Aplicar la fuerza al RigidBody usando delta
	apply_central_impulse(shake_force * delta)
