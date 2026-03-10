extends Node2D
var road = preload("res://Scene/stoneUnbreakable.tscn") 
var roadGenerate = [#aqui almacenaremos TODOS los tipos de cuevas que vayamos creando
	preload("res://Scene/stoneCaveSmall.tscn"),
	preload("res://Scene/stoneCaveMediun.tscn"),
	preload("res://Scene/stoneCaveBig.tscn"),
	preload("res://Scene/stoneCaveHuge.tscn"),
	preload("res://Scene/stoneCaveLong.tscn")
]#de momento solo tenemos pequeno, mediano, grande, masivo y largas
var roadInstance
var lengthRoad = 0
var probabi = 1#fijar la probabilidad de aparicion de cueva, de momento dejalo en 1
var lengthRoadMax = 70
var lengthRoadMid = 35
var blockSize = 125  # Tamaño de cada bloque 
var levelCave=0
@onready var markR = $spawningZoneRoadR
@onready var markL = $spawningZoneRoadL
@onready var spawnRoadR=$moreRoad
@onready var spawnRoadL=$moreRoad2
func _on_more_road_area_entered(area):
	if area.is_in_group("car"):
		call_deferred("generateRoadR")# 1 = derecha

func _on_more_road_2_area_entered(area):
	if area.is_in_group("car"):
		call_deferred("generateRoadL")# -1 = izquierda

#esta vaina del calldeferred lo que hace es:
#"Ejecutar esta función más tarde, cuando sea seguro hacerlo", sin esto es como dispararte al pie sin proteccion
func generateRoadR():#esta sera una version para la derecha
	var currentPosition
	var probality=randi_range(1,probabi)#aqui podemos modificar la probabilidad que aparezca una cueva
	#generationHelper()
	currentPosition = markR.position  # Guardar posición inicial derecha
	spawnRoadR.position=currentPosition
	while lengthRoad < lengthRoadMax:
		if lengthRoad==lengthRoadMid and probality==1:
			# Instanciar bloque
			var caveIndex=caveTypeLimit()
			roadInstance = roadGenerate[caveIndex].instantiate()
			roadInstance.position = currentPosition#Posicion
			add_child(roadInstance)#colocar
			# Mover la posición para el siguiente bloque
			currentPosition.x += blockSize * 1
			lengthRoad += 1
		else:
			# Instanciar bloque
			roadInstance = road.instantiate()
			roadInstance.position = currentPosition#Posicion
			add_child(roadInstance)#colocar
			# Mover la posición para el siguiente bloque
			currentPosition.x += blockSize * 1
			lengthRoad += 1
	#Actualizar la posición del marcador al final
	markR.position = currentPosition
	lengthRoad = 0
	
func generateRoadL():#esta sera una version para la izquierda
	var currentPosition
	var probality=randi_range(1,probabi)
	currentPosition = markL.position  # Guardar posición inicial Izquierda
	spawnRoadL.position=currentPosition
	while lengthRoad < lengthRoadMax:
		if lengthRoad==lengthRoadMid and probality==1:
			# Instanciar bloque
			var caveIndex=caveTypeLimit()
			roadInstance = roadGenerate[caveIndex].instantiate()
			roadInstance.position = currentPosition#Posicion
			add_child(roadInstance)#colocar
			# Mover la posición para el siguiente bloque
			currentPosition.x += blockSize * -1
			lengthRoad += 1
		else:
			# Instanciar bloque
			roadInstance = road.instantiate()
			roadInstance.position = currentPosition#Posicion
			add_child(roadInstance)#colocar
			# Mover la posición para el siguiente bloque
			currentPosition.x += blockSize * -1
			lengthRoad += 1
	#Actualizar la posición del marcador al final
	markL.position = currentPosition
	lengthRoad = 0

func caveTypeLimit()-> int:#se supone que con esto devovlera un int
	var selectedIndex = 0
	levelCave += 1
	if levelCave >= 30:
		var roll = randi() % 100
		if roll < 20:
			selectedIndex = 2  # Cueva grande (20%)
		elif roll < 70:
			selectedIndex = 3  # Cueva enorme (50%)
		else:
			selectedIndex = 4  # Cueva larga (30%)
		
	elif levelCave >= 20:
		var roll = randi() % 100
		if roll < 30:
			selectedIndex = 1  # Cueva mediana (30%)
		elif roll < 80:
			selectedIndex = 2  # Cueva grande (50%)
		else:
			selectedIndex = 3  # Cueva enorme (20%)
		
	elif levelCave >= 10:
		var roll = randi() % 100
		if roll < 40:
			selectedIndex = 0  # Cueva pequeña (40%)
		elif roll < 80:
			selectedIndex = 1  # Cueva mediana (40%)
		else:
			selectedIndex = 2  # Cueva grande (20%)
		
	elif levelCave >= 0:
		var roll = randi() % 100
		if roll < 70:
			selectedIndex = 0  # Cueva pequeña (70%)
		else:
			selectedIndex = 1  # Cueva mediana (30%)
	return selectedIndex
