extends Node

@export var fire_control_system: Node
@export var ballistic_calculator: Node
@export var target_manager: Node
@export var hit_audio: Node3D
@export var hit_icon: Node2D
@export var lead_icon: Node3D
@export var highlight: Node3D
@export var cooldown: float = 0.1
@export var splashes_display: Label
@export var save_manager: Node3D

var disable_icon_time: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Time.get_unix_time_from_system() >= disable_icon_time:
		hit_icon.hide()
	
	if target_manager.target != null and is_instance_valid(target_manager.target):
			lead_icon.position = ballistic_calculator.CalculateDirection(fire_control_system.muzzle.position, target_manager.target.position, 167, target_manager.target.speed)

			highlight.position = target_manager.target.position
	else:
		lead_icon.position = Vector3.RIGHT * 5000
		highlight.position = Vector3.RIGHT * 5000

	splashes_display.text = "Splashes: " + String.num(save_manager.game_data['splashes'])

func hit() -> void:
	hit_icon.show()
	hit_audio.play()
	disable_icon_time = Time.get_unix_time_from_system() + cooldown
