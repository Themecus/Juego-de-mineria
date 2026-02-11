extends Node2D  

var points: float=0.0

func revenue():
	points=randf_range(0.1,1.5)
	points = snapped(points, 0.1)  # coloca un solo decimal
	return points

func take():
	queue_free()  
