extends Camera3D
class_name DebugCamera

@export var move_speed : float = 10.0
@export var cam_sensv : float = 5.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var input_dir : Vector2 = Input.get_vector("MoveLeft", "MoveRight", "MoveBackward", "MoveForward")
	var dir : Vector3 = (transform.basis * Vector3(0, 0, -input_dir.y)).normalized()
	var rot_dir : Vector2 = Input.get_vector("TurnDown", "TurnUp", "TurnRight", "TurnLeft")
	
	global_position += (dir * move_speed) * delta
	global_rotation.x = clamp(global_rotation.x + (rot_dir.x * cam_sensv) * delta, deg_to_rad(-89), deg_to_rad(89))
	global_rotation.y = global_rotation.y + (rot_dir.y * cam_sensv) * delta
	
