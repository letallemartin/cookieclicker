extends Control


class_name Background_cookie

var list_cookie = []
var mini_cookie_scene = preload("res://fond/mini_cookie.tscn")

func make_cookie()->void:
	var mini_cookie = mini_cookie_scene.instantiate()
	add_child(mini_cookie)
	mini_cookie.position = Vector2(randi_range(10, 900),0)
	mini_cookie.z_index = -2
	list_cookie.append(mini_cookie)
	
func Moove_mini_cookie() -> void:
	for i in len(list_cookie):
		list_cookie[i].position.y += 1
		list_cookie[i].rotation += 0.01
	
func is_out()->void:
	var i = 0
	while i < len(list_cookie):
		if list_cookie[i].position.y > 800:
			list_cookie.remove_at(i)
			i += 1
		i += 1
