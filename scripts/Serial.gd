"""
OBS: Pinos do joystic para baixo
	vA = 0		Baixo
	vB = 0 		Esquerda

Mensagem Serial Posicao: vA;vB 
	Baixo     =   vA=0
	Cima      =   vA=4095 
	Esquerda  =   vB=0
	Direita   =   vB=4095


OBS: O JOGO NÃO PODE SER RODADO EM FULL SCREEN POIS BUGA.
Precisa mudar a resolução da sua tela para 1280x720

Teclas:
	Esc - Fecha o jogo
	Setas - Movimentam o cursor 
	1 (do teclado num) - Clica onde o cursor estiver
	
"""

extends Node

const porta_serial = "COM4"
const serial_res = preload("res://bin/gdserial.gdns")


onready var serial_port = serial_res.new()
var is_port_open = false
var text = ""

var vA # Armazena o valor do eixo A do joystick (Cima-Baixo) | No arduino chamo de X | antes ';'
var vB # Armazena o valor do eixo B do joystick (Esquerda-Direita | No arduino chamo de Y  | apos ';'
var pos_mouse
var comando = "" # Armazena o comando recebido via Serial


const vel_cursor = 5

# Calibração Joystick 
const cA = 2100 # Posição média relaxado do eixo A
const cB = 1600 # Posição média relaxado do eixo B
const ME = 0.15 # Margem de Erro = 300 /2048

signal Botao()




func _ready():
	open()
	# Pressiona botão no jogo ao receber comando serial
	Serial.connect("Botao", self, "_on_meu")


func _process(delta):
		# Se sair = 1, então fecha o jogo
	if Dialogic.get_variable('sair') == '1':
		get_tree().quit()
	
	# Tecla ESC - Fecha o jogo
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
	# Se tiver conexão serial
	if is_port_open:
		pos_mouse = get_viewport().get_mouse_position() # Posição atual do mouse

		# Armazena o comando recebido
		var t = serial_port.read_text()
		if t.length() > 0:
			for c in t:
				if c == "\n":
					on_text_received(text)
					text = ""
				else:
					text+=c
		
		# Se o comando recebido por Serial for do botão
		if comando == "Enter":
			
			# Simula pressionar a tecla enter
			var ev = InputEventKey.new()
			ev.scancode = KEY_ENTER
			ev.pressed = true
			Input.parse_input_event(ev)
			yield(get_tree(),"idle_frame")
			ev.pressed = false
			Input.parse_input_event(ev)

			# Simula clicar na posição atual do cursor
			var evento = InputEventMouseButton.new()
			evento.position = pos_mouse
			evento.button_index = 1
			evento.pressed = true
			Input.parse_input_event(evento)
			yield(get_tree(),"idle_frame")
			evento.pressed = false
			Input.parse_input_event(evento)
			
			
		# Se o comando recebido por Serial for uma posição
		if comando.find(';') > -1:
			vA = int(comando.split(";")[0])
			vB = int(comando.split(";")[1])
				
			var kA = float(vA-cA) / 2048
			var kB = float(vB-cB) / 2048
			
			# Só move o cursor numa direção se o valor absoluto do k for maior que ME
			if abs(kA) > ME:
				pos_mouse = pos_mouse + Vector2(0,-1) * kA * vel_cursor
			if abs(kB) > ME:
				pos_mouse = pos_mouse + Vector2(1,0) * kB * vel_cursor


			
		# Só move o cursor pra próxima posição se ele não tiver na origem (0,0)
		if pos_mouse != Vector2(0,0): # Sem isso o mouse fica indo pra origem
			get_viewport().warp_mouse(pos_mouse) # Move o cursor pra determinada posição


# Recebe texto via serial
func on_text_received(text):
	var lista = text.split(" ")
	comando = str(lista[0])


#########################
### Funções Obrigatórias:
func _exit_tree():
	close()

func open():
	is_port_open = serial_port.open_port(porta_serial, 115200)
	print(is_port_open)

func close():
	is_port_open = false
	serial_port.close_port()
