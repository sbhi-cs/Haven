extends Control

func _ready():
	Global.enemieskilled = 0
	Global.score = 0
	Global.height = 0

func _on_againbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_menubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://menuscreen.tscn")
