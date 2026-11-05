extends Node2D

class_name Auto_cook_factory

var CookieFactory = []
var scene_cook_auto = preload("res://auto_clickers/auto_cook.tscn")
var pos = [880, 175]

func is_list()->bool:
	return len(CookieFactory) > 0

#func calc_other_pos()->Array:
	#var delta_x: float = (pos[0] - 370) * cos(0.02) + (pos[1] - 181) * sin(0.02) + 370 - pos[0]
	#var delta_y: float = -(pos[0] - 370) * sin(0.02) + (pos[1] - 181) * cos(0.02) + 181 - pos[1]
	#return [delta_x, delta_y]

func def_pos(producer)->void:
	if producer.position.x > 1000:
		pos[1] += 25
		pos[0] = 880
	producer.position = Vector2(pos[0], pos[1])
	pos = [pos[0] + 10, pos[1]]
	print(pos[0], pos[1])

func make_auto_cook():
	if  len(CookieFactory) < 49:
		var producer = scene_cook_auto.instantiate()
		add_child(producer)
		def_pos(producer)
		CookieFactory.append(producer)
