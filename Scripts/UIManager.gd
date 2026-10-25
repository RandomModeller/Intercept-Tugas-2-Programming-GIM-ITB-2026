extends Node

@export var hit_audio: Node3D
@export var hit_icon: Node2D
@export var cooldown: float = 0.1

var disable_icon_time: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Time.get_unix_time_from_system() >= disable_icon_time:
		hit_icon.hide()

func hit() -> void:
	hit_icon.show()
	hit_audio.play()
	disable_icon_time = Time.get_unix_time_from_system() + cooldown