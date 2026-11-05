class_name MovingTarget
extends Node3D

@export var speed: Vector3 = Vector3(0,0,0)
@export var acceleration: Vector3 = Vector3(0,0,0)
@export var angular_speed: Vector3 = Vector3(0,0,0)
@export var angular_acceleration: Vector3 = Vector3(0,0,0)

@onready
var save_manager = get_node("/root/Node3D/SaveManager")

var velocity: Vector3
var angular_velocity: Vector3

var hp: float = 100

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

func _process(delta: float) -> void:
	if hp <= 0:
		save_manager.game_data['splashes'] += 1
		save_manager.save_game()

		queue_free()
		