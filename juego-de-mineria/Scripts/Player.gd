extends CharacterBody2D

var moving_fast=400#velocidad para moverse
var interaction_zone=false
#var collectable=null#si quieres llaamar funciones desde otro sitio debes
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
	if Input.is_action_pressed("Sack") and inventory.total < limitOres:
		
		# esto sera un acumulador de los diferentes minerales que encontremos
		# Agarrandolos de un golpe y poder guardar muchos a la vez
		var resources = {
			"Gold": 0,
			"Iron": 0,
			"Gems": 0
		}
		var oreDelete = []

		# Recolectar todas las areas
		for area in $Bag.get_overlapping_areas():
			
			#Tener al dia el peso para ver si podemos proceder
			if inventory.total>= limitOres:
				break
			
			# Verificar por nombre exacto de las areas
			var ore_name = area.name
			
			if ore_name == "Gold" or ore_name == "Iron" or ore_name == "Gems" or ore_name == "Gold2" or ore_name == "Iron2" or ore_name == "Gems2":
				
				#si ves un dos quiere decir que se refiere al body y no area
				var mineral = area.get_parent()
				if is_instance_valid(mineral) and mineral.has_method("revenue"):
					# Obtener el tipo area o body
					var tipo_base = ore_name
					if ore_name == "Gold2":
						tipo_base = "Gold"
					elif ore_name == "Iron2":
						tipo_base = "Iron"
					elif ore_name == "Gems2":
						tipo_base = "Gems"
					
					resources[tipo_base] += mineral.revenue()
					oreDelete.append(mineral)
		# Recolectar todos los cuerpos

		for body in $Bag.get_overlapping_bodies():
			#Tener al dia el peso para ver si podemos proceder
			if inventory.total>= limitOres:
				break
			
			# Verificar por nombre exacto de los body
			var body_name = body.name
			if body_name == "Gold" or body_name == "Iron" or body_name == "Gems" or body_name == "Gold2" or body_name == "Iron2" or body_name == "Gems2":
				var mineral = body.get_parent()
				if is_instance_valid(mineral) and mineral.has_method("revenue"):
					# Obtener el tipo area o body
					var tipo_base = body_name
					if body_name == "Gold2":
						tipo_base = "Gold"
					elif body_name == "Iron2":
						tipo_base = "Iron"
					elif body_name == "Gems2":
						tipo_base = "Gems"
					
					resources[tipo_base] += mineral.revenue()
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
			oresCloset = $Bag.get_overlapping_areas().size() + $Bag.get_overlapping_bodies().size()


func moving(delta):
	var direction=Input.get_vector("Left","Right", "Up","Down")#tomamos todas las entradas
	velocity=direction*moving_fast#y las multiplicamos con la velocidad
	move_and_slide()#motor de movimiento


func _on_bag_area_entered(area: Area2D) -> void:#colocar en un grupo de cosas que solo se pueden iteractuar

	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems" or area.name=="Gold2" or area.name=="Iron2" or area.name=="Gems2":#ten siempre en cuenta los nombres de cada nodo para llamarlos
		
		nameOre=area.name
		oresCloset += 1
		#collectable = area.get_parent()#2)usar alguna referencia como area y meter el get parent para conseguir el nodo principial donde esta el script
	if area.name=="Vault":
		inventory.total=0#limpiamos el inventario total cuando se vacie para que pueda atrapar massa
		vault.gold += inventory.gold
		vault.iron += inventory.iron
		vault.gems += inventory.gems
		inventory.gold = 0
		inventory.iron = 0
		inventory.gems = 0


func _on_bag_area_exited(area: Area2D) -> void:
	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems" or area.name=="Gold2" or area.name=="Iron2" or area.name=="Gems2":
		oresCloset -= 1
		if oresCloset <= 0:
			oresCloset = 0


func _on_bag_body_entered(body: Node2D) -> void:
	if body.name=="Gold" or body.name=="Iron" or body.name=="Gems" or body.name=="Gold2" or body.name=="Iron2" or body.name=="Gems2":#ten siempre en cuenta los nombres de cada nodo para llamarlos

		nameOre=body.name
		oresCloset += 1
		#collectable = body.get_parent()#2)usar alguna referencia como area y meter el get parent para conseguir el nodo principial donde esta el script
	if body.name=="Vault":
		inventory.total=0#limpiamos el inventario total cuando se vacie para que pueda atrapar massa
		vault.gold += inventory.gold
		vault.iron += inventory.iron
		vault.gems += inventory.gems
		inventory.gold = 0
		inventory.iron = 0
		inventory.gems = 0


func _on_bag_body_exited(body: Node2D) -> void:
	if body.name=="Gold" or body.name=="Iron" or body.name=="Gems" or body.name=="Gold2" or body.name=="Iron2" or body.name=="Gems2":
		oresCloset -= 1
		if oresCloset <= 0:
			oresCloset = 0
