extends Node2D

var road = preload("res://Scene/stoneUnbreakable.tscn") 
var roadInstance
var lengthRoad = 0
var blockSize = 100  # Tamaño de cada bloque 

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
	currentPosition = markR.position  # Guardar posición inicial derecha
	spawnRoadR.position=currentPosition
	while lengthRoad < 16:
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
	currentPosition = markL.position  # Guardar posición inicial Izquierda
	spawnRoadL.position=currentPosition
	while lengthRoad < 16:
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
