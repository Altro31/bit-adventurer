extends Area2D

@export var score: int = 50

func _on_player_entered(body):
	if body is Player:
		$Sprite.set_animation("off")
		$Collision.set_deferred("disabled",true)
		GLOBAL.score += score
