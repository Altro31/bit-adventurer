extends CharacterBody2D
class_name Enemy

@export var health: int = 1
@export var score: int = 70

@export var speed: int = 16
@export var gravity: int = 16

@export var dir = 1

func _process(_delta):
	if health > 0 and $Sprite.animation=="walk":
		motion_control()

func motion_control():
	$Sprite.scale.x = dir
	if is_on_wall():
		dir *= -1
		
	velocity.x = dir * speed
	velocity.y += gravity
	
	move_and_slide()
	
func damage_control(damage: int):
	health -= damage
	
	if health <= 0:
		$Sprite.play("death")
		$Collision.set_deferred("disabled",true)
		$Sprite/AreaHit/Collision.set_deferred("disabled",true)
		gravity = 0
		GLOBAL.score+=score
		
func _on_sprite_animation_finished():
	match $Sprite.animation:
		"death":
			queue_free()
		"spawn":
			$Sprite.play("walk")
		
func _on_area_hit_body_entered(body):
	if body is Player:
		body.damage_control()


func _on_visibility_changed() -> void:
	print("Visible")


func _on_player_detected(body: Node2D) -> void:
	if body is Player and $Sprite.animation == "spaw_idle":
		$Detection/Collision.disabled = true
		$Sprite.play("spawn")
