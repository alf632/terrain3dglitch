extends Camera3D

const Terrain = preload("res://source/match/Terrain.gd")
const Unit = preload("res://source/match/units/Unit.gd")

@export var mouse_sensitivity = 0.0015
@export var reference_plane_for_rotation = Plane(Vector3.UP, 0.0)

@onready var _unit = get_parent()
@onready var _match = find_parent("Match")
@onready var _PSH = _match.find_child("ProjectileSystemHandler")

func _unhandled_input(event):
	if not current:
		return
		
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90.0, 30.0)
		_unit.rotation.y -= event.relative.x * mouse_sensitivity
	elif event.is_action_pressed("hold_for_command"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event.is_action_released("hold_for_command"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	


# called by minimap
func set_position_safely(target_position: Vector3):
	pass
