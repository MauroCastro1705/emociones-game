extends Node2D

const DIALOGOSDB = preload("res://data/dialogos.gd") #dialogos Data Base
@onready var question_label: Label = $pregunta/pregunta
@onready var pregunta_rect: NinePatchRect = $pregunta/pregunta_rect

#opcion 1
@onready var button_1: Button = $opcion1/Button
@onready var label_1: Label = $opcion1/Label
#opcion 2
@onready var button_2: Button = $opcion2/Button2
@onready var label_2: Label = $opcion2/Label2
#opcion 3
@onready var button_3: Button = $opcion3/Button3
@onready var label_3: Label = $opcion3/Label
#opcion 4
@onready var button_4: Button = $opcion4/Button4
@onready var label_4: Label = $opcion4/Label
#markers de dialogos
@onready var pj_1: Marker2D = $personajes/Marker1
@onready var pj_2: Marker2D = $personajes/Marker2


#setup
var opciones = []
var current_id := "inicio" 

func _ready():
	_esconder_textos()
	opciones = [
		{"button": button_1, "label": label_1},
		{"button": button_2, "label": label_2},
		{"button": button_3, "label": label_3},
		{"button": button_4, "label": label_4},
	]
	cargar_dialogo()
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

func _on_option_selected(index: int) -> void:
	var node = DIALOGOSDB.DIALOGOS[current_id]
	var next_list: Array = node.get("next", [])
	var next_id := ""
	if index >= 0 and index < next_list.size():
		next_id = str(next_list[index])

	if next_id == "" or not DIALOGOSDB.DIALOGOS.has(next_id):
		# Sin destino o fin: podés deshabilitar botones, mostrar cartel, etc.
		print("no hay opcion disponible ", index)
		_desactivar_opciones()
		return

	current_id = next_id
	cargar_dialogo()

func _desactivar_opciones() -> void:
	for opcion in opciones:
		(opcion["button"] as Button).disabled = true

func _esconder_textos() -> void:
	label_1.hide()
	label_2.hide()
	label_3.hide()
	label_4.hide()
	question_label.hide()
	pregunta_rect.hide()
	
func _mostrart_textos():
	label_1.show()
	label_2.show()
	label_3.show()
	label_4.show()
	question_label.show()
	pregunta_rect.show()
	
func _termino_dialogo():
	_mostrart_textos()
