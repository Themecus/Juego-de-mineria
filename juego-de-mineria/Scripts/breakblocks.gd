extends Node2D
class_name BreakBlocks

var dig = false
var durability=100
var delta

func breaker(delta):
	durability=durability-delta
	print(durability)
	if durability<=0:
		queue_free()

func _on_area_2d_area_entered(area: Area2D):
	if area.name == "Shovel":
		dig = true

func _on_area_2d_area_exited(area: Area2D):
	if area.name == "Shovel":
		dig = false
		

	
