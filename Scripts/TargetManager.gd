extends Node3D

@export var air_target: PackedScene
@export var radar: Node2D
@export var muzzle: Node3D
@export var target: Node3D

var target_list: Array[Node3D] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if randi_range(1, 1200) < 3:
		var new_target = air_target.instantiate()

		add_child(new_target)

		target_list.append(new_target)

		new_target.global_position = Vector3(randf_range(-50, 50), randf_range(40, 70), randf_range(-50, 50))
		new_target.global_rotation_degrees = Vector3(0, 0, -14)

	var new_target_list: Array[Node3D] = []
	for target2 in target_list:
		if is_instance_valid(target2):
			new_target_list.append(target2)

	target_list = new_target_list

	if Input.is_action_just_pressed("Lock"):
		for target2 in target_list:
			var angle = rad_to_deg(-muzzle.get_global_transform().basis.z.angle_to(muzzle.position - target2.position))

			if angle <= -175:
				target = target2
				print(target)
				break
