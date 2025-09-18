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

# ejemplo
var dialogo = {
	"pregunta": "¿Qué harás?",
	"opciones": [
		"Hablar con el personaje",
		"Ignorar y seguir",
		"Preguntar sobre el lugar",
		"Hacer una broma"
	]
}

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
	question_label.text = node["pregunta"]

	# Setear texto/visibilidad y (re)conectar los botones
	for i in range(opciones.size()):
		var txt = node["opciones"][i]
		var btn: Button = opciones[i]["button"]
		var lab: Label = opciones[i]["label"]
		var opt_node: Node = opciones[i]["node"]

		lab.text = txt
		# Si la opción está vacía, ocultamos el contenedor de esa opción
		opt_node.visible = txt != ""

		# limpiar y reconectar
		btn.pressed.disconnect_all()
		btn.pressed.connect(_on_option_selected.bind(i))

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
