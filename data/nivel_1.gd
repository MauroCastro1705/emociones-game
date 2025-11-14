extends Node

const RESPUESTAS := {

	"inicio": {
		"pregunta": "Estas con tus amigos en clase, uno de tus compañeros empieza a molestar a tu amigo",
		"opciones": [
			"AZUL Lo ignoras",
			"VERDE Hablas con tu amigo",
			"NARANJA Pedis que no molesten",
			"ROJO Haces un llamado de atención"
		],
		"next": ["Dialogo1", "Dialogo1", "Dialogo2", "Dialogo2"]
	},

	"Dialogo1": {
		"pregunta": "Siguen molestando a tu amigo y a ustedes también.",
		"opciones": [
			"AZUL Pedis que no te molesten",
			"VERDE Te juntas con tu grupo",
			"NARANJA Lo insultas",
			"ROJO Lo queres alejar"
		],
		"next": ["Dialogo2", "Dialogo3", "Dialogo3", "Dialogo4"]
	},

	"Dialogo2": {
		"pregunta": "Tu compañero se junta con su grupo para molestarlos",
		"opciones": [
			"AZUL Los ignoras",
			"VERDE Hablas con tu grupo",
			"NARANJA Te defendes con tu grupo",
			"ROJO Insultas con tu grupo"
		],
		"next": ["Dialogo5", "Dialogo3", "Dialogo3", "Dialogo4"]
	},

	"Dialogo3": {
		"pregunta": "Ellos se rien y no les importa, siguen molestando con mas intensidad.",
		"opciones": [
			"AZUL Intentas hablar con ellos",
			"VERDE Hablas con un adulto",
			"NARANJA Los insultas y empujas",
			"ROJO Actuas con violencia"
		],
		"next": ["Dialogo7", "Dialogo8", "Dialogo6", "Dialogo6"]
	},

	"Dialogo4": {
		"pregunta": "Ellos miran con enojo y se acercan a ustedes.",
		"opciones": [
			"AZUL Tratas de dialogar",
			"VERDE Te defendes con tu grupo",
			"NARANJA Tratas de frenarlos con tu grupo",
			"ROJO Los agredis con tu grupo"
		],
		"next": ["Dialogo7", "Dialogo7", "Dialogo7", "Dialogo6"]
	},

	"Dialogo5": {
		"pregunta": "Ellos se enojan y se acercan con agresividad.",
		"opciones": [
			"AZUL Se mantienen al margen",
			"VERDE Tratas de razonar",
			"NARANJA Te plantas con tu grupo",
			"ROJO Los insultas y golpeas con tu grupo"
		],
		"next": ["Dialogo8", "Dialogo7", "Dialogo7", "Dialogo8"]
	},

	"Dialogo6": {
		"pregunta": "La situación escala de manera violenta",
		"opciones": [
			"AZUL Los tratas de frenar dialogando",
			"VERDE Pedis ayuda a un adulto",
			"NARANJA Con tu grupo tratas de frenarlos",
			"ROJO Respondes con violencia"
		],
		"next": ["Dialogo9", "Dialogo9", "Dialogo10", "Dialogo10"]
	},

	"Dialogo7": {
		"pregunta": "Con tu grupo de amigos lograron defenderse y el conflicto no escala.",
		"opciones": [
			"AZUL Con tu grupo se calman",
			"VERDE Dialogas para mantener orden",
			"NARANJA Se hacen respetar",
			"ROJO Se quieren imponer"
		],
		"next": ["Dialogo9", "Dialogo9", "Dialogo9", "Dialogo10"]
	},

	"Dialogo8": {
		"pregunta": "Un adulto interviene para frenar el conflicto",
		"opciones": [
			"AZUL Respetan al adulto",
			"VERDE Dialogas con el adulto",
			"NARANJA Explicas el conflicto",
			"ROJO Ignoras al adulto"
		],
		"next": ["Dialogo9", "Dialogo9", "Dialogo9", "Dialogo10"]
	},

	"Dialogo9": {
		"pregunta": "El conflicto se resuelve sin violencia, hay orden en la clase.",
		"opciones": ["", "", "", ""],
		"next": ["", "", "", ""],
		"final": true
	},

	"Dialogo10": {
		"pregunta": "El conflicto escala de manera violenta y un adulto interviene.",
		"opciones": ["", "", "", ""],
		"next": ["", "", "", ""],
		"final": true
	}
}
