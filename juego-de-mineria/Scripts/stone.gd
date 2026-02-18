extends BreakBlocks  #heredas de tu clase base

#No es nesecesario colocar todo, solo coloca las funciones heredadas que queramos modificar
#por lo demas es como si ya estuvieran aqui
func _ready():
	durability=1


func _process(delta):
	if dig==true:
		breaker(delta)

func breaker(delta):
	durability=durability-delta
	print(durability)
	if durability<=0:
		var ore_instance=ore.instantiate()
		queue_free()
