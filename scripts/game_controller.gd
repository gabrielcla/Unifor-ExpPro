"""
Teclas:
	Esc - Fecha o jogo
	Setas - Movimentam o cursor 
	Enter (do lado direito) - Clica onde o cursor estiver
"""

extends Node2D

var level = 1

const velCursor := 3 # Velocidade do cursor

var pos


# Roda 1 vez ao entrar na cena
func _ready():
	pass
	# Muda pra outra cena
	#get_tree().change_scene("res://addons/dialogic/Dialog.tscn")


# Roda em Loop
func _process(delta):
	
	#var k = get_viewport().size.x
	#var k = get_viewport().size
	
	pos = get_viewport().get_mouse_position() # Posição atual do mouse
	
	# Teclas Setas - Move o cursor do jogo
	if Input.is_action_pressed("ui_right"):
		pos = pos + Vector2(1,0) * velCursor
	if Input.is_action_pressed("ui_left"):
		pos = pos + Vector2(-1,0) * velCursor
	if Input.is_action_pressed("ui_up"):
		pos = pos + Vector2(0,-1) * velCursor
	if Input.is_action_pressed("ui_down"):
		pos = pos + Vector2(0,1) * velCursor	
	get_viewport().warp_mouse(pos) # Move o cursor pra nova posição
	
	
	# Tecla Enter - Clica com o cursor na posição atual dele
	if Input.is_action_just_pressed("ui_ok"):
		var a = InputEventMouseButton.new()
		a.position = pos
		a.button_index = 1
		a.pressed = true
		Input.parse_input_event(a)
		yield(get_tree(),"idle_frame")
		a.pressed = false
		Input.parse_input_event(a)

	# Tecla ESC - Fecha o jogo
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
