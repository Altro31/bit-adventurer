extends Area2D

func _on_player_entered(body):
	if body is Player:
		body.speed = 250
		$Sprite.play("off")
		$Collision.set_deferred("disabled",true)
