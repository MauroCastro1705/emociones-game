extends Node

const RESPUESTAS := {
	"inicio": {
		"pregunta": "Estás con tus compañeros de curso en las clases de educación física. Están en el campo de deportes jugando al fútbol contra los más grandes. El partido está picante y te meten una falta que te lastima el pie.",
		"opciones": ["Metés un empujón", "Continuás el juego", "Pedís que tengan cuidado", "Insultás"], # ROJO, AZUL, VERDE, NARANJA
		"next": ["Dialogo1", "Dialogo1", "Dialogo1", "Dialogo1"]
	},

	"Dialogo1": {
		"pregunta": "El partido continúa. El otro equipo está en tu área y cuando vas a sacarle la pelota al jugador te mete un cuerpo con violencia y te tira al suelo.",
		"opciones": ["El juego continúa", "Te acercás a hablar", "Seguís insultando", "Metés un cuerpo con fuerza"], # AZUL, VERDE, NARANJA, ROJO
		"next": ["Dialogo3", "Dialogo2", "Dialogo5", "Dialogo3"]
	},

	"Dialogo2": {
		"pregunta": "Trataste de hablar con ellos, pero no te dan importancia y te ignoran.",
		"opciones": ["Te retirás", "Vas con tus amigos", "Los insultás", "Le sacás la pelota con bronca"], # AZUL, VERDE, NARANJA, ROJO
		"next": ["Dialogo4", "Dialogo6", "Dialogo7", "Dialogo8"]
	},

	"Dialogo3": {
		"pregunta": "Seguís el partido porque sabés que la agresividad es parte del juego.",
		"opciones": ["Vas con tus amigos", "Les tirás un chiste agresivo", "Le metés una falta a propósito", "Continuás el partido"], # VERDE, NARANJA, ROJO, AZUL
		"next": ["Dialogo6", "Dialogo7", "Dialogo8", "Dialogo6"]
	},

	"Dialogo4": {
		"pregunta": "Tu contrincante y sus amigos te bardean.",
		"opciones": ["Le sacás la pelota con bronca", "Respondés con un chiste", "Los insultás agresivamente", "Los ignorás"], # ROJO, VERDE, NARANJA, AZUL
		"next": ["Dialogo6", "Dialogo7", "Dialogo8", "Dialogo6"]
	},

	"Dialogo5": {
		"pregunta": "Tirás a tu contrincante al suelo y te mira con enojo. Se está acercando a vos de manera agresiva.",
		"opciones": ["Te alejás", "Te juntás con tu grupo", "Le das un pelotazo", "Te imponés con amenazas"], # AZUL, VERDE, ROJO, NARANJA
		"next": ["Dialogo4", "Dialogo6", "Dialogo7", "Dialogo8"]
	},

	"Dialogo6": {
		"pregunta": "Se juntan con tus amigos y van a jugar de forma agresiva y violenta contra los contrincantes.",
		"opciones": ["Jugás a ganar", "Coordinás con tu equipo", "Jugás agresivamente con tu equipo", "Jugás con violencia"], # AZUL, VERDE, NARANJA, ROJO
		"next": ["Dialogo8", "Dialogo8", "Dialogo8", "Dialogo8"]
	},

	"Dialogo7": {
		"pregunta": "Junto a tus amigos van a jugar imponiéndose frente al contrincante. El partido está picante y el juego se vuelve cada vez más agresivo entre ambos.",
		"opciones": ["Jugás con normalidad", "Tratás de ganar el juego", "Hacés chistes y buscás molestar", "Jugás con habilidad y agresividad"], # AZUL, VERDE, NARANJA, ROJO
		"next": ["Dialogo9", "Dialogo9", "Dialogo10", "Dialogo10"]
	},

	"Dialogo8": {
		"pregunta": "Se empujan y la situación escala con violencia entre los grupos.",
		"opciones": ["Abandonás la pelea", "Llamás al profe", "Tratás de frenar la pelea", "Golpeás con violencia"], # AZUL, VERDE, NARANJA, ROJO
		"next": ["Dialogo11", "Dialogo11", "Dialogo11", "Dialogo11"]
	},

	# Nodos finales
	"Dialogo9": {
		"pregunta": "El partido termina con la victoria de tu equipo. Demostraron que pueden ganar a sus adversarios en su propio juego.",
		"opciones": [],
		"next": [],
		"final": true
	},

	"Dialogo10": {
		"pregunta": "El partido termina con la victoria de tu equipo, jugaron con agresividad y eso es parte del juego. Regresaron del club con lastimaduras superficiales.",
		"opciones": [],
		"next": [],
		"final": true
	},

	"Dialogo11": {
		"pregunta": "El conflicto llama la atención del profesor y este interviene para frenarlos. Ambos están lastimados físicamente y quedaron con mucho enojo. La pelea fue reportada a la autoridad.",
		"opciones": [],
		"next": [],
		"final": true
	}
}
