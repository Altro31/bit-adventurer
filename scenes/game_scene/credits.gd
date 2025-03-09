extends Node2D

func _physics_process(delta: float) -> void:
	print("Hola")
	$Control.position.y -= 1
