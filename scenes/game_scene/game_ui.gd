extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Container/Score.text = "score: "+ str(GLOBAL.score)
	
func game_over():
	get_tree().paused = true
	
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($GameOver,"modulate",Color(1,1,1,0.8),1.0)

func _on_restart():
	get_tree().reload_current_scene()

func _on_exit():
	get_tree().quit()
