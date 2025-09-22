extends Node2D

const DIALOGOSDB = preload("res://data/dialogos.gd") #dialogos Data Base
@onready var question_label: Label = $pregunta/pregunta
@onready var pregunta_rect: NinePatchRect = $pregunta/pregunta_rect
@onready var label_respuestas: Label = $respuestas

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

var respuestas:int
var contadores = {
	"azul": 0,
	"verde": 0,
	"rojo": 0,
	"amarillo": 0
}
#setup
var opciones = []
var current_id := "inicio" 

func _ready():
	respuestas = 0
	opciones = [
			{"button": azul_button_1,     "label": label_1, "key": "azul"},
			{"button": verde_button_2,    "label": label_2, "key": "verde"},
			{"button": rojo_button_3,     "label": label_3, "key": "rojo"},
			{"button": amarillo_button_4, "label": label_4, "key": "amarillo"},
		]
	cargar_dialogo()
	_esconder_textos()
	Dialogos.primer_dialogo(pj_1, pj_2)
	Dialogic.timeline_ended.connect(_termino_dialogo)


func cargar_dialogo() -> void:
	var node = DIALOGOSDB.DIALOGOS.get(current_id, null)
	if node == null:
		push_error("Nodo de diálogo inexistente: %s" % current_id)
		return

	question_label.text = node["pregunta"]

	for i in range(opciones.size()):
		var txt = node["opciones"][i]
		var btn: Button = opciones[i]["button"]
		var lab: Label  = opciones[i]["label"]

		lab.text = txt

		# Desconecta TODAS las conexiones previas al signal "pressed"
		for opcion in btn.get_signal_connection_list("pressed"):
			btn.disconnect("pressed", opcion["callable"])

		# Conecta el handler con índice
		var the_call = Callable(self, "_on_option_selected").bind(i)
		btn.pressed.connect(the_call)
		_update_respuestas()
	
	
func _update_respuestas():
		label_respuestas.text = "respuestas: " + str(respuestas)

func _on_option_selected(index: int) -> void:
	if index >= 0 and index < opciones.size():# 1) Contar por color según el botón
		var key = opciones[index].get("key", "")
		if key != "":
			contadores[key] += 1
			print("Botón %s fue presionado %d veces" % [key, contadores[key]])

	respuestas += 1# 2) Contador general (si lo usás)
	_navegar_dialogos(index)


func _navegar_dialogos(index: int):
	var node = DIALOGOSDB.DIALOGOS[current_id]
	var next_list: Array = node.get("next", [])
	var next_id := ""
	if index >= 0 and index < next_list.size():
		next_id = str(next_list[index])

	if next_id == "" or not DIALOGOSDB.DIALOGOS.has(next_id):
		print("no hay opcion disponible ", index)
		_desactivar_opciones()
		return

	current_id = next_id
	cargar_dialogo()
	
	
func _desactivar_opciones() -> void:
	for opcion in opciones:
		(opcion["button"] as Button).disabled = true

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
		
	
