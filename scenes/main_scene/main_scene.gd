extends Node2D

const RESPUESTASDB = preload("res://data/respuestas.gd") #dialogos Data Base
@onready var question_label: Label = $pregunta/pregunta
@onready var pregunta_rect: NinePatchRect = $pregunta/pregunta_rect
@onready var label_respuestas: Label = $contador_respuestas/respuestas
@onready var respuestas_azul: Label = $contador_respuestas/respuestas_azul
@onready var respuestas_verde: Label = $contador_respuestas/respuestas_verde
@onready var respuestas_rojo: Label = $contador_respuestas/respuestas_rojo
@onready var respuestas_amarillo: Label = $contador_respuestas/respuestas_amarillo

#fondo negro
@onready var fondo_negro: ColorRect = $comienzo_juego/negro


#opcion 1
@onready var azul_button_1: Button = $opcion1/Button
@onready var label_1: Label = $opcion1/Label
#opcion 2
@onready var verde_button_2: Button = $opcion2/Button2
@onready var label_2: Label = $opcion2/Label2
#opcion 3
@onready var rojo_button_3: Button = $opcion3/Button3
@onready var label_3: Label = $opcion3/Label
#opcion 4
@onready var amarillo_button_4: Button = $opcion4/Button4
@onready var label_4: Label = $opcion4/Label
#markers de dialogos
@onready var pj_1: Marker2D = $personajes/Marker1
@onready var pj_2: Marker2D = $personajes/Marker2

signal dialogo_finalizado
@export var next_scene_on_finish: PackedScene = preload("res://scenes/chart_scene/chart_scene.tscn")

#setup
var opciones = []
var current_id := "inicio" 

func _ready():
	reset_contadores()
	_fundido_a_negro()
	_set_values()
	_esconder_textos()
	fondo_negro.modulate = Color(0,0,0,1)

func _set_values():
	Global.respuestas = 0
	opciones = [
			{"button": azul_button_1,     "label": label_1, "key": "azul"},
			{"button": verde_button_2,    "label": label_2, "key": "verde"},
			{"button": rojo_button_3,     "label": label_3, "key": "rojo"},
			{"button": amarillo_button_4, "label": label_4, "key": "amarillo"},
		]
		
func _fundido_a_negro():
	fondo_negro.visible = true
	
	var fundido_negro := create_tween()
	fundido_negro.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	# Animar alfa desde 1.0 (opaco) hasta 0.0 (transparente)
	fundido_negro.tween_property(
		fondo_negro, "modulate:a", 0.0, 2)
	fundido_negro.tween_callback(Callable(fondo_negro, "hide"))
	await fundido_negro.finished
	_iniciar_dialogos()
	
func _iniciar_dialogos():
	cargar_dialogo()
	Dialogos.primer_dialogo(pj_1, pj_2)#ejecutamos dialogo creado
	Dialogic.timeline_ended.connect(_termino_dialogo)


func cargar_dialogo() -> void:
	var node = RESPUESTASDB.RESPUESTAS.get(current_id, null)
	if node == null:
		push_error("No existe el nodo de diálogo: %s" % current_id)
		return

	question_label.text = str(node.get("pregunta", ""))

	var es_final := bool(node.get("final", false))
	var opts: Array = node.get("opciones", [])

	for i in range(opciones.size()):
		var btn: Button = opciones[i]["button"]
		var lab: Label  = opciones[i]["label"]

		var txt := ""
		if not es_final:
			if i < opts.size():
				txt = str(opts[i])
			else:
				txt = ""
		else:
			# En nodo final, dejamos visible solo el primer botón como "Continuar"
			if i == 0:
				txt = "Continuar"
			else:
				txt = ""

		lab.text = txt
		btn.visible = (txt != "")

		# Limpia conexiones previas
		for c in btn.get_signal_connection_list("pressed"):
			btn.disconnect("pressed", c["callable"])

		# Reconecta sólo si está visible
		if btn.visible:
			var the_call := Callable(self, "_on_option_selected").bind(i)
			btn.pressed.connect(the_call)

	_update_respuestas()
	
	
func _update_respuestas():
	label_respuestas.text = "respuestas: " + str(Global.respuestas)
	respuestas_azul.text = "respuestas: " + str(get_contador("azul"))
	respuestas_verde.text = "respuestas: " + str(get_contador("verde"))
	respuestas_rojo.text = "respuestas: " + str(get_contador("rojo"))
	respuestas_amarillo.text = "respuestas: " + str(get_contador("amarillo"))

func _on_option_selected(index: int) -> void:
	if index >= 0 and index < opciones.size():
		var key = opciones[index].get("key", "")
		if key != "":
			Global.contadores[key] += 1
			print("Botón fue presionado")

	Global.respuestas += 1
	_navegar_dialogos(index)


func _navegar_dialogos(index: int) -> void:
	var node = RESPUESTASDB.RESPUESTAS.get(current_id, null)
	if node == null:
		push_error("Nodo actual inválido: %s" % current_id)
		return

	var next_list: Array = node.get("next", [])
	var next_id := ""
	if index >= 0 and index < next_list.size():
		next_id = str(next_list[index])

	# A) Sin destino => fin
	if next_id == "":
		_desactivar_opciones()
		_finalizar_dialogo()
		return

	# B) Con destino
	var next_node = RESPUESTASDB.RESPUESTAS.get(next_id, null)
	if next_node == null:
		push_warning("next_id inválido: %s" % next_id)
		_desactivar_opciones()
		_finalizar_dialogo()
		return

	current_id = next_id
	cargar_dialogo()

	# C) Si el destino es final, cerrar (si preferís esperar a que pongan "Continuar", comentá esto)
	if bool(next_node.get("final", false)):
		_finalizar_dialogo()
	
func _finalizar_dialogo() -> void:
	emit_signal("dialogo_finalizado")

	_desactivar_opciones()
	_esconder_textos()

	if next_scene_on_finish != null:
		get_tree().change_scene_to_packed(next_scene_on_finish)
	else:
		push_warning("Fin de diálogo alcanzado, pero no hay PackedScene destino configurada.")

	
func _desactivar_opciones() -> void:
	for opcion in opciones:
		var b: Button = opcion["button"]
		b.disabled = true

func _esconder_textos() -> void:
	var nodes = [label_1, label_2, label_3, label_4,question_label]
	for node in nodes:
		node.hide()

func _termino_dialogo():
	_mostrar_textos()

func _mostrar_textos():
	var label_nodes = [label_1, label_2, label_3, label_4]
	var question_nodes =[question_label]
	
	for question in question_nodes:
		question.show()
		question.modulate.a = 0.0
		question.scale = Vector2(0.9, 0.9)
		
		var question_tween = create_tween() #para la pregunta
		question_tween.parallel().tween_property(question, "modulate:a", 1.0, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		
		question_tween.parallel().tween_property(question, "scale", Vector2.ONE, 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		
		await question_tween.finished
		
	for label in label_nodes:
		label.show()
		label.modulate.a = 0.0
		label.scale = Vector2(0.7, 0.7)  # arranca más chico
		
		var label_tween = create_tween() #para los labels
		label_tween.parallel().tween_property(label, "modulate:a", 1.0, 0.8).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		
		label_tween.parallel().tween_property(label, "scale", Vector2.ONE, 0.8).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		
func get_contador(color: String) -> int:
	return Global.contadores.get(color, 0)

func reset_contadores() -> void:
	for k in Global.contadores.keys():
		Global.contadores[k] = 0
