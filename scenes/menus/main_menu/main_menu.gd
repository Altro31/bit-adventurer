extends Control

func _on_ready():
	$Buttons/Start.grab_focus()
	$Buttons/Continue.visible = GLOBAL.progress > 0
	$Buttons/Start.visible = GLOBAL.progress == 0
	
func _on_start_pressed():
	GLOBAL.progress = 0
	GLOBAL.score = 0
	get_tree().change_scene_to_file("res://scenes/levels/level_0.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits/Credits.tscn")

func _on_exit_pressed():
	get_tree().quit()


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_"+str(GLOBAL.progress+1)+".tscn")


func _on_nivels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/levels/menu_level.tscn")
