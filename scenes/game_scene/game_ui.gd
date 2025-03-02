extends CanvasLayer

@export var level: int = 1
@export var next_level: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level.text = "nivel "+str(level)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_text_clear_carets_and_selection"):
		_on_pause()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Container/Score.text = "score: "+ str(GLOBAL.score)
	
func game_over():
	get_tree().paused = true
	$GameOver.visible = true
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($GameOver,"modulate",Color(1,1,1,0.8),1.0)

func win():
	get_tree().paused = true
	$Win.visible = true
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($Win,"modulate",Color(1,1,1,0.8),1.0)

func _on_restart():
	get_tree().reload_current_scene()

func _on_exit():
	get_tree().quit()

func _on_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu.tscn")

func _on_pause():
	get_tree().paused = not get_tree().paused
	$PauseUI.visible= not $PauseUI.visible

func _on_resume():
	get_tree().paused = false
	$PauseUI.visible=false
	
func _on_next():
	get_tree().change_scene_to_file(next_level)
