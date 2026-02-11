extends CharacterBody2D

var moving_fast=400#velocidad para moverse
var interaction_zone=false
var interaction2_zone=false
var collectable=null#si quieres llaamar funciones desde otro sitio debes
#1) crear una variable nulificada
var inventory
@onready var console=$Camera2D/console
var points=0
var nameOre=""


func _ready():
	var inventoryClass = load("res://Scripts/inventory.gd")#con esto podemos llamar scripts que no tengan nodos asociados
	inventory = inventoryClass.new()  # Crear NUEVA instancia

func _process(delta):
	console.updateData(inventory)#la info de actualiza constantemente en console
	action(delta)#aqui iran todas las acciones de nuestro pj

func action(delta):
	moving(delta)#esta sera de movimiento
	touch(delta)#aqui donde interaccione
	if Input.is_action_just_pressed("console"):
		console.dataVisible()



func touch(delta):
	if interaction_zone==true and Input.is_action_just_pressed("Touch"):
		points=collectable.revenue()
		inventory.oresUp(points,nameOre)
		collectable.take()#3) tienes via libre para llamar sus funciones


func moving(delta):
	var direction=Input.get_vector("Left","Right", "Up","Down")#tomamos todas las entradas
	velocity=direction*moving_fast#y las multiplicamos con la velocidad
	move_and_slide()#motor de movimiento


func _on_area_2d_area_entered(area):#colocar en un grupo de cosas que solo se pueden iteractuar
	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems":#ten siempre en cuenta los nombres de cada nodo para llamarlos
		nameOre=area.name
		collectable=area.get_parent()#2)usar alguna referencia como area y meter el get parent para conseguir el nodo principial donde esta el script
		interaction_zone=true



func _on_area_2d_area_exited(area):
	if area.name=="Gold" or area.name=="Iron" or area.name=="Gems":
		interaction_zone=false
