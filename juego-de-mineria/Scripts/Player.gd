extends CharacterBody2D

var moving_fast=400#velocidad para moverse
var interaction_zone=false
var collectable=null#si quieres llaamar funciones desde otro sitio debes
#1) crear una variable nulificada
var inventory#el inventario personal del usuario, limitado
var vault#el inventario donde guardaremos los minerales, ilimitado
@onready var console=$Camera2D/console
var points=0
var nameOre=""
var limitOres=10
var oresCloset=0


func _ready():
	var inventoryClass = load("res://Scripts/inventory.gd")#con esto podemos llamar scripts que no tengan nodos asociados
	inventory = inventoryClass.new()  # Crear NUEVA instancia
	vault = inventoryClass.new()  

func _process(delta):
	console.updateData(inventory)#la info de actualiza constantemente en console
	console.updateDataVault(vault)#la info de actualiza constantemente en console
	action(delta)#aqui iran todas las acciones de nuestro pj


func action(delta):
	moving(delta)#esta sera de movimiento
	touch(delta)#aqui donde interaccione
	if Input.is_action_just_pressed("console"):
		console.dataVisible()

func touch(delta):
	if Input.is_action_just_pressed("Touch") and inventory.total < limitOres:
		# esto sera un acumulador de los diferentes minerales que encontremos
		# Agarrandolos de un golpe y poder guardar muchos a la vez
		var resources = {
			"Gold": 0,
			"Iron": 0,
			"Gems": 0
		}
		var oreDelete = []
		
		# Recolectar todos los resources
		for area in $Area2D.get_overlapping_areas():
			#Tener al dia el peso para ver si podemos proceder
			if inventory.total>= limitOres:
				break
				
			if area.name in resources.keys():
				var mineral = area.get_parent()
				if is_instance_valid(mineral):
					resources[area.name] += mineral.revenue()
					oreDelete.append(mineral)
		
		# Hacer el calculo en un frame
		if oreDelete.size() > 0:
			# lo colocamos al inventario
			for tipo in resources:
				if resources[tipo] > 0:
					inventory.oresUp(resources[tipo], tipo)#sumos todos de un golpe
			
			# Volamos/eliminamos todos los minerales que tengamos al calnce tras el calculo
			for mineral in oreDelete:
				if is_instance_valid(mineral):
					mineral.take()
			#Actualizar contador de minerales cerca
			oresCloset = $Area2D.get_overlapping_areas().size()


func moving(delta):
	var direction=Input.get_vector("Left","Right", "Up","Down")#tomamos todas las entradas
	velocity=direction*moving_fast#y las multiplicamos con la velocidad
	move_and_slide()#motor de movimiento


func _on_area_2d_area_entered(area):#colocar en un grupo de cosas que solo se pueden iteractuar
	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems":#ten siempre en cuenta los nombres de cada nodo para llamarlos
		nameOre=area.name
		oresCloset += 1
		collectable = area.get_parent()#2)usar alguna referencia como area y meter el get parent para conseguir el nodo principial donde esta el script
	if area.name=="Vault":
		inventory.total=0#limpiamos el inventario total cuando se vacie para que pueda atrapar massa
		vault.gold += inventory.gold
		vault.iron += inventory.iron
		vault.gems += inventory.gems
		inventory.gold = 0
		inventory.iron = 0
		inventory.gems = 0

func _on_area_2d_area_exited(area):
	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems":
		oresCloset -= 1
		if oresCloset <= 0:
			oresCloset = 0
