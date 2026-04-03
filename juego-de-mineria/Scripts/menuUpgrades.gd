extends Control
@onready var label=$Label

func _process(delta):
	# Texto del vault
	label.text = "VAULT:\n" + \
					"  GOLD: " + str(PLAYERDATA.vaultInfo.gold) + "\n" + \
					"  IRON: " + str(PLAYERDATA.vaultInfo.iron) + "\n" + \
					"  GEMS: " + str(PLAYERDATA.vaultInfo.gems) + "\n" + \
					"  TOTAL: " + str(PLAYERDATA.vaultInfo.gold +PLAYERDATA.vaultInfo.iron
					 +PLAYERDATA.vaultInfo.gems)

func _on_close_pressed() -> void:
	get_tree().paused = !get_tree().paused
	$".".visible=!$".".visible

func _on_speed_pressed() -> void:
	if PLAYERDATA.vaultInfo.gems>=1:
		PLAYERDATA.speed+=100
		PLAYERDATA.vaultInfo.gems-=1

func _on_mining_pressed() -> void:
	if PLAYERDATA.vaultInfo.iron>=3:
		PLAYERDATA.mining+=1
		PLAYERDATA.vaultInfo.iron-=3
	
func _on_bag_limit_pressed() -> void:
	if PLAYERDATA.vaultInfo.gold>=2:
		PLAYERDATA.bagLimit+=5
		PLAYERDATA.vaultInfo.gold-=2

func _on_size_drill_pressed() -> void:
	if PLAYERDATA.vaultInfo.gold>=2 and  PLAYERDATA.vaultInfo.iron>=3:
		PLAYERDATA.sizeDrill+=0.5
		PLAYERDATA.vaultInfo.iron-=3
		PLAYERDATA.vaultInfo.gold-=2

func _on_item_1_pressed() -> void:
	if PLAYERDATA.bombDrill==false and PLAYERDATA.box==false:
		PLAYERDATA.bomb=true

func _on_item_2_pressed() -> void:
	if PLAYERDATA.bomb==false and PLAYERDATA.box==false:
		PLAYERDATA.bombDrill=true

func _on_item_3_pressed() -> void:
	if PLAYERDATA.bombDrill==false and PLAYERDATA.bomb==false:
		PLAYERDATA.box=true
