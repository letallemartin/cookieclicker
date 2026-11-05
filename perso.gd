extends Control

class_name Perso

var argent = 0
var power_clicks = 1000

func change_argent(cookie)->void:
	self.argent += cookie
	
func add_power(up)->void:
	self.power_clicks += up
