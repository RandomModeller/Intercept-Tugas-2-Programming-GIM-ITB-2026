extends RayCast3D

@export var text: Label

func _process(delta: float) -> void:
	if is_colliding():
		text.text = String.num(global_position.distance_to(get_collision_point()), 2) + "m"
	else:
		text.text = "> 999m"
