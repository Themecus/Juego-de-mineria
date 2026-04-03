extends RigidBody2D

var rebound=false
var directional = 1
var velocity=100#modificaciones de velocidad
@onready var locationCity = $"../../city"#ubicacion de la ciudad

func _ready():
	sleeping = false#para que no se duerma

func _process(delta):
	if !rebound:
		cityPosi()
	linear_velocity.x = directional * velocity#aqui se ira moviendo

func cityPosi():
	# Comparar posiciones globales paraq decidir direcciones
	if global_position.x < locationCity.global_position.x:
		directional = 1   # Mover a la derecha
	else:
		directional = -1  # Mover a la izquierda

func _on_area_2d_area_entered(area: Area2D) -> void:
	await get_tree().create_timer(0.7).timeout
	$"../rebound".start()
	rebound=true
	directional = directional * -1


func _on_rebound_timeout() -> void:
	rebound=false
