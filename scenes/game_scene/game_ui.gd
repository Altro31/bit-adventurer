extends CanvasLayer
class_name GUI

@export var level: String = "1"
@export_file("*level_*.tscn") var next_level: String

var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Container/HBoxContainer/Level.text = "nivel "+level
	score = GLOBAL.score
	
	#$Controls/Controls/HBoxContainer2/JumpButton.connect("button_up",)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_on_pause()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Container/HBoxContainer2/Score.text = "score: "+ str(GLOBAL.score)
	
func game_over():
	get_tree().paused = true
	$GameOver.visible = true
	$GameOver._play_game_over_music()
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($GameOver,"modulate",Color(1,1,1,0.8),1.0)

func win():
	$Win/Score.text = "puntuación: "+str(GLOBAL.score)
	get_tree().paused = true
	$Win._play_win_music()
	$Win.visible = true
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($Win,"modulate",Color(1,1,1,0.8),1.0)

func _on_pause():
	get_tree().paused = not get_tree().paused
	$Pause.visible= not $Pause.visible
