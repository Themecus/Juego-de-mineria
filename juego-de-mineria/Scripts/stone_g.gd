extends BreakBlocks  #heredas de tu clase base

#No es nesecesario colocar todo, solo coloca las funciones heredadas que queramos modificar
#por lo demas es como si ya estuvieran aqui
func _ready():
	durability=1
	ore=preload("res://Scene/gold.tscn") 


func _process(delta):
	if dig==true:
		breaker(delta)
		
func breaker(delta):
	durability=durability-delta
	print(durability)
	if durability<=0:
		var ore_instance=ore.instantiate()
		ore_instance.position=position
		get_parent().add_child(ore_instance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
		#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
		queue_free()
