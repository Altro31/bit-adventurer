extends Area2D

@export var gui: GUI
@export var power: float = 1.5

func body_entered(body):
	if body is Player:
		body.ultraSpeed = true
		var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		tween.tween_property(body,"ultra_speed_power",power,3.0)

		
