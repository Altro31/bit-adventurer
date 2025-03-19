extends Node2D

@export var score: int = 20

func _on_player_entered(body):
	if body is Player:
		$Sprite.play("off")
		$Collision.set_deferred("disabled",true)
		GLOBAL.score += score
