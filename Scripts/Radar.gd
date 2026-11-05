extends Node2D

@export var radar_blip: PackedScene
@export var radar_grid: Node2D
@export var turret_direction: Node2D
@export var turret_bearing: Node3D
@export var target_manager: Node3D

var display_scale: float = 1
var blips: Array[Node2D] = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in target_manager.target_list.size() - blips.size():
		var blip = radar_blip.instantiate()

		radar_grid.add_child(blip)

		blips.append(blip)

	for i in blips.size():
		if i >= target_manager.target_list.size() or !is_instance_valid(target_manager.target_list[i]):
			blips[i].position = Vector2.RIGHT * 5000
		else:
			blips[i].position = Vector2(target_manager.target_list[i].position.x, target_manager.target_list[i].position.z) * -display_scale

	turret_direction.rotation_degrees = -turret_bearing.rotation_degrees.y
