extends stoneCave

func _ready():
	var roadGenerate = preload("res://Scene/stoneCaveBig.tscn") 
	durability=1
	levelDepthMax=6#con esto determinaremos la profundidad
	branchMax=7# la cantidad de ramas a trabajar
	#iguala levelDepthMax y branchMax+1 para hacer una buena cueva
	branchLimitMax=5# la cantidad de bloques indestrutibles
	LongbranchMax=4# lo largo de estas
	#branchLimitMax>LongbranchMax
