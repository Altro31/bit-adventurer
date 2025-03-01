extends Area2D

@export var gui: CanvasLayer

func body_entered(body):
	if body is Player:
		gui.win()
		
