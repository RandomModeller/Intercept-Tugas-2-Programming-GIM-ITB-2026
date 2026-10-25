extends Node3D

@export var projectile: PackedScene
@export var missile: PackedScene
@export var muzzle: Node3D
@export var bearing: Node3D
@export var pitch: Node3D
@export var gun_audio: AudioStreamPlayer3D
@export var cooldown: float = 0.1
@export var missile_cooldown: float = 2
@export var turret_rotation_speed: float = 100

var next_shoot_time: float = 0
var next_missile_time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var flag1: bool = Time.get_unix_time_from_system() >= next_shoot_time
	var flag2: bool = Time.get_unix_time_from_system() >= next_missile_time
	
	if Input.is_action_pressed("Shoot"):
		if flag1:
			SpawnBullet()
		if not gun_audio.playing:
			gun_audio.play()
	elif gun_audio.playing:
		gun_audio.stop()

	if Input.is_action_just_pressed("ShootMissile") && flag2:
		SpawnMissile()

func SpawnBullet() -> void:
	var bullet = projectile.instantiate()
	
	add_child(bullet)

	bullet.global_position = muzzle.global_position
	bullet.global_rotation = muzzle.global_rotation
	
	bullet.velocity = muzzle.global_transform.basis.z * bullet.projectile_speed

	next_shoot_time = Time.get_unix_time_from_system() + cooldown

func SpawnMissile() -> void:
	var missile = missile.instantiate()
	
	add_child(missile)

	missile.global_position = muzzle.global_position
	missile.global_rotation = muzzle.global_rotation
	
	missile.velocity = muzzle.global_transform.basis.z * missile.projectile_speed

	next_missile_time = Time.get_unix_time_from_system() + missile_cooldown

func _input(event):
	if event is InputEventMouseMotion:
		bearing.rotation_degrees.y -= event.relative.x * turret_rotation_speed
		pitch.rotation_degrees.x += event.relative.y * turret_rotation_speed
		pitch.rotation_degrees.x = clamp(pitch.rotation_degrees.x, -85, 0)
