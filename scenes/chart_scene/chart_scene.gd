extends Node2D
@onready var pie_chart: PieChart = %PieChart
@onready var total_respuestas: Label = $total_respuestas
var menu:PackedScene = preload("res://scenes/menu/menu.tscn")
@onready var texto_veredicto: Label = $texto_veredicto
@onready var panel: Panel = $Panel

#Global.contadores es el diccionario con respuestas obtenidas

func _ready() -> void:
	pie_chart.elements = Global.contadores #traemos diccionario desde Global
	print("elemntos2: " , pie_chart.elements)
	total_respuestas.text = "Respuestas totales: " + str(Global.respuestas)
	esconder_veredicto()


func _on_volver_pressed() -> void:
	get_tree().change_scene_to_packed(menu)

func _on_veredicto_pressed() -> void:
	mostrar_veredicto()



func mostrar_veredicto():
	var veredicto = generar_veredicto()
	panel.show()
	texto_veredicto.show()
	texto_veredicto.text = veredicto
	
func esconder_veredicto():
	panel.hide()
	texto_veredicto.hide()

func generar_veredicto() -> String:
	var contadores: Dictionary[String, int] = Global.contadores
	
	var total = Global.respuestas
	if total == 0:
		return "No se registraron respuestas suficientes para analizar tu perfil emocional."
	
	
	var porcentajes := {}# Calcular porcentajes
	for color in contadores.keys():
		porcentajes[color] = float(contadores[color]) / total * 100.0
	
	# Ordenar colores por porcentaje descendente
	var colores_ordenados := porcentajes.keys()
	colores_ordenados.sort_custom(func(a, b): return porcentajes[b] < porcentajes[a])
	
	var top1 = colores_ordenados[0] #el primer item en el array
	var top2 = colores_ordenados[1]#el 2do en el array
	var p1 = porcentajes[top1]
	var p2 = porcentajes[top2]
	
	var resultado := ""
	
	# --- Dominante ---
	if p1 >= 40.0:
		resultado += veredicto_por_color(top1)
	# --- Combinación ---
	elif p1 >= 25.0 and p2 >= 25.0:
		resultado += veredicto_por_combinacion(top1, top2)
	else:
		resultado += "Tu perfil es equilibrado: combinás distintas emociones según la situación."
	
	return resultado


func veredicto_por_color(color: String) -> String:
	match color:
		"racional":
			return "Azul - Tu estilo es reflexivo y reservado. Preferís analizar o mantener distancia antes de actuar."
		"impulsiva":
			return "Rojo - Tu estilo es impulsivo y reactivo. Solés actuar desde la emoción y la defensa, a veces sin pensar en consecuencias."
		"valiente":
			return "Amarillo - Tu estilo es asertivo y valiente. Enfrentás los problemas con decisión, pero sin agresión."
		"empatica":
			return "Verde - Tu estilo es empático y comunicativo. Buscás resolver los conflictos desde el diálogo y la comprensión."
		_:
			return "No se pudo determinar un estilo dominante."


func veredicto_por_combinacion(c1: String, c2: String) -> String:
	# Ordenamos para tener consistencia
	var combo := [c1, c2]
	combo.sort()
	match combo:
		["racional", "empatica"]:
			return "racional y empatica - Sos una persona tranquila y empática. Evitás conflictos, pero cuando actuás, lo hacés con comprensión."
		["racional", "valiente"]:
			return "racional y valiente - Pensás antes de actuar y tomás decisiones con firmeza, equilibrando razón y acción."
		["impulsiva", "valiente"]:
			return "impulsiva y valiente - Sos apasionado y directo. Actuás con determinación, aunque debés cuidar la impulsividad."
		["impulsiva", "empatica"]:
			return " impulsiva y empatica - Querés ayudar y defender, pero tus emociones pueden intensificarse demasiado."
		["valiente", "empatica"]:
			return "valiente y empatica - Combinás empatía con acción decidida, buscando soluciones justas y equilibradas."
		["racional", "impulsiva"]:
			return "racional y impulsiva - Luchás entre la calma y la impulsividad: a veces te contenés, otras reaccionás sin pensar."
		_:
			return "Tu perfil combina distintas emociones y estrategias ante los conflictos."
