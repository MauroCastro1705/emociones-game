extends Node2D

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

var opciones = []

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
	mostrar_dialogo(dialogo)

func mostrar_dialogo(data: Dictionary) -> void:
	# texto principal
	question_label.text = data["pregunta"]
	for opcion in range(opciones.size()): #iteramos entre opciones
		var button: Button = opciones[opcion]["button"]
		var label: Label = opciones[opcion]["label"]

		label.text = data["opciones"][opcion]

		if button.pressed.is_connected(_on_option_selected):
			button.pressed.disconnect(_on_option_selected)
		button.pressed.connect(_on_option_selected.bind(opcion))

func _on_option_selected(index: int) -> void:
	match index:
		0: print("Elegiste HABLAR")
		1: print("Elegiste IGNORAR")
		2: print("Elegiste PREGUNTAR")
		3: print("Elegiste BROMA")
