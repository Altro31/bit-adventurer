extends ColorRect

@export var gui: GUI

func _on_restart():
	GLOBAL.score = gui.score
	get_tree().reload_current_scene()

func _play_win_music():
	$WinOst.play()
	
func _play_game_over_music():
	$GameOverOst.play(2.5)

func _on_exit():
	get_tree().quit()

func _on_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu.tscn")

func _on_pause():
	get_tree().paused = not get_tree().paused
	visible= not visible

func _on_resume():
	get_tree().paused = false
	visible = not visible
	
func _on_next():
	get_tree().change_scene_to_file(gui.next_level)
