extends Node2D

var dialogo1
var dialogo2 = null


func _ready():
	# Adiciona na cena a caixa de diálogo
	dialogo1 = Dialogic.start('RBrito0')
	add_child(dialogo1)



# Roda em loop
func _process(delta):
	
	# Ao clicar em uma das 4 opções
	if Dialogic.get_variable('acertou1') != '-1':
		# Tira o dialogo1
		if dialogo1 != null and is_instance_valid(dialogo1):
			remove_child(dialogo1)
			print(dialogo1)

		# Bota o dialogo2
		if dialogo2 == null:
			dialogo2 = Dialogic.start('RBrito')
			add_child(dialogo2)

		# Se o jogador acertou
#		if Dialogic.get_variable('acertou1') == '1':
#			# Exibe o dialogo2
#			if dialogo2 == null:
#				dialogo2 = Dialogic.start('RBrito')
#				add_child(dialogo2)

		
		# Se o jogador errar
#		if Dialogic.get_variable('acertou1') == '0':
#			if dialogo1 != null and is_instance_valid(dialogo1):
#				dialogo1.queue_free()
			



		## DEPOIS DE TUDO 
#		Dialogic.set_variable('acertou1') == '-1'











func _on_Button1_pressed():
	print("Opção Correta!")
	Dialogic.set_variable('acertou1', 1)
	
	#dialogo0.queue_free() # Remove da cena a caixa de diálogo mas tem que ta no mesmo escopo
	
	#var new_dialog = Dialogic.start('RBrito')
	#add_child(new_dialog)

func _on_Button2_pressed():
	print("Opção Errada!")
	Dialogic.set_variable('acertou1', 0)

func _on_Button3_pressed():
	print("Opção Errada!")
	Dialogic.set_variable('acertou1', 0)

func _on_Button4_pressed():
	print("Opção Errada!")
	Dialogic.set_variable('acertou1', 0)
