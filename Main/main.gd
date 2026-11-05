extends Control

var cookie: int = 0

@onready var label: Label = $Label
@onready var up1: Label = $upgrade_panel/up1_icon/Label
@onready var up2: Label = $upgrade_panel/up2_icon/Label
var background_cookie = preload("res://fond/background_cookie.gd")
var fond_cookie = Background_cookie.new()

var perso = preload("res://perso.gd")
var perso1 = Perso.new()

var auto_cook_factory = preload("res://auto_clickers/auto_cookie.gd") 
var factory1 = Auto_cook_factory.new()

var upgrade = preload("res://upgrade/upgrade.gd")
var upgrade_1 = Upgrade.new(5, "power")
var upgrade_2 = Upgrade.new(10, "auto_cook")

func auto_cook()->void:
	var temp: float = Time.get_ticks_msec()
	for cookie in factory1.CookieFactory:
		if temp - cookie.last_action < cookie.delai:
			cookie.last_action = temp  #a changer !!!
			perso1.argent += 10 #a changer !!!

func acheter(perso, upgrade)->void:
	if upgrade.nom == "power":
		perso.add_power(1)
	elif upgrade.nom ==  "auto_cook":
		factory1.make_auto_cook()

func est_argent(perso, upgrade)->void:
	if perso.argent >= upgrade.prix:
		perso.change_argent(-upgrade.prix)
		acheter(perso, upgrade)
		upgrade.up_prix(2)

func _on_texture_button_pressed() -> void:
	perso1.change_argent(perso1.power_clicks)
	fond_cookie.make_cookie()

func _on_mouse_entered():
	$TextureButton.scale = Vector2(1.1, 1.1)
	
func _on_mouse_exited():
	$TextureButton.scale = Vector2(1,1)

func _ready() -> void:
	add_child(fond_cookie)
	add_child(factory1)
	$TextureButton.pressed.connect(_on_texture_button_pressed) # Replace with function body.
	$TextureButton.mouse_entered.connect(_on_mouse_entered)
	$TextureButton.mouse_exited.connect(_on_mouse_exited)
	$TextureRect.modulate.a = 0.5
	$upgrade_panel/up1_icon.pressed.connect(est_argent.bind(perso1, upgrade_1))
	$upgrade_panel/up2_icon.pressed.connect(est_argent.bind(perso1, upgrade_2))
	if len(factory1.CookieFactory) >0:
		auto_cook()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(fond_cookie.list_cookie) > 0:
		fond_cookie.Moove_mini_cookie()
		fond_cookie.is_out()
	$TextureRect.rotation += 0.01
	#print("argent: ",perso1.argent)
	up1.text = "power: " + str(upgrade_1.prix)
	label.text = "cookie: " + str(perso1.argent)
	up2.text = "power: " + str(upgrade_2.prix)
	#print(factory1.is_list())

func _on_texture_button_mouse_entered() -> void:
	pass # Replace with function body.
