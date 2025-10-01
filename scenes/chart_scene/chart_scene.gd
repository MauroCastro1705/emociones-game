extends Node2D
@onready var pie_chart: PieChart = %PieChart

func _ready() -> void:
	pie_chart.elements = Global.contadores #traemos diccionario desde Global
	print("elemntos2: " , pie_chart.elements)
