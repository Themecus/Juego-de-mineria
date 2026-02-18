extends BreakBlocks  #heredas de tu clase base

#No es nesecesario colocar todo, solo coloca las funciones heredadas que queramos modificar
#por lo demas es como si ya estuvieran aqui
func _ready():
	durability=1
	ore=preload("res://Scene/gems.tscn") 


func _process(delta):
	if dig==true:
		breaker(delta)
		
