extends Camera2D
class_name Camera

@export var player: Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = player.position
