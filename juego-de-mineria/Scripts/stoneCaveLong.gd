extends stoneCave

func _ready():
	var roadGenerate = preload("res://Scene/stoneCaveLong.tscn") 
	durability=1
	levelDepthMax=15#con esto determinaremos la profundidad
	branchMax=16# la cantidad de ramas a trabajar
	#iguala levelDepthMax y branchMax+1 para hacer una buena cueva
	branchLimitMax=4# la cantidad de bloques indestrutibles
	LongbranchMax=3# lo largo de estas
	#branchLimitMax>LongbranchMax
