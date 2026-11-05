extends Control

class_name Upgrade

var prix
var nom

func _init(prix, nom):
	self.prix = prix
	self.nom = nom
	
func up_prix(add)->void:
	self.prix += add
