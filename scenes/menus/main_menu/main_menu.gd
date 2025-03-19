extends Control

@onready var globalAudio: AudioStreamPlayer2D = GlobalScene.get_node("FF7TitleOst")

func _on_ready():
	$Buttons/Start.grab_focus()
	$Buttons/Continue.visible = GLOBAL.progress > 0
	if not globalAudio.playing: 
		globalAudio.play(0)
	
func _on_start_pressed():
	GLOBAL.progress = 0
	GLOBAL.score = 0
	globalAudio.stop()
	get_tree().change_scene_to_file("res://scenes/levels/level_0.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits/Credits.tscn")

func _on_exit_pressed():
	get_tree().quit()


func _on_continue_pressed() -> void:
	globalAudio.stop()
	get_tree().change_scene_to_file("res://scenes/levels/level_"+str(GLOBAL.progress)+".tscn")


func _on_nivels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/levels/menu_level.tscn")
