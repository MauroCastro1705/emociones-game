extends Node2D
var version = ProjectSettings.get_setting("application/config/version")
@onready var version_label: Label = $Label
var mainLevel:PackedScene = preload("res://scenes/main_scene/main_scene.tscn")

func _ready() -> void:
	version_label.text = "Verison: " + str(version)
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(mainLevel)


func _on_exit_pressed() -> void:
	get_tree().quit()
