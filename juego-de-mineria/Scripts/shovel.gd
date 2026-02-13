extends Node2D

@onready var collision_shape = $CollisionShape2D
@onready var player = get_parent()  # Siendo la pala  hijo del jugador, sacaremos la informacion de el
@export var max_distance = 100  # Máxima distancia del jugador y la pala
@export var smoothing = 10.0  # Suavizado del movimiento

var target_position = Vector2.ZERO

func _ready():
	visible = false
	collision_shape.disabled = true

func _process(delta):
	handle_input(delta)
	
	# si esta activado, comenzara la rotacion del raton
	if visible:
		follow_mouse(delta)

func handle_input(delta):
	if Input.is_action_pressed("Drill"):
		visible = true
		collision_shape.disabled = false
	else:
		visible = false
		collision_shape.disabled = true

func follow_mouse(delta):
	# Obtener posición global del ratón
	var mouse_pos = get_global_mouse_position()
	var player_pos = player.global_position
	
	#tomalo como la distancia entre el raton y el jugador
	var direction = (mouse_pos - player_pos).normalized()
	#.normalized() mantiene dirección
	
	# Limitar distancia máxima de la pala y el jugador
	var distance = min(player_pos.distance_to(mouse_pos), max_distance)
	
	#permite anclar la posicion de la pala y que no salga volando
	target_position = player_pos + (direction * distance)
	
	# Suaviza el movimeinto de la pala
	global_position = global_position.lerp(target_position, smoothing * delta)
	
	# Llama para trabajar la rotacion de la pala
	rotate_towards_mouse()

func rotate_towards_mouse():
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - global_position
	rotation = direction.angle()# con el angle obtnemos los radianes del vector, osea, ayuda a que no se quede estatico y gire versatilmente
