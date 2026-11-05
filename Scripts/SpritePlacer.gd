extends Node2D

@export var position_scale: Vector2 = Vector2(0.5, 0.5)

var previous_screen_size: Vector2 = Vector2(0, 0)

func _process(delta: float) -> void:
	if previous_screen_size != get_viewport_rect().size:
		print("Recalculate UI")

		position = get_viewport_rect().size * position_scale

		previous_screen_size = get_viewport_rect().size
