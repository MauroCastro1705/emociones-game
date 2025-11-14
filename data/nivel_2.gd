extends Node

const RESPUESTAS := {
	"inicio": {
		"pregunta": "Estas compartiendo un momento con tus amigos en clase. A tu lado, un grupo de compañeros estan hablando muy fuerte y molestando a vos y a tus amigos.",
		"opciones": ["Los ignoras", "Dialogas con tus compañeros", "Insultas", "Actuas con calma"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo1", "Dialogo1", "Dialogo1", "Dialogo1"]
	},

	"Dialogo1": {
		"pregunta": "Jeremias, el mas grandote, se separa de su grupo y se acerca a ustedes con una mirada intimidante.",
		"opciones": ["dejas que avanze", "no queres problemas", "seguis insultando", "lo afrontas"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo2", "Dialogo2", "Dialogo3", "Dialogo3"]
	},

	"Dialogo2": {
		"pregunta": "Jere esta frente a vos y te empieza a molestar.",
		"opciones": ["Te quedas callado", "Dialogas con Jeremias", "Empujas a Jeremias", "Intentas frenar a Jeremias"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo4", "Dialogo4", "Dialogo5", "Dialogo5"]
	},

	"Dialogo3": {
		"pregunta": "Jeremias esta frente a vos. Te insulta y te empuja.",
		"opciones": ["Te quedas callado", "Dialogas con Jeremias", "Empujas a Jeremias", "Intentas frenar a Jeremias"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo4", "Dialogo4", "Dialogo5", "Dialogo5"]
	},

	"Dialogo4": {
		"pregunta": "Jeremias se rie de vos, te quiere humillar frente a los demas.",
		"opciones": ["Te acobardas", "tratas de razonar con Jeremias", "Lo insultas", "Te plantas porque no le tenes miedo"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo7", "Dialogo6", "Dialogo3", "Dialogo8"]
	},

	"Dialogo5": {
		"pregunta": "Jeremias esta enojado con vos y te esta insultando bastante fuerte, te quiere pegar.",
		"opciones": ["Evitas la confrontación", "Te juntas con tu grupo", "Le das un golpe", "Lo intentas frenar"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo10", "Dialogo9", "Dialogo11", "Dialogo6"]
	},

	# Nodos finales: sin opciones, terminan automáticamente
	"Dialogo6": {
		"pregunta": "Enfrentas el conflicto y te haces respetar. Mediante dialogo frenaste a Jeremias y decidió dejarte en paz. Tus amigos te bancan.",
		 "opciones": [], 
		"next": [], 
		"final": true
		},
		
	"Dialogo7": {
		"pregunta": "El clima esta tenso y sentis incomodidad. Preferis evitar el conflicto y te alejas. No respondes con violencia.", 
		"opciones": [], 
		"next": [], 
		"final": true
		},
		
	"Dialogo8": {
		"pregunta": "Buscaste a tu grupo para afrontar juntos a Jeremias. Le ponen los puntos y el decide aflojar. Jeremias se retira.", 
		"opciones": [], 
		"next": [], 
		"final": true
		},
		
	"Dialogo9": {
		"pregunta": "Llegaste a una discución con Jeremias, Pediste que no molesten mas y tus amigos te bancaron. Jeremias y vos se calman y vuelven a lo suyo.", 
		"opciones": [], 
		"next": [], 
		"final": true
		},
		
	"Dialogo10": {
		"pregunta": "Decidis evitar el conflicto de violencia. El conflicto no creció y se evitó. Regresas a tu grupo de amigos y te quedas pensando en lo que pasó.", 
		"opciones": [], 
		"next": [], 
		"final": true
		},
		
	"Dialogo11": {
		"pregunta": "Te fuiste a las manos, ya no importa nada mas. Ambos se lastimaron. El clima esta tenso, el preceptor freno la pelea.", 
		"opciones": [], 
		"next": [], 
		"final": true
		}
}


#func primer_dialogo(pj1, pj2):
#	var layout = Dialogic.start("res://dialogic/conversacion_prueba.dtl")
#	layout.register_character(load("res://dialogic/character1.dch"), pj1)
#	layout.register_character(load("res://dialogic/pedro.dch"), pj2)
