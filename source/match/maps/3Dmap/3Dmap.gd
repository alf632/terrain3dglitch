extends "res://source/match/Map.gd"

@onready var terrain :Terrain3D = find_child("Terrain3D") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _unhandled_input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_RIGHT
		and event.pressed
	):
		var clickPos = event.position
		var p_viewport_camera = get_viewport().get_camera_3d()
		var camera_pos: Vector3 = p_viewport_camera.project_ray_origin(clickPos)
		var camera_dir: Vector3 = p_viewport_camera.project_ray_normal(clickPos)
		var target_point = terrain.get_intersection(camera_pos,camera_dir)
		
		var height = terrain.storage.get_height(target_point)
		print()
		print("clickPos: ", clickPos)
		print("camera_pos: ", camera_pos)
		print("camera_dir: ", camera_dir)
		print("target_point: ", target_point)
		print("height: ", height)
		if target_point.z < 3.4e38:
			MatchSignals.terrain_targeted.emit(target_point)
		else:
			print("target_point not valid")
