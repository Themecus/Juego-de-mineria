extends Label

var dataGold = -1
var dataIron = -1  
var dataGems = -1

func updateData(dataNew):
	#vemos si algun recurso cambio
	if (dataNew.gold != dataGold or 
		dataNew.iron != dataIron or 
		dataNew.gems != dataGems):
		#Si es asi actualizamos por si cambia de nuevo
		dataGold = dataNew.gold
		dataIron = dataNew.iron
		dataGems = dataNew.gems
		
		# Actualizar info
		text = "GOLD: " + str(dataNew.gold) + "\n" + \
			   "IRON: " + str(dataNew.iron) + "\n" + \
			   "GEMS: " + str(dataNew.gems)

func dataVisible():
	if Input.is_action_just_pressed("console"):
		visible = !visible
