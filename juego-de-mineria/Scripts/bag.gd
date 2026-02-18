extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var player = get_parent()
@export var max_distance = 100
@export var zone_lifetime = 0.3  #tiempo de vida de la zona

func _ready():
	visible = false# para la visibidad, por defecto no tendra
	collision_shape.disabled = true#y su colision esta apagada por defecto

func _input(event):
	if event.is_action_pressed("Sack"):#si el boton del saco se presiona se crea la zona temporal
		create_temp_zone()

func create_temp_zone():
	# Posicionar en el mouse
	var mouse_pos = get_global_mouse_position()
	var player_pos = player.global_position
	var direction = (mouse_pos - player_pos).normalized()
	var distance = min(player_pos.distance_to(mouse_pos), max_distance)
	
	global_position = player_pos + (direction * distance)
	rotation = (mouse_pos - global_position).angle()
	
	# Se vuelve visible y recupera colision
	visible = true
	collision_shape.disabled = false
	
	# Contandor para removerlo otra vez
	await get_tree().create_timer(zone_lifetime).timeout
	# Se vuelve a apagar
	visible = false
	collision_shape.disabled = true
