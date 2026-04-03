extends BreakBlocks  #heredas de tu clase base

#No es nesecesario colocar todo, solo coloca las funciones heredadas que queramos modificar
#por lo demas es como si ya estuvieran aqui
func _ready():
	durability=2.5
	miningPower=PLAYERDATA.mining

	ore=preload("res://Scene/portalEntrance.tscn") 


func _process(delta):
	if dig==true:
		breakerPortal(delta)
		
