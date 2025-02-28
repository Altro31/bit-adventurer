extends CharacterBody2D
class_name Enemy

@export var health: int = 1
@export var score: int = 100

@export var speed: int = 16
@export var gravity: int = 16

@export var dir = 1

func _process(delta):
	if health > 0:
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
		$Sprite.set_animation("death")
		$Collision.set_deferred("disabled",true)
		$Sprite/AreaHit/Collision.set_deferred("disabled",true)
		gravity = 0
		GLOBAL.score+=score
		
func _on_sprite_animation_finished():
	if $Sprite.animation == "death":
		queue_free()
		
func _on_area_hit_body_entered(body):
	if body is Player:
		body.damage_control()
