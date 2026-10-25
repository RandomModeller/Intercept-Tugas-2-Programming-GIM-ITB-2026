class_name MovingTarget
extends Node3D

@export var speed: Vector3 = Vector3(0,0,0)
@export var acceleration: Vector3 = Vector3(0,0,0)
@export var angular_speed: Vector3 = Vector3(0,0,0)
@export var angular_acceleration: Vector3 = Vector3(0,0,0)

var velocity: Vector3
var angular_velocity: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity += speed
	angular_velocity += angular_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity += acceleration * delta

	translate_object_local(velocity * delta)

	angular_velocity += angular_acceleration * delta

	rotation_degrees += angular_velocity * delta
