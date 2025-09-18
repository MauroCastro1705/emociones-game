extends Node2D

const DIALOGOS = preload("res://data/dialogos.gd")
@onready var question_label: Label = $pregunta/pregunta
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

#setup
var opciones = []
var current_id := "inicio" 

func _ready():
	opciones = [
		{"button": button_1, "label": label_1},
		{"button": button_2, "label": label_2},
		{"button": button_3, "label": label_3},
		{"button": button_4, "label": label_4},
	]
	mostrar_dialogo()


func mostrar_dialogo() -> void:
	var node = DIALOGOS.DIALOGOS.get(current_id, null)
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
	var node = DIALOGOS.DIALOGOS[current_id]
	var next_list: Array = node.get("next", [])
	var next_id := ""
	if index >= 0 and index < next_list.size():
		next_id = str(next_list[index])

	if next_id == "" or not DIALOGOS.DIALOGOS.has(next_id):
		# Sin destino o fin: podés deshabilitar botones, mostrar cartel, etc.
		print("Fin o sin 'next' para la opción ", index)
		_desactivar_opciones()
		return

	current_id = next_id
	mostrar_dialogo()

func _desactivar_opciones() -> void:
	for o in opciones:
		(o["button"] as Button).disabled = true
