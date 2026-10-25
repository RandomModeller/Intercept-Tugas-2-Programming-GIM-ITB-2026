extends Node2D

@export var position_scale: Vector2 = Vector2(0.5, 0.5)

func _ready() -> void:
	position = get_viewport_rect().size * position_scale
