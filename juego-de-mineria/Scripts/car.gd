extends CharacterBody2D

var moving_fast = 1000
var key = false
var player_original_parent = null

@onready var player = $"../../Player" #jugador
@onready var carCamara = $Camera2D #camara del carro
@onready var exitMarker = $Marker2D  # El punto para la salida del jugador

#dato: si el jugador es eliminado del juego, el carro toma control de la camara y acciones
func _process(delta):
	if key == true:
		enterVehicle()#Entraremos en vehiculo
		moving(delta)# Mover vehículo
		
		# Cambiar cámara (nota: esto lo tuve hacer con ia para entenderlo)
		var player_camera = player.get_node_or_null("Camera2D")#este getnode es una version segura al tener inseguridad de ciertos nodos
		player_camera.enabled = false#si lo apagamos y encedemos l camara del del carro
		carCamara.enabled = true

		if Input.is_action_pressed("Touch"):#Si presionamos espacio salimos del vehiculo
			exitVehicule()

func enterVehicle():
	# Guardar al padre del jugador original aqui dentro
	player_original_parent = player.get_parent()
	
	# Lo guardamos dentro de si mismo/self del carro, haciendo que ahora el padre del jugador sea el carro
	player.reparent(self)
	player.position = Vector2.ZERO
	player.visible = false#lo volvemos invisible


func exitVehicule():
	# Restaurar padre original del jugador
	player.reparent(player_original_parent)
	player.global_position = exitMarker.global_position#colcoamos la posicion encima del carro
	# Restaurar visibilidad
	player.visible = true
	
	# Restaurar cámara del jugador
	var player_camera = player.get_node_or_null("Camera2D")
	player_camera.enabled = true
	# Desactivar cámara del vehículo
	carCamara.enabled = false
	key = false

func moving(delta):
	var direction_x = Input.get_axis("Left", "Right")
	velocity.x = direction_x * moving_fast
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not key:
		key = true
		player = body  # Actualizar referencia
