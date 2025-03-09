extends Area2D
class_name Bomb

@export var time: int = 3

var player: Player
var onTime: bool = false

func _on_player_detected(body):
	if not onTime and body is Player:
		onTime =true
		player = body
		$Sprite.play("alert")
		
func _on_alert_end():
	if $Sprite.animation == "explode":
		queue_free()

func _on_animation_loop():
	if $Sprite.animation == "alert":
		time -=1
		if time <= 0:
			$Sprite.play("explode")
			if player != null:
				player.damage_control()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null
