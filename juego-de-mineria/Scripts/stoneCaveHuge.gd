extends stoneCave

func _ready():
	var roadGenerate = preload("res://Scene/stoneCaveHuge.tscn") 
	durability=1
	levelDepthMax=5#con esto determinaremos la profundidad
	branchMax=6# la cantidad de ramas a trabajar
	#iguala levelDepthMax y branchMax+1 para hacer una buena cueva
	branchLimitMax=12# la cantidad de bloques indestrutibles
	LongbranchMax=11# lo largo de estas
	#branchLimitMax>LongbranchMax
