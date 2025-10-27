extends Node2D
const MAIN_MENU_SCENE := "res://scenes/menu/menu.tscn"
const MAIN_GAME_ESCENE := "res://scenes/main_scene/main_scene.tscn"

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
