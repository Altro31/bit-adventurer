extends Node2D

func _ready() -> void:
	get_tree().paused = false

func _process(delta: float) -> void:
	$Control.position.y -= 1
	
func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action("pause")):
		get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu.tscn")
