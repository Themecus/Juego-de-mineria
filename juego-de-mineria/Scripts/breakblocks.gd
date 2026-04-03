extends Node2D
class_name BreakBlocks

var dig = false
var damage=false
var drill=false
var durability=10
var miningPower=2
var delta
var ore=preload("res://Scene/iron.tscn") 
var oreInstance
var capacity=0

func _ready():
	miningPower=PLAYERDATA.mining


func breaker(delta):#esto es para el taladro principal
	durability=durability-delta*miningPower
	print(durability)
	if durability<=0:
		var numberOfOres=randi_range(1,4)
		while capacity<numberOfOres:
			var variation=Vector2(randf_range(-50,50),randf_range(-50,50))#esto actuara para que varie la ubicacion
			#de dropeo de mineraels
			oreInstance=ore.instantiate()
			oreInstance.position=position+variation
			get_parent().add_child(oreInstance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
			#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
			capacity+=1
		queue_free()
		
func breakerPortal(delta):#esto es para la generacion de taladros
	durability=durability-delta*miningPower
	print(durability)
	if durability<=0:
		var numberOfOres=1
		while capacity<numberOfOres:
			var variation=Vector2(randf_range(-50,50),randf_range(-50,50))#esto actuara para que varie la ubicacion
			#de dropeo de mineraels
			oreInstance=ore.instantiate()
			oreInstance.position=position+variation
			get_parent().add_child(oreInstance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
			#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
			capacity+=1
		queue_free()

func breakerDamage():#esto sera para las bombas u otro elemento que no se dano consntante sino directo
	if durability<=0 and damage==true:
		var numberOfOres=randi_range(1,4)
		while capacity<numberOfOres:
			var variation=Vector2(randf_range(-50,50),randf_range(-50,50))#esto actuara para que varie la ubicacion
			#de dropeo de mineraels
			oreInstance=ore.instantiate()
			oreInstance.position=position+variation
			get_parent().add_child(oreInstance)#agregamos el get parents ya que cuando sea eliminado el no lo sea, 
			#en otro caso que no sea sde elimnacion quitalo y dejalo como addchildd
			capacity+=1
		queue_free()



func _on_area_2d_area_entered(area: Area2D):
	if area.name == "Shovel":
		dig = true
	if area.name == "explosionZone":
		await get_tree().create_timer(1.3).timeout
		damage = true
		durability=durability-2#aqui podemos configurar el sistema de dano de la bomba
		breakerDamage()
	if area.name ==  "drillZone":
		dig = true


func _on_area_2d_area_exited(area: Area2D):
	if area.name == "Shovel":
		dig = false
	if area.name ==  "explosionZone":
		damage = false
	if area.name ==  "drillZone":
		dig = false
