extends Control

func _on_ready():
	$Buttons/Start.grab_focus()

func _on_start_pressed():
	GLOBAL.score = 0
	get_tree().change_scene_to_file("res://scenes/levels/level_0.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits/credits.tscn")

func _on_exit_pressed():
	get_tree().quit()
