class_name Missile
extends Projectile

@export var extra_speed: float = 10

func _physics_process(delta: float) -> void:
	super(delta)

	velocity = global_position.direction_to(target_manager.target.global_position) * velocity.length()
	velocity += global_position.direction_to(target_manager.target.global_position) * extra_speed
