extends Area2D

@export var gui: GUI

func body_entered(body):
	if body is Player:
		body.ultraSpeed = true
		
