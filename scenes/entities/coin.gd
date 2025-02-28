extends Area2D

func _on_body_entered():
	$Sprite.set_animation("off")
	GLOBAL.score += 100
