extends Label

var dataGold = -1
var dataIron = -1  
var dataGems = -1
var dataGoldV = -1
var dataIronV = -1  
var dataGemsV = -1

func updateData(dataNew):
	# Actualizar datos del inventario
	dataGold = dataNew.gold
	dataIron = dataNew.iron
	dataGems = dataNew.gems
	_actualizar_texto_completo()

func updateDataVault(dataNew):
	# Actualizar datos del vault
	dataGoldV = dataNew.gold
	dataIronV = dataNew.iron
	dataGemsV = dataNew.gems
	_actualizar_texto_completo()

func _actualizar_texto_completo():
	# Texto del inventario
	var inventario_text = "INVENTARIO:\n" + \
						"  GOLD: " + str(dataGold) + "\n" + \
						"  IRON: " + str(dataIron) + "\n" + \
						"  GEMS: " + str(dataGems) + "\n" + \
						"  TOTAL: " + str(dataGold + dataIron + dataGems) + "\n\n"
	
	# Texto del vault
	var vault_text = "VAULT:\n" + \
					"  GOLD: " + str(dataGoldV) + "\n" + \
					"  IRON: " + str(dataIronV) + "\n" + \
					"  GEMS: " + str(dataGemsV) + "\n" + \
					"  TOTAL: " + str(dataGoldV + dataIronV + dataGemsV)
	
	# Combinar ambos textos
	text = inventario_text + vault_text

func dataVisible():
	visible = !visible
