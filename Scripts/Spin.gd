extends Node3D

@export var spin_speed: float = 10
@export var directiom: Vector3 = Vector3.FORWARD

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_object_local(directiom, deg_to_rad(spin_speed * delta))
