extends Node

var gravity_magnitude = Vector3(0, ProjectSettings.get_setting("physics/3d/default_gravity"), 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func CalculateDirection(position: Vector3,
						target_position: Vector3,
						bullet_velocity: float,
						target_velocity: Vector3):
	
	var deltaPos: Vector3 = target_position - position

	var range: float = deltaPos.length()
	var time: float = range / bullet_velocity

	return target_position - time * target_velocity + gravity_magnitude / 2 * time * time
