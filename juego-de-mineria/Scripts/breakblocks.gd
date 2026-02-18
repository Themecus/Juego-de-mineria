extends Node2D
class_name BreakBlocks

var dig = false
var durability=5
var delta
var ore=preload("res://Scene/iron.tscn") 
var ore_instance
var capacity=0

func breaker(delta):
	durability=durability-delta
	print(durability)
	if durability<=0:
		var numberOfOres=randi_range(1,4)
		while capacity<numberOfOres:
			var variation=Vector2(randf_range(-50,50),randf_range(-50,50))#esto actuara para que varie la ubicacion
			#de dropeo de mineraels
			ore_instance=ore.instantiate()
			ore_instance.position=position+variation
			get_parent().add_child(ore_instance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
			#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
			capacity+=1
		queue_free()

func _on_area_2d_area_entered(area: Area2D):
	if area.name == "Shovel":
		dig = true

func _on_area_2d_area_exited(area: Area2D):
	if area.name == "Shovel":
		dig = false
		

	
