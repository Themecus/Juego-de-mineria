extends CharacterBody2D

var moving_fast=400#velocidad para moverse
var interaction_zone=false

func _process(delta):
	action(delta)#aqui iran todas las acciones de nuestro pj

func action(delta):
	moving(delta)#esta sera de movimiento
	touch(delta)
	
func touch(delta):
	if interaction_zone==true and Input.is_action_just_pressed("Touch"):
		print("hola")


func moving(delta):
	var direction=Input.get_vector("Left","Right", "Up","Down")#tomamos todas las entradas
	velocity=direction*moving_fast#y las multiplicamos con la velocidad
	move_and_slide()#motor de movimiento


func _on_area_2d_area_entered(area):#colocar en un grupo de cosas que solo se pueden iteractuar
	interaction_zone=true


func _on_area_2d_area_exited(area):
	interaction_zone=false
