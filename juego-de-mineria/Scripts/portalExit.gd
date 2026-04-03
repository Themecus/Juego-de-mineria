extends Node2D

func _ready() -> void:
	PLAYERDATA.portalB=position
	print("salida")

func _on_area_2d_body_entered(body: Node2D) -> void:#aqui solo cambiamos la posicion del jugador
	if PLAYERDATA.keyPortal==true:
		body.global_position=PLAYERDATA.portalA
		PLAYERDATA.keyPortal=false

func destroy(): #borra el portal
	queue_free()
