extends Node2D  
class_name ores
var points: float=0.0
var miniShake=false

#func process(delta):
	#if miniShake==true:
		#shake()

func shake():
	var shake_force = Vector2(
			randf_range(-50, 50),  # Fuerza horizontal aleatoria
			randf_range(-20, 20)   # Fuerza vertical aleatoria
		)
	position=shake_force
	
func revenue():
	points=randf_range(0.5,1.5)
	points = snapped(points, 0.1)  # coloca un solo decimal
	return points


func take():
	queue_free()  
