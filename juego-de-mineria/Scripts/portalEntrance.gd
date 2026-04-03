extends Node2D

var delete=0
var portalExitGlobal
func _ready() -> void:
	PLAYERDATA.portalA=position
	print("entrada")
	var exit = load("res://Scene/portalExit.tscn")
	var portalExit = exit.instantiate()
	portalExitGlobal=portalExit
	#con el load creamos el plano y el instantiate lo creamos
	portalExit.position = position + Vector2(0, 2000)#posicionamos
	get_parent().add_child(portalExit)#y generamos la cosa esta en el nodo padre actual
	#osea, en el test_zone
	



func _on_area_2d_body_entered(body: Node2D) -> void:#aqui solo cambiamos la posicion del jugador
	if PLAYERDATA.keyPortal==true:
		body.global_position=PLAYERDATA.portalB
		PLAYERDATA.keyPortal=false
		
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	PLAYERDATA.keyPortal=true
	delete=delete+1
	print(delete)
	if delete==2:
		portalExitGlobal.destroy()
		queue_free()
		
