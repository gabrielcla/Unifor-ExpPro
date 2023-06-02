extends Node2D

var dialogo1
var dialogo2 = null


func _ready():
	# Adiciona na cena a caixa de diálogo
	dialogo1 = Dialogic.start('RBrito1')
	add_child(dialogo1)


# Roda em loop
func _process(delta):
	# Ao clicar em uma das 4 opções
	if Dialogic.get_variable('acertou1') != '-1':
		# Tira o dialogo1
		if dialogo1 != null and is_instance_valid(dialogo1):
			remove_child(dialogo1)

		# Bota o dialogo2
		if dialogo2 == null:
			dialogo2 = Dialogic.start('RBrito2')
			add_child(dialogo2)




func _on_Button1_pressed():
	Dialogic.set_variable('acertou1', 1)

func _on_Button2_pressed():
	Dialogic.set_variable('acertou1', 0)

func _on_Button3_pressed():
	Dialogic.set_variable('acertou1', 0)

func _on_Button4_pressed():
	Dialogic.set_variable('acertou1', 0)
