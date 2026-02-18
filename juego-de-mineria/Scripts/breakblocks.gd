extends Node2D
class_name BreakBlocks

var dig = false
var durability=5
var delta
var ore=preload("res://Scene/iron.tscn") 

func breaker(delta):
	durability=durability-delta
	print(durability)
	if durability<=0:
		var ore_instance=ore.instantiate()
		ore_instance.position=position
		get_parent().add_child(ore_instance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
		#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
		queue_free()

func _on_area_2d_area_entered(area: Area2D):
	if area.name == "Shovel":
		dig = true

func _on_area_2d_area_exited(area: Area2D):
	if area.name == "Shovel":
		dig = false
		

	
