extends Node2D
const MAIN_MENU_SCENE := "res://scenes/menu/menu.tscn"
const MAIN_GAME_ESCENE := "res://scenes/main_scene/main_scene.tscn"
@onready var panel_escena_1: Panel = $VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Panel_escena1
@onready var panel_escena_2: Panel = $VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer2/Panel_escena2
@onready var panel_escena_3: Panel = $VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer3/Panel_escena3

@onready var label_escena_2: Label = %Label_escena2
@onready var label_escena_1: Label = %Label_escena1
@onready var label_escena_3: Label = %Label_escena3




func _ready() -> void:
	_ocultar_todos_paneles()
	_set_label_info()

func _set_label_info():
	label_escena_1.text = "Cómo reaccionamos cuando un compañero molesta a un amigo"
	label_escena_2.text = "Cómo nos manejamos frente a la provocación"
	label_escena_3.text = "Cómo actuamos cuando competimos en un deporte."

func _ocultar_todos_paneles():
	panel_escena_1.modulate= Color(1,1,1,0)
	panel_escena_2.modulate= Color(1,1,1,0)
	panel_escena_3.modulate= Color(1,1,1,0)
	
func _mostrar_panel(panel: Panel):
	panel.modulate= Color(1,1,1,1)
	
func _ocultar_este_panel(panel: Panel):
	panel.modulate= Color(1,1,1,0)
	
func _on_volver_pressed() -> void:
	_go_back()

func _go_back() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
	
func _go_to_main_scene() -> void:
	get_tree().change_scene_to_file(MAIN_GAME_ESCENE)

func _on_escena_1_pressed() -> void:
	Global.escena_elegida_global = 1
	print("escena elegida 1")
	_go_to_main_scene()


func _on_escena_2_pressed() -> void:
	Global.escena_elegida_global = 2
	print("escena elegida 2")
	_go_to_main_scene()


func _on_escena_3_pressed() -> void:
	Global.escena_elegida_global = 3
	print("escena elegida 3")
	_go_to_main_scene()


func _on_escena_1_mouse_entered() -> void:
	_mostrar_panel(panel_escena_1)


func _on_escena_1_mouse_exited() -> void:
	_ocultar_este_panel(panel_escena_1)


func _on_escena_2_mouse_entered() -> void:
	_mostrar_panel(panel_escena_2)


func _on_escena_2_mouse_exited() -> void:
	_ocultar_este_panel(panel_escena_2)


func _on_escena_3_mouse_entered() -> void:
	_mostrar_panel(panel_escena_3)


func _on_escena_3_mouse_exited() -> void:
	_ocultar_este_panel(panel_escena_3)
