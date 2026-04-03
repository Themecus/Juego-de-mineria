extends Control

var timer

func _ready():
	timer=$Timer
	timer.wait_time=300#ESTO EQUIVALE A 5 MINUTOS
	timer.start()

func _process(delta):
	var secondsSubtracted = int(timer.time_left)#TRANSFORMAMOS EL VALOR DE FLOAT A INT
	
	# Calcular minutos y segundos
	var min = secondsSubtracted / 60#El resultado de aqui responde a lo dividendos que usamos
	var sec = secondsSubtracted % 60#El resultado aqui responde a el resto de la division
	#usando los valores de 60 siendo lo forma de transformar el tiempo,60 segundos son un minuto ejemplo
	
	# Formatear clasico de reloj (ej: "05:00")
	#para esto usamos un formateador de string que nos facilita el trbajo
	#el % indica coloca un valor, siendo min y sec respectivamente
	#el 02d significaca colocar un cero a la izquierda si falta, que sea un valor de 2 digitos
	#y que sea entero
	$Label.text ="%02d:%02d" % [min, sec]
