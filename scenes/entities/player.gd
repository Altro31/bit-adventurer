extends CharacterBody2D
class_name Player

var axis: Vector2 = Vector2.ZERO
var death: bool = false
var won: bool = false

@export var gui: GUI

@export_category("Configs")
@export var speed: int = 148
@export var gravity: int = 25
@export var jump: int = 368

@export_category("Skills")
@export var doubleJump = true
@export var ultraSpeed = false

var disableDoubleJump: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disableDoubleJump = not doubleJump


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Sprite.animation == "win":
		return
	
	if is_on_floor() and won:
		$Sprite.play("win")
		return
		
	restoreDoubleJump()
	match death:
		true:
			death_control()
		false:
			motion_control()

func get_axis()->Vector2:
	axis.x = int(Input.is_action_pressed("rigth")) -int(Input.is_action_pressed("left"))
	return axis.normalized()

func _input(event: InputEvent):
	if not death and event.is_action_pressed("jump"):
		if is_on_floor():
			jump_control(1)
		if not is_on_floor() and doubleJump:
			doubleJump = false
			jump_control(1)
	
func death_control():
	velocity.x = 0
	velocity.y += gravity
	move_and_slide()

func motion_control():
	if not get_axis().x == 0:
		$Sprite.scale.x = get_axis().x
	
	if ultraSpeed:
		velocity.x = 1.5 * speed
	else:
		velocity.x = get_axis().x * speed
		
	velocity.y += gravity
	
	move_and_slide()
	
	match is_on_floor():
		true:
			if get_axis().x == 0 and not ultraSpeed:
				$Sprite.play("idle")
			else:
				$Sprite.play("run")
		false:
			if velocity.y < 0:
				$Sprite.play("jump")
			else:
				$Sprite.play("fall")
				
func ultraSpeed_control():
	velocity.x = 1.5 * speed
	velocity.y += gravity
	
	move_and_slide()
	

func jump_control(power: float):
	velocity.y = -jump * power
	
func damage_control():
	death = true
	$Sprite.play("death")

func _on_hit_body_entered(body):
	if (body is Enemy and velocity.y >= 0):
		body.damage_control(1)
		jump_control(0.75)

func _on_sprite_animation_finished():
	if $Sprite.animation == "death":
		gui.game_over()
	if $Sprite.animation == "win":
		gui.win()

func restoreDoubleJump():
	if is_on_floor() and not doubleJump and not disableDoubleJump:
		doubleJump = true
		
func win():
	won = true
