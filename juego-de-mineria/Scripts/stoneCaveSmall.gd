extends BreakBlocks
class_name stoneCave
@onready var positionInitial = $StaticBody2D/down# El marker en la parte SUPERIOR del generador


var caveScene = [preload("res://Scene/preCaves/stuffedCave/stuffCave1.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave3.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave4.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave5.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave6.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave7.tscn"),
				 preload("res://Scene/preCaves/stuffedCave/stuffCave8.tscn")]

var oreScene = [
	preload("res://Scene/preCaves/oreCave/oreCave1.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave2.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave3.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave4.tscn"),   
	preload("res://Scene/preCaves/oreCave/oreCave5.tscn"),   
	preload("res://Scene/preCaves/oreCave/oreCave6.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave7.tscn"),   
	preload("res://Scene/preCaves/oreCave/oreCave8.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave9.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave10.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave11.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave12.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave13.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave14.tscn"),  
	preload("res://Scene/preCaves/oreCave/oreCave15.tscn")]
	
var levelDepthMax=3#con esto determinaremos la profundidad
var branchMax=4# la cantidad de ramas a trabajar
#iguala levelDepthMax y branchMax+1 para hacer una buena cueva
var levelDepth=0
var branch=0# la cantidad de ramas a trabajar
var Longbranch=0# lo largo de estas
var branchLimitMax=3# la cantidad de bloques indestrutibles
var LongbranchMax=2# lo largo de estas
#branchLimitMax>LongbranchMax

# Array para guardar todas las cuevas generadas
var cavesArray = []
var cavesArrayR = []#registraremos las ramas de la derecha para poner muros indestrutibles
var cavesArrayL = []#registraremos las ramas de la izquierda para poner muros indestrutibles

func _ready():
	durability=1

func _process(delta):
	if dig == true:
		breaker(delta)

func breaker(delta):
	durability -= delta
	print(durability)
	
	if durability <= 0:
		generationInitial()#aqui colocaremos en primer bloque cueva
		queue_free()

func rouletteStoneInitial():
	var roll=randi_range(0,6)
	return roll


func rouletteStone():
	var roll = randi_range(1, 100)  # 1 a 100
	var stone = null
	
	if roll <= 50:  # 50% tierra 
		stone = caveScene[0].instantiate()
		return stone
	elif roll <= 80:  # 30% minerales 
		var roll2 = randi_range(0, oreScene.size() - 1)
		stone = oreScene[roll2].instantiate()
		return stone
	else:  # 20% obstáculos 
		var roll2 = rouletteStoneInitial()  # 0-6
		stone = caveScene[roll2].instantiate()
		return stone


func generationInitial():
	var caveNew = caveScene[rouletteStoneInitial()].instantiate()
	var caveUp = caveNew.get_node("up")#tomamos la posicion del mark de arriba
	var nextP=caveNew.get_node("down")#tomamos la posicion del mark de abajo para la siguiente ronda
	get_parent().add_child(caveNew)#colocamos la cueva
	caveNew.global_position = positionInitial.global_position - caveUp.position#colocamos la cueva con coordenadas que queden lado a lado
	register_cave(caveNew)
	generationPillar(nextP)#aqui lo generaremos una torre como base desde el primer bloque colocando a abajo

func generationPillar(nextP):
	while levelDepth<levelDepthMax:#repetimos el conceto basado en levelDepthMax
		var caveNew = rouletteStone()
		var caveUp = caveNew.get_node("up")
		get_parent().add_child(caveNew)
		caveNew.global_position = nextP.global_position - caveUp.position
		levelDepth+=1
		nextP=caveNew.get_node("down")
		register_cave(caveNew)
	levelDepth=0
	generationR()
	generationL()
	generationFloor()

func generationFloor():
	var lastIndex = cavesArray.size() -1#la penultima cueva
	var penultIndex = cavesArray.size() - 2#la antepennultima
	
	var lastCave = cavesArray[lastIndex]#sacamos informacion del array con las cooordenadas de arriba
	var penultCave = cavesArray[lastIndex]#sacamos informacion del array con las cooordenadas de arriba
	
	var startMarker = penultCave.down#tomamos la posicion de abajo
	var currentMarker = startMarker#lo guardamos en una mejor variable
	
	var distance = lastCave.position.y - penultCave.position.y#hacemos los calculos de colocacion
	var blocksNeeded = max(1, int(abs(distance) / 100))
	
	var floorScene = preload("res://Scene/preCaves/stuffedCave/stuffCave2.tscn")#tomamos el bloque imrrompible
	var floorBlocks = []#creamos un array para guarda los pisos creados
	
	for i in range(blocksNeeded):#usamos la logica del principio para colocar bloques
		var newFloor = floorScene.instantiate()
		var oppositeMarker = newFloor.get_node("up")
		var targetPos = currentMarker.global_position - oppositeMarker.position
		
		get_parent().add_child(newFloor)
		newFloor.global_position = targetPos
		
		floorBlocks.append(newFloor)
		currentMarker = newFloor.get_node("down")
	
	var wallScene = preload("res://Scene/preCaves/stuffedCave/stuffCave2.tscn")
	var wallLimit = branchLimitMax#cuantos colocaremos lado a lado
	
	for block in floorBlocks:#Para cada bloque de piso, obtenemos sus markers laterales.
		var leftMarker = block.get_node("left")
		var rightMarker = block.get_node("right")
		
		var currentLeftMarker = leftMarker
		for i in range(wallLimit):#ya despues usamos la misma logica de colocacion derecha y izquierda
			var newWall = wallScene.instantiate()
			var oppositeMarker = newWall.get_node("right")
			var targetPos = currentLeftMarker.global_position - oppositeMarker.position
			
			get_parent().add_child(newWall)
			newWall.global_position = targetPos
			currentLeftMarker = newWall.get_node("left")
		
		var currentRightMarker = rightMarker
		for i in range(wallLimit):#ya despues usamos la misma logica de colocacion derecha y izquierda
			var newWall = wallScene.instantiate()
			var oppositeMarker = newWall.get_node("left")
			var targetPos = currentRightMarker.global_position - oppositeMarker.position
			
			get_parent().add_child(newWall)
			newWall.global_position = targetPos
			currentRightMarker = newWall.get_node("right")

func generationL():# tanto generationL y generationR se encargan de generar las alas a la cueva
	var usedIndices = []
	var maxIndex = cavesArray.size()
	var localBranch = 0  # Variable LOCAL para esta función
	var localBranchMax = branchMax  # Usamos el valor global como referencia
	while localBranch < localBranchMax and usedIndices.size() < maxIndex:
		if usedIndices.size() >= cavesArray.size():
			break
		
		var availableIndices = []
		for i in range(maxIndex):
			if not i in usedIndices:
				availableIndices.append(i)
		
		if availableIndices.size() == 0:
			break
		
		var sourceIndex = availableIndices[randi() % availableIndices.size()]
		var sourceCaveData = cavesArray[sourceIndex]
		
		if sourceCaveData.left == null:
			usedIndices.append(sourceIndex)
			continue
		
		usedIndices.append(sourceIndex)
		
		var currentMarker = sourceCaveData.left
		var localLongBranchMax = randi_range(1, LongbranchMax)
		var localLongBranch = 0  # Variable LOCAL
		
		while localLongBranch < localLongBranchMax:
			var newCave = rouletteStone()
			var oppositeMarker = newCave.get_node("right")
			var targetPos = currentMarker.global_position - oppositeMarker.position
			
			get_parent().add_child(newCave)
			newCave.global_position = targetPos
			#register_cave(newCave)  # ← IMPORTANTE: registrar la cueva pero mantenerlo vigilado
			currentMarker = newCave.get_node("left")
			localLongBranch += 1
		generationL2(currentMarker, localLongBranchMax)
		localBranch += 1

func generationL2(sourceCaveData,brachLimit):# tanto generationL2 y generationR2 usan logica de los anteriores para crear paredes inrrompibles
	var currentMarker = sourceCaveData
	var longBranchMax = branchLimitMax
	var localLongBranch = 0  # Variable LOCAL
	while localLongBranch < longBranchMax-brachLimit:
		var caveScene2 = preload("res://Scene/preCaves/stuffedCave/stuffCave2.tscn")
		var newCave = caveScene2.instantiate()
		var oppositeMarker = newCave.get_node("right")
		var targetPos = currentMarker.global_position - oppositeMarker.position
		get_parent().add_child(newCave)
		newCave.global_position = targetPos
		currentMarker = newCave.get_node("left")
		localLongBranch += 1

func generationR():
	var usedIndices = []
	var maxIndex = cavesArray.size()
	var localBranch = 0
	
	while localBranch < branchMax and usedIndices.size() < maxIndex:
		if usedIndices.size() >= cavesArray.size():
			break
		
		var availableIndices = []
		for i in range(maxIndex):
			if not i in usedIndices:
				availableIndices.append(i)
		
		if availableIndices.size() == 0:
			break
		
		var sourceIndex = availableIndices[randi() % availableIndices.size()]
		var sourceCaveData = cavesArray[sourceIndex]
		
		if sourceCaveData.right == null:
			usedIndices.append(sourceIndex)
			continue
		
		usedIndices.append(sourceIndex)
		
		var currentMarker = sourceCaveData.right
		var localLongBranchMax = randi_range(1, LongbranchMax)
		var localLongBranch = 0
		
		while localLongBranch < localLongBranchMax:
			var newCave = rouletteStone()
			var oppositeMarker = newCave.get_node("left")
			var targetPos = currentMarker.global_position - oppositeMarker.position
			get_parent().add_child(newCave)
			newCave.global_position = targetPos
			currentMarker = newCave.get_node("right")
			localLongBranch += 1
		generationR2(currentMarker, localLongBranchMax)
		localBranch += 1

func generationR2(sourceCaveData,brachLimit):
	var currentMarker = sourceCaveData
	var longBranchMax = branchLimitMax
	var localLongBranch = 0  # Variable LOCAL
	while localLongBranch < longBranchMax-brachLimit:
		var caveScene2 = preload("res://Scene/preCaves/stuffedCave/stuffCave2.tscn")
		var newCave = caveScene2.instantiate()
		var oppositeMarker = newCave.get_node("left")
		var targetPos = currentMarker.global_position - oppositeMarker.position
		get_parent().add_child(newCave)
		newCave.global_position = targetPos
		currentMarker = newCave.get_node("right")
		localLongBranch += 1

# Función para guardar la información de cada cueva
func register_cave(cave):
	# Obtener los markers
	var leftMarker = cave.get_node("left")
	var rightMarker = cave.get_node("right")
	var upMarker = cave.get_node("up")
	var downMarker = cave.get_node("down")
	
	# Crear un diccionario con la información
	var caveData = {
		"node": cave,                    # La referencia a la cueva
		"position": cave.global_position, # Su posición global
		"left": leftMarker,              # Marker izquierdo
		"right": rightMarker,            # Marker derecho
		"up": upMarker,                  # Marker arriba
		"down": downMarker,              # Marker abajo
	}
	cavesArray.append(caveData)# Guardamos la infromcion de la cueva aqui
