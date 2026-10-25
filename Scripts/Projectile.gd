class_name Projectile
extends Node3D

@export var projectile_speed: float = 10
@export var lifetime: float = 10
@export var raycast: RayCast3D

var duration: float = 0
var velocity: Vector3

var gravity_magnitude = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready
var target_manager = get_node("/root/Node3D/TargetManager")
@onready
var UI_manager = get_node("/root/Node3D/UIManager")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = global_transform.basis.z * projectile_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	duration += delta

	if duration > lifetime:
		queue_free()

	if raycast.is_colliding():
		print("HIT!")
		UI_manager.hit()
		queue_free()

	velocity.y -= gravity_magnitude * delta

	position += velocity * delta

	look_at(global_position + velocity)
