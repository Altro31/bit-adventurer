extends Node

var audio2 = false
var player: Player

func _ready():
	get_tree().paused = false


func _on_01_finished() -> void:
	if audio2:
		$Camera/Audio/Audio02.play()
		if player:
			player.toggle_freeze()
	else:
		audio2 = true

func _on_audio_02_activate(body: Node2D) -> void:
	if body is Player:
		$ActivarAudio02/Collision.set_deferred("disabled",true)
		if audio2:
			$Camera/Audio/Audio02.play()
		else:
			audio2 = true
			body.toggle_freeze()
			player = body
