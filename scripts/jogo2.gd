extends Node2D

# Armazena os erros já encontrados pela pessoa
var erros = [0,0,0,0,0,0,0]
var cont = 7

var dialogo1
var dialogo2 = null


func _ready():
	# Adiciona na cena a caixa de diálogo
	dialogo1 = Dialogic.start('7erros1')
	add_child(dialogo1)


func _process(delta):
	if cont == 0:
		Dialogic.set_variable('acertou2', 1)

		# Tira o dialogo1
		if dialogo1 != null and is_instance_valid(dialogo1):
			remove_child(dialogo1)

		# Bota o dialogo2
		if dialogo2 == null:
			dialogo2 = Dialogic.start('7erros2')
			add_child(dialogo2)


func _on_Button1_pressed():
	if erros[0] == 0:
		erros[0] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)

func _on_Button2_pressed():
	if erros[1] == 0:
		erros[1] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)

func _on_Button3_pressed():
	if erros[2] == 0:
		erros[2] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)

func _on_Button4_pressed():
	if erros[3] == 0:
		erros[3] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)


func _on_Button5_pressed():
	if erros[4] == 0:
		erros[4] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)

func _on_Button6_pressed():
	if erros[5] == 0:
		erros[5] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)

func _on_Button7_pressed():
	if erros[6] == 0:
		erros[6] = 1
		cont-=1
		$LabelErros.text = "Faltam: " + str(cont)
