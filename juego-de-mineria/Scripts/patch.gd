extends BreakBlocks  #heredas de tu clase base

#No es nesecesario colocar todo, solo coloca las funciones heredadas que queramos modificar
#por lo demas es como si ya estuvieran aqui
func _ready():
	durability=2.5#para este la durabilidad debe ser igual que el de la piedra/stone que representa


func _process(delta):
	if dig==true:
		breaker(delta)

func breaker(delta):
	durability=durability-delta*miningPower
	print(durability)
	if durability<=0:
		queue_free()
