extends Node2D

func _ready() -> void:
	get_tree().paused = false

func _process(delta: float) -> void:
	$Control.position.y -= 1
