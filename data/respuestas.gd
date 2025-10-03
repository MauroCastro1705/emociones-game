extends Node
# Banco de diálogos y respuestas. Cada nodo tiene: pregunta, opciones[4] y next[4] (ids de siguiente nodo)

#formato:#
#nombre del nodo
#pregunta que le hace al personaje
#opciones de respuestas
#nodos a los que sigue cada respuesta


const RESPUESTAS := {
	"inicio": {
		"pregunta": "Estás con tus amigos en un recreo en la clase. Roberto, un compañero de clase pasa cerca de ustedes y empieza a molestar de manera inofensiva a uno de tus amigos",
		"opciones": [
			"AZUL Ignorar la situación",
			"",
			"ROJO Intervenís agresivamente",
			"NARANJA Intervenís"
		],
		"next": ["azul_ignorar", "", "rojo_intervenis", "naranja_intervenis"]
	},

	"azul_ignorar": {
		"pregunta": "AZUL Decidís ignorar la situación",
		"opciones": ["Continuar", "", "", ""],
		"next": ["continuar", "", "", ""]
	},

	"naranja_intervenis": {
		"pregunta": "NARANJA Lo mirás a Roberto y le pedís que por favor deje de molestar",
		"opciones": ["Continuar3", "", "", ""],
		"next": ["continuar3", "", "", ""]
	},

	"rojo_intervenis": {
		"pregunta": "ROJO Ya tuviste problemas con Roberto en el pasado, lo enfrentás diciendo que se vaya",
		"opciones": ["Continuar4", "", "", ""],
		"next": ["continuar4", "", "", ""]
	},

	"continuar": {
		"pregunta": "Roberto sigue molestando a tu amigo y este no parece defenderse, sino que se pone nervioso y está intimidado",
		"opciones": [
			"",
			"VERDE Tratar de hablar con Roberto",
			"ROJO Intervenís con insulto",
			""
		],
		"next": ["", "verde_hablar", "naranja_insulto", ""]
	},

	"continuar3": {
		"pregunta": "\"No te metas gil\". Roberto te insulta",
		"opciones": [
			"",
			"VERDE Tratar de hablar con Roberto",
			"ROJO Respondés con actitud",
			""
		],
		"next": ["", "verde_hablar", "naranja_actitud", ""]
	},

	"verde_hablar": {
		"pregunta": "\"Che, dejá de molestarlo, ¿no ves que la está pasando mal?\"",
		"opciones": ["Continuar1", "", "", ""],
		"next": ["continuar1", "", "", ""]
	},

	"naranja_insulto": {
		"pregunta": "Hey boludo! dejá de joder",
		"opciones": ["Continuar2", "", "", ""],
		"next": ["continuar2", "", "", ""]
	},

	"continuar1": {
		"pregunta": "Roberto te mira y te dice que no te metas mientras sigue molestando a tu amigo",
		"opciones": [
			"",
			"VERDE Avisar a un adulto",
			"",
			"NARANJA Intervenís con insulto"
		],
		"next": ["", "verde_aviso", "", "naranja_insulto"]
	},

	"continuar2": {
		"pregunta": "Roberto te mira y se ríe. Deja de molestar a tu amigo pero esto va a tener repercusiones después de clases",
		"opciones": ["", "", "", "Resultado 2"],
		"next": ["", "", "", "resultado2"]
	},

	"verde_aviso": {
		"pregunta": "Avisás a tu profesor de clase de la situación para que resuelva el conflicto",
		"opciones": ["Resultado 1", "", "", ""],
		"next": ["resultado1", "", "", ""]
	},

	"naranja_actitud": {
		"pregunta": "\"Me meto si quiero, dejá de molestarnos\"",
		"opciones": ["", "", "", "Continuar4"],
		"next": ["", "", "", "continuar4"]
	},

	"continuar4": {
		"pregunta": "Roberto te mira de manera agresiva y parece que te va a pegar",
		"opciones": [
			"",
			"",
			"ROJO Lo empujás",
			"NARANJA Te la bancás"
		],
		"next": ["", "", "rojo_empujas", "naranja_banca"]
	},

	"naranja_banca": {
		"pregunta": "Ambos están a punto de irse a las piñas pero el profesor los ve portándose mal y los frena",
		"opciones": ["Resultado 3", "", "", ""],
		"next": ["resultado3", "", "", ""]
	},

	"rojo_empujas": {
		"pregunta": "Roberto te devuelve el empujón y te caés al piso, el profesor los frena y los manda a detención",
		"opciones": ["Resultado 4", "", "", ""],
		"next": ["resultado4", "", "", ""]
	},

	"naranja_amenaza": {
		"pregunta": "\"Yo me la banco, vos tenés unos problemas me parece\"",
		"opciones": ["", "", "", "Continuar5"],
		"next": ["", "", "", "continuar5"]
	},

	"rojo_piña": {
		"pregunta": "Le das una trompada en la cara a Roberto y le dejás la nariz sangrando",
		"opciones": ["", "", "", "Continuar6"],
		"next": ["", "", "", "continuar6"]
	},

	"continuar5": {
		"pregunta": "Roberto te mira con enojo y tristeza",
		"opciones": [
			"AZUL Tratás de razonar",
			"",
			"ROJO Le das una piña en la cara",
			""
		],
		"next": ["azul_razonar", "", "rojo_piña", ""]
	},

	"continuar6": {
		"pregunta": "El profesor los frena a los dos y los manda a hablar con la directora",
		"opciones": ["Resultado 6", "", "", ""],
		"next": ["resultado6", "", "", ""]
	},

	"azul_razonar": {
		"pregunta": "\"No quiero pelear, así que dejá de molestarnos\"",
		"opciones": ["Resultado 5", "", "", ""],
		"next": ["resultado5", "", "", ""]
	},

	"resultado1": {
		"pregunta": "El profesor resuelve el conflicto, tus compañeros están sentados en clase pero tu amigo aún sigue triste",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
	},

	"resultado2": {
		"pregunta": "Se cruzaron después de clases y se dieron unas trompadas, ambos llegaron a sus casas lastimados",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
	},

	"resultado3": {
		"pregunta": "El profesor los manda a detención a los dos",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
	},

	"resultado4": {
		"pregunta": "Ambos fueron a detención pero vos estás lastimado levemente",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
	},

	"resultado5": {
		"pregunta": "El conflicto no escaló pero tu amigo está triste de no poder defenderse",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
	},

	"resultado6": {
		"pregunta": "Ambos están en dirección, Roberto tiene la nariz rota y deciden suspenderte una semana",
		"opciones": ["Continuar", "", "", ""],
		"next": ["", "", "", ""],
		"final": true,
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
	
