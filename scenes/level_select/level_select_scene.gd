extends Node2D
const MAIN_MENU_SCENE := "res://scenes/menu/menu.tscn"

func _on_volver_pressed() -> void:
	_go_back()

func _go_back() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
