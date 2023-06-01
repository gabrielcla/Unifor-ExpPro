extends Node2D

# Armazena os erros já encontrados pela pessoa
var erros = [0,0,0,0,0,0,0]
var cont = 7


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var soma = 0
	for e in erros:
		soma += e
	
	


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
