extends Node2D
@onready var pie_chart: PieChart = %PieChart
@onready var total_respuestas: Label = $total_respuestas

func _ready() -> void:
	pie_chart.elements = Global.contadores #traemos diccionario desde Global
	print("elemntos2: " , pie_chart.elements)
	total_respuestas.text = "Respuestas totales: " + str(Global.respuestas)
