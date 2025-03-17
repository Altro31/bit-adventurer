extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"HBoxContainer/Buttons/Nivel 2".disabled = GLOBAL.progress < 2
	$"HBoxContainer/Buttons/Nivel 3".disabled = GLOBAL.progress < 3
	$"HBoxContainer/Buttons2/Nivel 4".disabled = GLOBAL.progress < 4
	$"HBoxContainer/Buttons2/Nivel 5".disabled = GLOBAL.progress < 5
	$"HBoxContainer/Buttons2/Nivel 6".disabled = GLOBAL.progress < 6

func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
	
func _on_nivel_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
	
func _on_nivel_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
	
func _on_nivel_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
	
func _on_nivel_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_6.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu.tscn")
