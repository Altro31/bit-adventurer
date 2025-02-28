extends CharacterBody2D
class_name Player

var axis: Vector2 = Vector2.ZERO
var death: bool = false

@export var gui: CanvasLayer

@export var speed: int = 128
@export var gravity: int = 36
@export var jump: int = 368


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match death:
		true:
			death_control()
		false:
			motion_control()

func get_axis()->Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) -int(Input.is_action_pressed("ui_left"))
	return axis.normalized()

func _input(event: InputEvent):
	if not death and is_on_floor() and event.is_action_pressed("ui_accept"):
		jump_control(1)
	
func death_control():
	velocity.x = 0
	velocity.y += gravity
	move_and_slide()

func motion_control():
	if not get_axis().x == 0:
		$Sprite.scale.x = get_axis().x
		
	velocity.x = get_axis().x * speed
	velocity.y += gravity
	
	move_and_slide()
	
	match is_on_floor():
		true:
			if get_axis().x == 0:
				$Sprite.set_animation("idle")
			else:
				$Sprite.set_animation("run")
		false:
			if velocity.y < 0:
				$Sprite.set_animation("jump")
			else:
				$Sprite.set_animation("fall")

func jump_control(power: float):
	velocity.y = -jump * power
	
func damage_control():
	death = true
	$Sprite.set_animation("death")

func _on_hit_body_entered(body):
	if (body is Enemy and velocity.y >= 0):
		body.damage_control(1)
		jump_control(0.75)

func _on_sprite_animation_finished():
	if $Sprite.animation == "death":
		gui.game_over()
		
