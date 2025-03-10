extends Area2D

@export var gui: GUI
@export var power: float = 1.5

func body_entered(body):
	if body is Player:
		body.ultraSpeed = true
		body.ultra_speed_power = power
		
