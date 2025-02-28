extends Area2D
class_name Coin

func _on_body_entered(body):
	if body is Player:
		body.damage_control()
