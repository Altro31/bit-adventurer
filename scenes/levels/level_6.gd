extends "res://scenes/levels/level.gd"

func _on_ultra_speed_body_entered(body: Node2D) -> void:
	if body is Player:
		$Player/Speed.emitting=true
		$Player/Speed.amount=200


func _on_ultra_speed_3_body_entered(body: Node2D) -> void:
	if body is Player:
		$Player/Speed.emitting=true
		$Player/Speed.amount=300


func _on_ultra_speed_4_body_entered(body: Node2D) -> void:
	if body is Player:
		$Player/Speed.emitting=true
		$Player/Speed.amount=1000
