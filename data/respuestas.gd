extends Node
# Banco de diálogos y respuestas. Cada nodo tiene: pregunta, opciones[4] y next[4] (ids de siguiente nodo)

##formato:##
#nombre del nodo
#pregunta que le hace al personaje
#opciones de respuestas
#nodos a los que sigue cada respuesta


const RESPUESTAS := {
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
		"pregunta": "La persona sonríe.",
		"opciones": [
			"Pedir ayuda", 
			"Volver al inicio", 
			"Cambiar de tema", 
			"Despedirte"],
		"next": ["inicio", "inicio", "broma", "fin"]
	},

	"ignorar": {
		"pregunta": "Pasás de largo. Sentís una mirada detrás tuyo…",
		"opciones": [
			"Volver al inicio", 
			"Acelerar el paso", 
			"Esconderte", 
			"Silbar"],
		"next": ["inicio", "fin", "fin", "fin"]
	},

	"preguntar": {
		"pregunta": "Estás en el Viejo Mercado.",
		"opciones": [
			"Buscar una posada",
			 "Comprar mapas", 
			"Seguir explorando", 
			"Volver al inicio"],
		"next": ["fin", "fin", "fin", "inicio"]
	},

	"broma": {
		"pregunta": "No se ríe. Silencio incómodo.",
		"opciones": [
			"Pedir perdón", 
			"Decir otra broma", 
			"Huir", 
			"Quedarte callado"],
		"next": ["saludo", "fin", "fin", "fin"]
	},

	"fin": {
		"pregunta": "Fin de la demo. ¡Gracias por jugar!",
		"opciones": ["", "", "", ""],
		"next": ["", "", "", ""]
	}
}



#aca funciones con los dialogos para llamar en MAIN
##formato##
#funcion con nombre y personajes uqe incluyer
#llamamos la funcion de dialogic para que cargue la timeline correspndiente
#registrarmos personajes a la timeline para que sepa donde estan en la pantalla

func primer_dialogo(pj1, pj2):
	var layout = Dialogic.start("res://dialogic/conversacion_prueba.dtl")
	layout.register_character(load("res://dialogic/character1.dch"),pj1,)
	layout.register_character(load("res://dialogic/pedro.dch"),pj2,)
	
