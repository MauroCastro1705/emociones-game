extends Node2D
@onready var pie_chart: PieChart = %PieChart
@onready var total_respuestas: Label = $total_respuestas
var menu:PackedScene = preload("res://scenes/menu/menu.tscn")

func _ready() -> void:
	pie_chart.elements = Global.contadores #traemos diccionario desde Global
	print("elemntos2: " , pie_chart.elements)
	total_respuestas.text = "Respuestas totales: " + str(Global.respuestas)


func _on_volver_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
