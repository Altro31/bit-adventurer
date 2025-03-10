extends Node

var audio2 = false

func _ready():
	get_tree().paused = false


func _on_01_finished() -> void:
	if audio2:
		$Camera/Audio/Audio02.play()
	else:
		audio2 = true

func _on_audio_02_activate(body: Node2D) -> void:
	$ActivarAudio02/Collision.set_deferred("disabled",true)
	if audio2:
		$Camera/Audio/Audio02.play()
	else:
		audio2 = true


func _on_audio_02_finished() -> void:
	$Camera/Audio/Audio02_5.play()


func _on_audio_02_5_finished() -> void:
	$Camera/Audio/Audio02_5.play(0.04)
