extends Node
# Banco de diálogos. Cada nodo tiene: pregunta, opciones[4] y next[4] (ids de siguiente nodo)
const DIALOGOS := {
	"inicio": {
		"pregunta": "Te cruzás con alguien misterioso. ¿Qué hacés?",
		"opciones": [
			"Saludar amablemente",
			"Ignorar y seguir",
			"Preguntar dónde estás",
			"Hacer una broma"
		],
		"next": ["saludo", "ignorar", "preguntar", "broma"]
	},

	"saludo": {
		"pregunta": "La persona sonríe. \"¡Hola!\"",
		"opciones": ["Pedir ayuda", "Presentarte", "Cambiar de tema", "Despedirte"],
		"next": ["ayuda", "presentacion", "tema", "fin"]
	},

	"ignorar": {
		"pregunta": "Pasás de largo. Sentís una mirada detrás tuyo…",
		"opciones": ["Volver", "Acelerar el paso", "Esconderte", "Silbar"],
		"next": ["inicio", "fin", "fin", "fin"]
	},

	"preguntar": {
		"pregunta": "Responde: \"Estás en el Viejo Mercado.\"",
		"opciones": ["Buscar una posada", "Comprar mapas", "Seguir explorando", "Volver al inicio"],
		"next": ["posada", "mapas", "fin", "inicio"]
	},

	"broma": {
		"pregunta": "No se ríe. Silencio incómodo.",
		"opciones": ["Pedir perdón", "Decir otra broma", "Huir", "Quedarte callado"],
		"next": ["saludo", "fin", "fin", "fin"]
	},

	"fin": {
		"pregunta": "Fin de la demo. ¡Gracias por jugar!",
		"opciones": ["", "", "", ""],
		"next": ["", "", "", ""]
	}
}
