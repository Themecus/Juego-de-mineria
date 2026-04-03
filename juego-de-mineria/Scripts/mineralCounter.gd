extends Label

var gold=0
var iron=0
var gems=0
var bag=0
var bagLimit=0


func upgradeInfo(vault):
	gold=vault.gold
	iron=vault.iron
	gems=vault.gems
	bag=PLAYERDATA.bag
	bagLimit=PLAYERDATA.bagLimit
	upgradeText()

func upgradeText():
	var interfazText = "bolsa="+str(bag)+"/"+str(bagLimit) + "\n" +"Oro= "+str(gold)+" Hierro= "+str(iron)+" Gemas= "+str(gems)
	text=interfazText
