extends Node

var savePath="res://save.dat"

var speed=400 #esto sera la velocidad de movimiento del jugador
var bagLimit=10 #Que tantos ores puede recoger el jugador
var bag=0 #Que tantos ores puede recoger el jugador
var mining=2 #La fuerza de minado
var sizeDrill=1 #Lo largo qeu sera la pala
var vaultInfo=null #La informacion de la boveda, de cuantos minerales hay
var bomb=false
var bombDrill=false
var box=false
var stopItem=true
var positionPlayer
var portalA
var portalB
var keyPortal=true
var healtCity=0
func _ready():
	
	var inventoryClass = load("res://Scripts/inventory.gd")
	vaultInfo = inventoryClass.new()

func setSaveVault(vault):
	vaultInfo.gold = vault.gold
	vaultInfo.iron = vault.iron
	vaultInfo.gems = vault.gems

func getSaveVault():
	return vaultInfo

func saveData():#guardamos los datos
	var saveInfo = FileAccess.open(savePath, FileAccess.WRITE)
	# creamos un diccionario para meter toda la info
	var playerStats = {
		"speed": speed,
		"bagLimit": bagLimit,
		"bag": bag,
		"mining": mining,
		"sizeDrill": sizeDrill,
		"bomb": bomb,
		"bombDrill": bombDrill,
		"box": box,
		"stopItem": stopItem,
		"vaultInfoGold": vaultInfo.gold,
		"vaultInfoIron": vaultInfo.iron,
		"vaultInfoGems": vaultInfo.gems,
	}
	#ignoramos la vault de momento
	var jsonString = JSON.stringify(playerStats)#guardamosccomo un json ya que es mas confiable
	saveInfo.store_string(jsonString)#lo guardamos
	saveInfo.close()#y cerramos

func loadData():#aqui cargamos los archivos
	if not FileAccess.file_exists(savePath):#en caso de no detectar el archivo, dara valores base
		return null
	var loadInfo = FileAccess.open(savePath, FileAccess.READ)#preparamos para cargarlo
	
	var jsonString = loadInfo.get_as_text()#extramos la informacion
	var data = JSON.parse_string(jsonString)#Lo pasamos a un JSON para leer la info
	loadInfo.close()#cerramos
	
	# Cargarmos los datos, cabe destacar que dejamos valores por defecto por las moscas
	speed = data.get("speed", 400)
	bagLimit = data.get("bagLimit", 10)
	bag = data.get("bag", 0)
	mining = data.get("mining", 2)
	sizeDrill = data.get("sizeDrill", 1)
	bomb = data.get("bomb", false)
	bombDrill = data.get("bombDrill", false)
	box = data.get("box", false)
	stopItem = data.get("stopItem", true)
	vaultInfo.gold = data.get("vaultInfoGold", 0)
	vaultInfo.iron = data.get("vaultInfoIron", 0)
	vaultInfo.gems = data.get("vaultInfoGems", 0)
	

func deleteData():#esto es para borrar los saves
	if FileAccess.file_exists(savePath):
		var deleteSave = DirAccess.remove_absolute(savePath)
	
