extends Node2D

var healt=3

func _ready() -> void:
	PLAYERDATA.healtCity=healt

func _process(delta: float) -> void:
	PLAYERDATA.healtCity=healt

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="bulletBody":
		healt=healt-1
		print("vida:"+str(healt))
	if body.name=="enemy":
		healt=healt-0.1
		print("vida:"+str(healt))
	
