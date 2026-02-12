extends Node

var gold=0
var iron=0
var gems=0
var total=0

func oresUp(points,nameOre):
	if nameOre=="Gold":
		gold+=points
	if nameOre=="Iron":
		iron+=points
	if nameOre=="Gems":
		gems+=points
	total+=points
