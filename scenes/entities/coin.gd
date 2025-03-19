extends Area2D

func _on_player_entered(body):
	if body is Player:
		$Sprite.play("off")
		$Collision.set_deferred("disabled",true)
